package es.limolike.winp3RS.domain;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "simulator")
public class Simulator {
	private int id;
	private String Name;

	public Simulator() {
		// TODO Auto-generated constructor stub
	}

	public Simulator(int id, String name) {
		super();
		this.id = id;
		Name = name;
	}

	public int getId() {
		return id;
	}

	@XmlAttribute
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return Name;
	}

	@XmlElement
	public void setName(String name) {
		Name = name;
	}
	
	
}
