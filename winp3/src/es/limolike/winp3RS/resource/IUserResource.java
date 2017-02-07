package es.limolike.winp3RS.resource;

import java.util.List;

import javax.ws.rs.core.Response;

import es.limolike.winp3RS.domain.User;



public interface IUserResource {

	public List<User> list();
	
	public Response createUser(User user);
	public void updateUser();
	public void deleteUser();
	public User showUser();
}