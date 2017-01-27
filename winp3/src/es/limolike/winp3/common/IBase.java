package es.limolike.winp3.common;

public interface IBase extends IAppLogger {
	
	public String getExportSetupFilename();
	
	public String getExportSetupFolder();
	
	public String getFilenameZip();
	
	public String getToken();
	
	public String getInstance();
	
	public String getRootFolder();
		
	public String getFilename();

	public String getFilenameFolder();

	public String getFilenameFolderTemp();

	public String getServerUrl();

	public String getTomcatUrl();

	public String getTomcatUsername();

	public String getTomcatPassword();

	public String getTomcatPath();

	public String getClinusUrl();

	public String getExportIntanceFilename();

	public String getExportRegionFilename();
	
	public String getExportFolder();

	public String getExportAppFilename();

	public String getExportDataFilename();
	
	public String getNotificationFolder();
	
	public String getNotificationFilename();
	
	public String getNotificationZip();
	
	public String getRunType();
	
	public String getProxyHost();
	
	public String getProxyPort();
	
	public String getWorkFolders();

	public String getClinusFolders();
}
