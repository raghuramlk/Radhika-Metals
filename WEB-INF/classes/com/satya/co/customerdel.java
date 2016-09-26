package com.satya.co;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class customerupdate
 */
@WebServlet("/customerdel")
public class customerdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerdel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String cid=request.getParameter("id");

		String h="";
		String errormsg="";
		String conmast="";
		Connection con = null;
		PreparedStatement preparedStatement1=null;
		PreparedStatement preparedStatement=null;
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(cid+""+cid);
		try {
			
		
			Db db=new Db();
			  con = db.getConnection();
			  System.out.println(con);
	
			if(cid!=null||cid!="")
		{		
		String custmast="delete from customer_master where custid='"+cid+"'";
		conmast="delete from concession_master where custid='"+cid+"'";
		 preparedStatement = con.prepareStatement(custmast);
	
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			System.out.println("status"+status);
			 preparedStatement1 = con.prepareStatement(conmast);

			 status1=preparedStatement1.executeUpdate();
			if(status1>=1)
				System.out.println("status"+status1);
			errormsg="Customer Record Deleted Successfully.....";
		}
		else{
			errormsg="Something went wrong.....";
			
		}
		}
		//}
		}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(preparedStatement1!=null)
				try {
					preparedStatement1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(preparedStatement!=null)
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		
		RequestDispatcher rs=request.getRequestDispatcher("./customer.jsp?return="+errormsg);
		rs.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//doGet(request, response);
	
	}

}
