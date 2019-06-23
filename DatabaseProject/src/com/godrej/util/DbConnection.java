package com.godrej.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	final String USER = "system";
	final String PASS =  "system"; //"seema@2019";
	Connection conn;
	public DbConnection(){
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getJDBC_Driver() {
		return JDBC_Driver;
	}
	public Connection getConn() {
		return conn;
	}
}
