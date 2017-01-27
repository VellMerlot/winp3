package es.limolike.winp3MVC.util;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import es.limolike.winp3.common.Base;

public class DbUtil extends Base {

	private DataSource dataSource;

	@Autowired
	Properties propConfig;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void initialize(){
		System.out.println("DbUtil.initialize() *************************************** ");
	}
	
}