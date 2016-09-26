package com.satya.co;
import java.sql.*;
public class Db 
{
	
	public  Connection getConnection(){
		Connection conn = null;
	try{
	
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "radhika";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";		
	String query="";
	
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url+dbName,userName,password);
	
	  } catch (Exception e) {
	  e.printStackTrace();
}
	return conn;
}}
