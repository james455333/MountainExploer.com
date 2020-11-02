package dB;


import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class DataS {
	
//	public static final String JNDI_DB_NAME = "java:comp/env/jdbc/xe";
//	DataSource ds = null;
//	public DataS() {
//		try {
//			Context	ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup(JNDI_DB_NAME);
//		} catch (NamingException e) {
//			e.printStackTrace();
//			throw new RuntimeException("DataS()#建構子發生例外 : " + e.getMessage());
//		}
//		
//	}
private DataSource datasoure;
	
	private String username ;
	private String userPassword;

	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		this.username = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public DataSource getDatasoure() {
		
		if (datasoure == null) {
			BasicDataSource ds = new BasicDataSource();
			ds.setDriverClassName("oracle.jdbc.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@//localhost:1521/xepdb1");
			ds.setUsername(getUsername());
			ds.setPassword(getUserPassword());
			ds.setMaxTotal(30); 
			ds.setMaxIdle(30);   
			datasoure = ds; 
		}
		return datasoure;
	}
	
	
	
	

}
