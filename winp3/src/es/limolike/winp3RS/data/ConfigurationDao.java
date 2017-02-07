package es.limolike.winp3RS.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.data.Dao;
import es.limolike.winp3RS.domain.Configuration;

@Repository
public class ConfigurationDao extends Dao implements IConfigurationDao {

	@Override
	@SuppressWarnings("unchecked")
	public List<Configuration> list() throws AppException {

		try {
			Map<String, Object> params = new HashMap<String, Object>();

			List<Configuration> values = (List<Configuration>) queryListBean(
					"SELECT id, ipc, renta_estimada, cotizacion_autonomos, edad_dependencia, edad_renta, "
					+ " gastos_entierro, costes_herencia, adaptacion_vivienda, adaptacion_vehiculos "
					+ " FROM winp3_sys.app_config",
					params, Configuration.class);

			return values;
		} catch (Exception e) {
			throw new AppException("ERROR list");
		}
	}

}
