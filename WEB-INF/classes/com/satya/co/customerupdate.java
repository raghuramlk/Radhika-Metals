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
@WebServlet("/customerupdate")
public class customerupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerupdate() {
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
		Connection con = null;
		PreparedStatement preparedStatement1=null;
		PreparedStatement preparedStatement=null;
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(cid+""+cname+""+adress+""+city+""+state+""+vat+""+welfare+""+cst);
		try {
			
		
			Db db=new Db();
			  con = db.getConnection();
			  System.out.println(con);
	
			if(cid!=null||cid!="")
		{		
		String custmast="update customer_master set custid='"+cid+"',name='"+cname+"',city='"+city+"',state='"+state+"',phoneno='"+phno+"',address='"+adress+"' where custid='"+cid+"'";
		conmast="update concession_master set custid='"+cid+"',vat='"+vat+"',cst='"+cst+"',welfare='"+welfare+"' where custid='"+cid+"'";
		 preparedStatement = con.prepareStatement(custmast);
	
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			System.out.println("status"+status);
			 preparedStatement1 = con.prepareStatement(conmast);

			 status1=preparedStatement1.executeUpdate();
			if(status1>=1)
				System.out.println("status"+status1);
			errormsg="Customer Record Updated Successfully.....";
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

}
