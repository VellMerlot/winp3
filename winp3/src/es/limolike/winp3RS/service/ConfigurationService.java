package es.limolike.winp3RS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.service.AppService;
import es.limolike.winp3RS.data.IConfigurationDao;
import es.limolike.winp3RS.domain.Configuration;

@Service
public class ConfigurationService extends AppService implements IConfigurationService {
	
	@Autowired
	private IConfigurationDao configurationDao;

	public IConfigurationDao getConfigurationDao() {
		return configurationDao;
	}
	
	@Override
	public List<Configuration> list() throws AppException {
		
		return this.getConfigurationDao().list();
	}

}
