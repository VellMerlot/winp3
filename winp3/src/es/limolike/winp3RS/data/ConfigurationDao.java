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

	@Override
	public Configuration get(int configurationId) throws AppException {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("ID", configurationId);

			Configuration config = (Configuration) queryObject(
					"SELECT id, ipc, renta_estimada, cotizacion_autonomos, edad_dependencia, edad_renta, "
							+ " gastos_entierro, costes_herencia, adaptacion_vivienda, adaptacion_vehiculos "
							+ " FROM winp3_sys.app_config where id = :ID",
					params, Configuration.class);

			return config;
		} catch (Exception e) {
			throw new AppException("ERROR get Configuration ");
		}
	}

	@Override
	public int update(Configuration configuration) throws AppException {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("ID", configuration.getId());
			params.put("IPC", configuration.getIpc());
			params.put("RENTA", configuration.getRentaEstimada());
			params.put("COTI", configuration.getCotizacionAutonomos());

			int result = execute("UPDATE winp3_sys.app_config SET ipc=:IPC, renta_estimada=:RENTA ,cotizacion_autonomos=:COTI "
//					+ "edad_dependencia= ,edad_renta= ,gastos_entierro= ,costes_herencia= ,"
//					+ "adaptacion_vivienda= ,adaptacion_vehiculos=  "
					+ "WHERE id = :ID", params);

			if (result == 1)
				commit();
			
			return result;
		} catch (Exception e) {
			throw new AppException("ERROR update Configuration ");
		}
	}

}
