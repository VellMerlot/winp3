package es.limolike.winp3RS.service;

import java.util.List;

import org.springframework.stereotype.Service;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3RS.domain.User;

@Service
public interface IUserService {


	public List<User> list() throws AppException;
}