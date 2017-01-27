package es.limolike.winp3.data;

import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.common.Base;
import es.limolike.winp3.common.LogLevel;

@Repository
public abstract class Dao extends Base implements IDao {

	//constants
	String msgClass = this.getClass().getName() + ": ";
	String msgStmt = msgClass + "Executing statement => ";
	String msgRows = msgClass + "Returned rows => ";
	String msgError = msgClass + "Error executing";
	String msgThrow = "Error in data access";

	//properties
	private DataSource dataSource;
	private Savepoint savepoint;
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	//methods		
	public Integer execute(String statement, Map<String,Object> params) throws AppException {
		try {
			log(LogLevel.DEBUG, msgStmt + statement, null);
			Integer result = getNamedParameterJdbcTemplate().update(statement, params);
			log(LogLevel.DEBUG, msgRows + result, null);
			return result;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+statement+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}

	public Object query(String statement, Map<String,Object> params, Class<?> elementType) throws AppException {
		Object result = null;
		
		try {
			log(LogLevel.DEBUG, msgStmt + statement, null);	
			result = getNamedParameterJdbcTemplate().queryForObject(statement, params, elementType);
			if (result != null){
				result = elementType.cast(result);	
				log(LogLevel.DEBUG, msgRows + result, null);
			}
			return result;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+statement+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}

	public Object queryObject(String statement, Map<String,Object> params, Class<?> elementType) throws AppException {
		Object result = null;
		try {
			log(LogLevel.DEBUG, msgStmt + statement, null);
			result = elementType.cast(result);	
			result = getNamedParameterJdbcTemplate().queryForObject(statement, params, ParameterizedBeanPropertyRowMapper.newInstance(elementType));
			log(LogLevel.DEBUG, msgRows + result, null);
			
		} catch (EmptyResultDataAccessException ex) {
			//log(LogLevel.ERROR, msgError + " [EmptyResultData]", ex);
			result = null;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+statement+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
		
		return result;
	}

	public List<Map<String,Object>> queryList(String query, Map<String,Object> params) throws AppException {
		try{
			log(LogLevel.DEBUG, msgStmt + query, null);
			List<Map<String,Object>> result = getNamedParameterJdbcTemplate().queryForList(query, params);

			Integer rows = null;
			if(result!=null){
				rows = result.size();
			}
			log(LogLevel.DEBUG, msgRows + rows, null);
			return result;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+query+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}
		
	/**
	 * elementType - the required type of element in the result list (for example, Integer.class)
	 * */	
	public List<?> queryList(String query, Map<String,Object> params, Class<?> elementType) throws AppException {
		try{
			log(LogLevel.DEBUG, msgStmt + query, null);
			List<?> result = getNamedParameterJdbcTemplate().queryForList(query, params,elementType);

			Integer rows = null;
			if(result!=null){
				rows = result.size();
			}
			log(LogLevel.DEBUG, msgRows + rows, null);
			return result;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+query+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<?> queryListBean(String query, Map<String,Object> params, Class<?> elementType) throws AppException {
		try{
			log(LogLevel.DEBUG, msgStmt + query, null);
			List<?> result = getNamedParameterJdbcTemplate().query(query, params, new BeanPropertyRowMapper(elementType));

			Integer rows = null;
			if(result!=null){
				rows = result.size();
			}
			log(LogLevel.DEBUG, msgRows + rows, null);
			return result;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+query+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}

	public Integer count(String query, Map<String,Object> params) throws AppException {
		try{
			log(LogLevel.DEBUG, msgStmt + query, null);
			Integer result = getNamedParameterJdbcTemplate().queryForInt(query, params);
			log(LogLevel.DEBUG, msgRows + result, null);
			return result;
		} catch (EmptyResultDataAccessException ex) {
			return 0;
		} catch(DataAccessException e){
			log(LogLevel.ERROR, msgError + " ["+query+"]", e);
			throw new AppException("ERROR", msgThrow, e);
		}
	}

	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return namedParameterJdbcTemplate;
	}

	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		setNamedParameterJdbcTemplate(new NamedParameterJdbcTemplate(dataSource));
		//setSimpleJdbcCall(new SimpleJdbcCall(dataSource));
	}

	public void setAutocommit(boolean commit){
		try {
			System.out.println("AutoCommit Value is :::: **** : " + getDataSource().getConnection().getAutoCommit());
			getDataSource().getConnection().setAutoCommit(commit);
			System.out.println("AutoCommit Value is :::: **** : " + getDataSource().getConnection().getAutoCommit());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void commit(){
		try {
			getDataSource().getConnection().commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void rollback(){
		try {
			getDataSource().getConnection().rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void rollbackToSavepoint(){
		try {
			getDataSource().getConnection().rollback(savepoint);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void rollbackToSavepoint(Savepoint sp){
		try {
			getDataSource().getConnection().rollback(sp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setPointsave(){
		try {
			savepoint = getDataSource().getConnection().setSavepoint();
		} catch (SQLException e) {
			savepoint = null;
			e.printStackTrace();
		}
	}
	
	public Savepoint setPointsave(String name){
		try {
			return getDataSource().getConnection().setSavepoint(name);
		} catch (SQLException e) {
			savepoint = null;
			e.printStackTrace();
		}
		
		return null;
	}
}
