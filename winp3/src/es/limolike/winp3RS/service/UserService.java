package es.limolike.winp3RS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.service.AppService;
import es.limolike.winp3RS.data.IUserDao;
import es.limolike.winp3RS.domain.User;

@Service
public class UserService extends AppService implements IUserService {

	@Autowired
	private IUserDao userDao;

	public IUserDao getUserDao() {
		return userDao;
	}
	
	@Override
	public List<User> list() throws AppException {
		return this.getUserDao().list();
	}
	
}
