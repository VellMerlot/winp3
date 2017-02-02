package es.limolike.winp3RS.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.data.Dao;
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
}