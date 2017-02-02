package es.limolike.winp3.common;

import org.apache.log4j.Logger;

public interface IAppLogger {
	
	public Logger getLogger();
	
	public void log(String msg);
	
	public void log(String msg, Throwable t);
	
	public void log(LogLevel level, String msg);

	public void log(LogLevel level, String msg, Throwable t);
}
