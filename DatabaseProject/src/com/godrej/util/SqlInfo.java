package com.godrej.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SqlInfo {
	final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
	final String USER = "system";
	final String PASS = "seema@2019";
	Connection conn;
	Statement stmt;
	public SqlInfo(){
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", USER, PASS);
			stmt =conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Statement getStmt() {
		return stmt;
	}
	public String getJDBC_Driver() {
		return JDBC_Driver;
	}
}
