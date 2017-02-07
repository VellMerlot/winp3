package es.limolike.winp3RS.resource;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sun.jersey.multipart.FormDataParam;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.resource.Resource;
import es.limolike.winp3.util.StringUtils;
import es.limolike.winp3RS.domain.User;
import es.limolike.winp3RS.service.IUserService;

@Component
@Path("/users")
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

	@POST
	@Path("/create2")
	@Consumes("application/json")
	public Response createUser(User user) {
		String result = "Track saved : " + user;
		return Response.status(201).entity(result).build();
	}
	
	@POST
	@Path("/update")
	public void updateUser() {
		
	}
	
	@POST
	@Path("/delete")
	public void deleteUser() {
		
	}
	
	
	/*
	 * 
@POST
@Consumes({MediaType.APPLICATION_JSON})
@Produces({MediaType.TEXT_HTML})
@Transactional
public Response createPodcast(Podcast podcast) {
	Long id = podcastDao.createPodcast(podcast);

	return Response.status(201).entity(buildNewPodcastResourceURL(id)).build();
}



http://www.codingpedia.org/ama/restful-web-services-example-in-java-with-jersey-spring-and-mybatis/
	 * */
	
	@GET
	@Path("/password")
	@Produces(MediaType.APPLICATION_JSON)
	public String newPassword() {
		return StringUtils.generaPassword();
		
	}
	
	@GET
	@Path("/find")
	@Produces(MediaType.APPLICATION_JSON)
	public User showUser() {
		
		
		System.out.println( StringUtils.generaPassword() );
		
		User user = new User();
		user.setEmail("a@a.com");
		user.setFirstName("pepito");
		user.setId(111111);
		user.setLastName("palotes");
		user.setRole(1);
		user.setStatus(1);
		user.setUserName("pepepe");
		return user;
	}
}
