package com.godrej.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class SqlInfo {
	final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	final String USER = "system";
	final String PASS = "seema@2019";
	Connection conn;
	public SqlInfo(){
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConn() {
		return conn;
	}
	public String getJDBC_Driver() {
		return JDBC_Driver;
	}
}
