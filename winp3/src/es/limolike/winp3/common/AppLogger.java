package es.limolike.winp3.common;

import org.apache.log4j.Logger;

public class AppLogger {

	//properties
	private Logger logger;

	//constructor method
	public AppLogger(){
		setLogger(Logger.getLogger(this.getClass()));
	}

	//methods
	public void log(String msg){
		log(LogLevel.INFO, msg, null);
	}
	
	public void log(String msg, Throwable t){
		log(LogLevel.INFO, msg, t);
	}
	
	public void log(LogLevel level, String msg){
		log(level, msg, null);
	}

	public void log(LogLevel level, String msg, Throwable t){
		if(level != null && getLogger() != null){
			switch(level){
			case TRACE:
				getLogger().trace(msg, t);
				break;
			case DEBUG:
				getLogger().debug(msg, t);
				break;
			case INFO:
				getLogger().info(msg, t);
				break;
			case WARN:
				getLogger().warn(msg, t);
				break;
			case ERROR:
				getLogger().error(msg, t);
				break;
			case FATAL:
				getLogger().fatal(msg, t);
				break;
			default:;
			}
		}
	}

	//getters and setters
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
}
