package es.limolike.winp3RS.domain;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Configuration {
	
	private int id;
	private Double ipc;
	private Double rentaEstimada;
	private Double cotizacionAutonomos;
	private int edadDependencia;
	private int edadRenta;
	private int gastosEntierro;
	private int costesHerencia;
	private int adaptacionVivienda;
	
	public Configuration() {
	}
	
	public Configuration(int id, Double ipc, Double rentaEstimada, Double cotizacionAutonomos, int edadDependencia, int edadRenta,
			int gastosEntierro, int costesHerencia, int adaptacionVivienda, int adaptacionVehiculos) {
		super();
		this.id = id;
		this.ipc = ipc;
		this.rentaEstimada = rentaEstimada;
		this.cotizacionAutonomos = cotizacionAutonomos;
		this.edadDependencia = edadDependencia;
		this.edadRenta = edadRenta;
		this.gastosEntierro = gastosEntierro;
		this.costesHerencia = costesHerencia;
		this.adaptacionVivienda = adaptacionVivienda;
		this.adaptacionVehiculos = adaptacionVehiculos;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Double getIpc() {
		return ipc;
	}
	public void setIpc(Double ipc) {
		this.ipc = ipc;
	}
	public Double getRentaEstimada() {
		return rentaEstimada;
	}
	public void setRentaEstimada(Double rentaEstimada) {
		this.rentaEstimada = rentaEstimada;
	}
	public Double getCotizacionAutonomos() {
		return cotizacionAutonomos;
	}
	public void setCotizacionAutonomos(Double cotizacionAutonomos) {
		this.cotizacionAutonomos = cotizacionAutonomos;
	}
	public int getEdadDependencia() {
		return edadDependencia;
	}
	public void setEdadDependencia(int edadDependencia) {
		this.edadDependencia = edadDependencia;
	}
	public int getEdadRenta() {
		return edadRenta;
	}
	public void setEdadRenta(int edadRenta) {
		this.edadRenta = edadRenta;
	}
	public int getGastosEntierro() {
		return gastosEntierro;
	}
	public void setGastosEntierro(int gastosEntierro) {
		this.gastosEntierro = gastosEntierro;
	}
	public int getCostesHerencia() {
		return costesHerencia;
	}
	public void setCostesHerencia(int costesHerencia) {
		this.costesHerencia = costesHerencia;
	}
	public int getAdaptacionVivienda() {
		return adaptacionVivienda;
	}
	public void setAdaptacionVivienda(int adaptacionVivienda) {
		this.adaptacionVivienda = adaptacionVivienda;
	}
	public int getAdaptacionVehiculos() {
		return adaptacionVehiculos;
	}
	public void setAdaptacionVehiculos(int adaptacionVehiculos) {
		this.adaptacionVehiculos = adaptacionVehiculos;
	}
	private int adaptacionVehiculos;
}
