<%@ page language="java" import="java.sql.*,java.io.*"%>
<% 
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "radhika";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "";		
String query="";
ResultSet rs=null;
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password);
Statement st=null;
  } catch (Exception e) {
  e.printStackTrace();
  }
%>