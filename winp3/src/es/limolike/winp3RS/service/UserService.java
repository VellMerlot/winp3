package es.limolike.winp3RS.service;

import java.util.List;

import org.springframework.stereotype.Service;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.service.AppService;
import es.limolike.winp3RS.domain.User;

@Service
public class UserService extends AppService implements IUserService {

	@Override
	public List<User> list() throws AppException {
		// TODO Auto-generated method stub
		return null;
	}
	
}
