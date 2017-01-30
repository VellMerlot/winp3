package es.limolike.winp3RS.domain;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class User {
	
	private int id;
	private String username;
	private String password;
	private int role;
	private int status;
}