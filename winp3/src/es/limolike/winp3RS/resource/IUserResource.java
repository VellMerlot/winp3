package es.limolike.winp3RS.resource;

import java.util.List;

import es.limolike.winp3RS.domain.User;



public interface IUserResource {

	public List<User> list();
	public User getUser();
}