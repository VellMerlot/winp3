package es.limolike.winp3RS.resource;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import es.limolike.winp3RS.domain.Simulator;

@Path("/")
public class RootResource {

	@GET
	@Produces(MediaType.TEXT_HTML)	
	public String index(@Context HttpServletRequest request) {
		System.out.println("RootResource: index");
		return "/page";
	}


	@GET
	@Path("/generate/{name}")
	@Produces(MediaType.APPLICATION_XML)
	public Simulator responseMsg( @PathParam("name") String name ) {
		Simulator st = new Simulator(1, name);
		return st;
	}

}
