package es.limolike.winp3RS.resource;

import javax.servlet.http.HttpServletRequest;

import es.limolike.winp3RS.domain.Simulator;



public interface ISimResource {

	public Simulator upload(HttpServletRequest request);
	
}