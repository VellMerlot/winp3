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
import es.limolike.winp3RS.domain.Configuration;
import es.limolike.winp3RS.service.IConfigurationService;

@Component
@Path("/configuration")
public class ConfigurationResource extends Resource implements IConfigurationResource {
	
	@Autowired
	private IConfigurationService configurationService;

	public IConfigurationService getConfigurationService() {
		return configurationService;
	}
	
	@GET
	@Path("/list")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Configuration> list() {
		
		try {
			return (ArrayList<Configuration>) this.getConfigurationService().list();
		} catch (AppException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateConfiguration() {
		// TODO Auto-generated method stub

	}

}
