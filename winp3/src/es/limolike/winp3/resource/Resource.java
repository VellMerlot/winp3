package es.limolike.winp3.resource;

import java.util.Locale;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import es.limolike.winp3.common.Base;

@Component
public abstract class Resource extends Base implements IResource {
	
	@Context
    UriInfo uriInfo;
	
	@Autowired
	protected MessageSource messageSource;
	
	// methods
	@GET
	@Path("/ping")
	public Response ping() {
		return Response.status(200).entity("OK. Servidor activo").build();
	}
	
	protected String getMessage(String code, Object[] object, Locale locale) {
	    return messageSource.getMessage(code, object, locale);
	}

}
