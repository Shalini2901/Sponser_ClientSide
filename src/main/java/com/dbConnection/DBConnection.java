package com.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection connect()
	{
	 Connection con = null;

	 try
	 {
	 Class.forName("com.mysql.jdbc.Driver");
	 //Adding necessary details to connect to the Database server
	 con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/paf_project",
	 "root", "");
	 //For testing
	 System.out.print("Successfully connected");
	 }
	 catch(Exception e)
	 {
	 e.printStackTrace();
	 }

	 return con;
	}
}
