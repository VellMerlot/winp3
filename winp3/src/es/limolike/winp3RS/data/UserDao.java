package es.limolike.winp3RS.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.common.Result;
import es.limolike.winp3.data.Dao;
import es.limolike.winp3.util.StringUtils;
import es.limolike.winp3RS.domain.User;

@Repository
public class UserDao extends Dao implements IUserDao {
		
	@SuppressWarnings("unchecked")
	public List<User> list() throws AppException {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
						
			List<User> values = (List<User>) queryListBean("SELECT u.id, u.user_name, u.password, u.first_name, u.last_name, u.email, u.status, "
					+ " up.user_profile_id as role FROM winp3_sys.app_user u, winp3_sys.app_user_user_profile up where u.id = up.user_id "
					+ " order by u.id", params, User.class);
						
			return values;
		}
		catch (Exception e) {
			throw new AppException("ERROR list");
		}
	}

	@Override
	public User get(int userId) throws AppException {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("ID", userId);
			
			User values = (User) queryObject("SELECT u.id, u.user_name, u.password, u.first_name, u.last_name, u.email, u.status, "
					+ " up.user_profile_id as role FROM winp3_sys.app_user u, winp3_sys.app_user_user_profile up where u.id = up.user_id and u.id = :ID", params, User.class);
						
			return values;
		}
		catch (Exception e) {
			throw new AppException("ERROR list");
		}
	}
	
	@Transactional
	public Result saveOrUpdate(User user) throws AppException {

		try {
			Map<String,Object> params = new HashMap<String,Object>();

			String sql_query = "";
			if (user.getId() == 0){
				sql_query = "INSERT INTO winp3_sys.app_user (user_name, password, first_name, last_name, email) " + 
							" VALUES (:user_name, :password, :first_name, :last_name, :email)";
				
				params.put("user_name", user.getUserName());
				
			} else {
				params.put("id", user.getId());
				sql_query = "UPDATE winp3_sys.app_user SET password = :password, first_name = :first_name, "
						+ " last_name = :last_name, email = :email WHERE id = :id";
			}
			params.put("password", StringUtils.encriptaPassword(user.getPassword()));
			params.put("first_name", user.getFirstName());
			params.put("last_name", user.getLastName());
			params.put("email", user.getEmail());
			
			int result = execute(sql_query, params);

			if (result != 1)
				throw new AppException("ERROR update. ("+result+")");

			if (user.getId() == 0){
				sql_query = "SELECT id, user_name, password, first_name, last_name, email, status FROM winp3_sys.app_user where user_name = :user_name";
				User u = (User) queryObject(sql_query, params, User.class);
				
				if (u.getId() != 0){
					params.put("id", user.getId());
					params.put("user_profile_id", user.getRole());
					sql_query = "INSERT INTO winp3_sys.app_user_user_profile (user_id, user_profile_id) VALUES (:user_id, :user_profile_id)";
					result = execute(sql_query, params);
					
					if (result != 1)
						throw new AppException("ERROR update. ("+result+")");
				}
			}
			
			return Result.OK;
		} 
		catch(Exception e) {
			throw new AppException("ERROR update: "+e.getMessage());
		}
	}
	
	@Transactional
	public Result updateStatus(User user) throws AppException {

		try {
			Map<String,Object> params = new HashMap<String,Object>();

			String sql_query = "";
			
			sql_query = "UPDATE winp3_sys.app_user SET status = :status WHERE id = :id";
			params.put("id", user.getId());
			params.put("status", user.getStatus());
			
			int result = execute(sql_query, params);

			if (result != 1)
				throw new AppException("ERROR updateStatus. ("+result+")");

			return Result.OK;
		} 
		catch(Exception e) {
			throw new AppException("ERROR updateStatus: "+e.getMessage());
		}
	}
}