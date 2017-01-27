package es.limolike.winp3.data;

import java.sql.Savepoint;
import java.util.List;
import java.util.Map;

import es.limolike.winp3.common.AppException;

public interface IDao {

	public Integer execute(String statement, Map<String,Object> params) throws AppException;
	
	public Object query(String statement, Map<String,Object> params, Class<?> elementType) throws AppException;
	
	public Object queryObject(String statement, Map<String,Object> params, Class<?> elementType) throws AppException;

	public List<Map<String,Object>> queryList(String query, Map<String,Object> params) throws AppException;
	public List<?> queryList(String query, Map<String,Object> params, Class<?> elementType) throws AppException;
	public List<?> queryListBean(String query, Map<String,Object> params, Class<?> elementType) throws AppException;
	
	public Integer count(String query, Map<String,Object> params) throws AppException;
	
	public void setAutocommit(boolean commit) throws AppException;
	public void commit() throws AppException;
	public void rollback() throws AppException;
	public void rollbackToSavepoint() throws AppException;
	public void rollbackToSavepoint(Savepoint sp) throws AppException;
	public void setPointsave() throws AppException;
	public Savepoint setPointsave(String name) throws AppException;
}
