package es.limolike.winp3RS.resource;

import java.util.List;
import es.limolike.winp3RS.domain.Configuration;

public interface IConfigurationResource {

	public List<Configuration> list();
	
	public void updateConfiguration();
}