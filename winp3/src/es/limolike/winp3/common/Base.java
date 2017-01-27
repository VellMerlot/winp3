package es.limolike.winp3.common;

import org.springframework.beans.factory.annotation.Value;

public class Base extends AppLogger {
	
	// constants
	@Value("${app.rootFolder}")
	private	String rootFolder;

	@Value("${app.filename}")
	private String filename;

	@Value("${app.filenameFolder}")
	private String filenameFolder;

	@Value("${app.filenameFolderTemp}")
	private String filenameFolderTemp;
	
	@Value("${app.server.url}")
	private String serverUrl; 
	
	@Value("${app.tomcat.url}")
	private String tomcatUrl; 
	
	@Value("${app.tomcat.username}")
	private String tomcatUsername; 
	
	@Value("${app.tomcat.password}")
	private String tomcatPassword; 
	
	@Value("${app.tomcat.path}")
	private String tomcatPath; 
	
	@Value("${app.clinus.url}")
	private String clinusUrl; 
	
	@Value("${app.export.intance.filename}")
	private String exportIntanceFilename; 
	
	@Value("${app.export.region.filename}")
	private String exportRegionFilename; 
	
	@Value("${app.export.app.filename}")
	private String exportAppFilename; 
	
	@Value("${app.export.data.filename}")
	private String exportDataFilename; 
	
	@Value("${app.export.folder}")
	private String exportFolder; 
	
	@Value("${app.instance}")
	private String instance; 
	
	@Value("${app.token}")
	private String token; 
	
	//
	@Value("${app.proxyHost}")
	private String proxyHost; 
	
	@Value("${app.proxyPort}")
	private String proxyPort; 
		
	//
	@Value("${app.filename.zip}")
	private String filenameZip;
	
	@Value("${app.export.setup.folder}")
	private String exportSetupFolder; 
	
	@Value("${app.export.setup.filename}")
	private String exportSetupFilename; 
	
	@Value("${app.work.folders}")
	private String workFolders; 
	
	@Value("${app.clinus.folders}")
	private String clinusFolders; 
	
	@Value("${app.notification.folder}")
	private String notificationFolder;
	
	@Value("${app.notification.filename}")
	private String notificationFilename; 
	
	@Value("${app.notification.zip}")
	private String notificationZip; 
	
	@Value("${scheduler.runType}")
	private String runType; 
	
	//
	
	/* Getters */
	public String getExportSetupFilename() {
		return exportSetupFilename;
	}
	
	public String getExportSetupFolder() {
		return exportSetupFolder;
	}
	
	public String getFilenameZip() {
		return filenameZip;
	}
	
	public String getToken() {
		return token;
	}
	
	public String getInstance() {
		return instance;
	}
	
	public String getRootFolder() {
		return rootFolder;
	}
		
	public String getFilename() {
		return filename;
	}

	public String getFilenameFolder() {
		return filenameFolder;
	}

	public String getFilenameFolderTemp() {
		return filenameFolderTemp;
	}

	public String getServerUrl() {
		return serverUrl;
	}

	public String getTomcatUrl() {
		return tomcatUrl;
	}

	public String getTomcatUsername() {
		return tomcatUsername;
	}

	public String getTomcatPassword() {
		return tomcatPassword;
	}

	public String getTomcatPath() {
		return tomcatPath;
	}

	public String getClinusUrl() {
		return clinusUrl;
	}

	public String getExportIntanceFilename() {
		return exportIntanceFilename;
	}

	public String getExportRegionFilename() {
		return exportRegionFilename;
	}
	
	public String getExportFolder() {
		return exportFolder;
	}

	public String getExportAppFilename() {
		return exportAppFilename;
	}

	public String getExportDataFilename() {
		return exportDataFilename;
	}
	
	public String getNotificationFolder() {
		return notificationFolder;
	}
	
	public String getNotificationFilename() {
		return notificationFilename;
	}
	
	public String getNotificationZip() {
		return notificationZip;
	}
	
	public String getRunType() {
		return runType;
	}

	public String getProxyHost() {
		return proxyHost;
	}

	public String getProxyPort() {
		return proxyPort;
	}

	public String getWorkFolders() {
		return workFolders;
	}

	public String getClinusFolders() {
		return clinusFolders;
	}
}
