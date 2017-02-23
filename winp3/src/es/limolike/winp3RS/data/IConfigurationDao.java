package es.limolike.winp3RS.data;

import java.util.List;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.common.Result;
import es.limolike.winp3RS.domain.Configuration;

public interface IConfigurationDao {

	public List<Configuration> list() throws AppException;
	public Configuration get(int configurationId) throws AppException;
	public Result update(Configuration configuration) throws AppException;
}
