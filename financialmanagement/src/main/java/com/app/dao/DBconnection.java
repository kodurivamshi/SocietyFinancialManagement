package com.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	private Connection con;
	public Connection connection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/xxxxxxxx?useSSL=true&verifyServerCertificate=false", "xxxxxx", "xxxxxx");
		return con;
	}
}
