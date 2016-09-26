package com.satya.co;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.satya.co.Db;
/**
 * Servlet implementation class Customer
 */
@WebServlet("/Customer")
public class Customer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String cid=request.getParameter("cid");
		String cname=request.getParameter("cname");
		String adress=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String vat=request.getParameter("vat");
		String welfare=request.getParameter("welfare");
		String cst=request.getParameter("cst");
		String phno=request.getParameter("phone");
		String h="";
		String errormsg="";
		String conmast="";
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(cid+""+cname+""+adress+""+city+""+state+""+vat+""+welfare+""+cst);
		try {
			Connection conn = null;
			 // String url = "jdbc:mysql://localhost:3306/";
			//  String dbName = "radhika";
			//  String driver = "com.mysql.jdbc.Driver";
			 // String userName = "root"; 
			////  String password = "";			
			//  Class.forName(driver).newInstance();
			Db db=new Db();
			  conn = db.getConnection();
					  ///DriverManager.getConnection(url+dbName,userName,password);
		Statement t= conn.createStatement();
		ResultSet rs=t.executeQuery("select * from customer_master");
		while(rs.next()){
			 h=rs.getString(2);
			
		}
		if(h.equals(cid))
		{
		errormsg="Customer already existed...";	
		}
		else{
		
			if(cid!=null||cid!="")
		{		
		String custmast="INSERT INTO customer_master(custid,name,city,state,phoneno,address) VALUES (?,?,?,?,?,?)";
		conmast="INSERT INTO concession_master(custid,vat,cst,welfare) VALUES (?,?,?,?)";
		PreparedStatement preparedStatement = conn.prepareStatement(custmast);
		preparedStatement.setString(1,cid);
		preparedStatement.setString(2,cname);
		preparedStatement.setString(3,city);
		preparedStatement.setString(4, state);
		preparedStatement.setString(5,phno);
		preparedStatement.setString(6,adress);
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			
			PreparedStatement preparedStatement1 = conn.prepareStatement(conmast);
			preparedStatement1.setString(1,cid);
			preparedStatement1.setInt(2,Integer.parseInt(vat));
			preparedStatement1.setInt(3,Integer.parseInt(cst));
			preparedStatement1.setInt(4,Integer.parseInt(welfare));
			 status1=preparedStatement1.executeUpdate();
			if(status1>=1)
			errormsg="Customer Record Inserted Successfully.....";
		}
	
		}
		}
		}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//String block="Customer Record Inserted Successfully.....";
		
		RequestDispatcher rs=request.getRequestDispatcher("./customer.jsp?return="+errormsg);
		rs.forward(request,response);
		
			
		
		
		
	}

}
