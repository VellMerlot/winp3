package es.limolike.winp3.common;

public class AppException extends Exception {

	private static final long serialVersionUID = -459894243312697721L;
	
	
	//properties
	private String code;
	private String desc;

	//constructors
	public AppException(){
		super();
	}

	public AppException(String message){
		super(message);
		setDesc(message);
	}

	public AppException(String message, Throwable t){
		super(t);
		setDesc(message);
	}

	public AppException(Throwable t){
		super(t);
	}

	public AppException(String code, String message){
		super(message);
		setCode(code);
		setDesc(message);
	}

	public AppException(String code, String message, Throwable t){
		super(t);
		setCode(code);
		setDesc(message);
	}

	//getters and setters
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
