package es.limolike.winp3.common;

import org.springframework.beans.factory.annotation.Value;

public class Base extends AppLogger {
	
	// constants
	@Value("${app.rootFolder}")
	private	String rootFolder;

	@Value("${app.export.folder}")
	private String exportFolder;

	@Value("${app.load.folder}")
	private String loadFolder;

	@Value("${app.log.folder}")
	private String logFolder;
	
	
	/* Getters */
	public String getRootFolder() {
		return rootFolder;
	}
	
	public String getExportFolder() {
		return exportFolder;
	}
	
	public String getLoadFolder() {
		return loadFolder;
	}
	
	public String getLogFolder() {
		return logFolder;
	}
}
