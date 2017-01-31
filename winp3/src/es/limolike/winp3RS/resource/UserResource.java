package es.limolike.winp3RS.resource;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.resource.Resource;
import es.limolike.winp3RS.domain.User;
import es.limolike.winp3RS.service.IUserService;

@Component
@Path("/user")
public class UserResource extends Resource implements IUserResource {
	
	@Autowired
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	@GET
	@Path("/list")
	@Produces({MediaType.APPLICATION_JSON})
	public List<User> list() {
		try {
			return (ArrayList<User>) this.getUserService().list();
		} catch (AppException e) {
			e.printStackTrace();
		}
		return null;
	}
}
