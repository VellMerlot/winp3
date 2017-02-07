package es.limolike.winp3RS.data;

import java.util.List;
import es.limolike.winp3.common.AppException;
import es.limolike.winp3RS.domain.User;


public interface IUserDao {

	public List<User> list() throws AppException;

	public User get(int userId) throws AppException;
}