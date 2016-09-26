package com.satya.co;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class meterialupdate
 */
@WebServlet("/meterialupdate")
public class meterialupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public meterialupdate() {
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
		String mid=request.getParameter("mid");
		String mname=request.getParameter("mname");
		String mprice=request.getParameter("mprice");
		
		String h="";
		String errormsg="";
		String conmast="";
		Connection con = null;
		
		PreparedStatement preparedStatement=null;
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(mid+""+mid+""+mname+""+mprice+"");
		try {
			
		
			Db db=new Db();
			  con = db.getConnection();
			  System.out.println(con);
	
			if(mid!=null||mid!="")
		{		
		String custmast="update meterial_master set meterial_id='"+mid+"',meterial_name='"+mname+"',meterial_price='"+mprice+"' where meterial_id='"+mid+"'";
		//conmast="update concession_master set custid='"+cid+"',vat='"+vat+"',cst='"+cst+"',welfare='"+welfare+"' where custid='"+cid+"'";
		 preparedStatement = con.prepareStatement(custmast);
	
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			System.out.println("status"+status);
			// preparedStatement1 = con.prepareStatement(conmast);

			// status1=preparedStatement1.executeUpdate();
			//if(status1>=1)
			//	System.out.println("status"+status1);
			errormsg="Meterial Record Updated Successfully.....";
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
		
		
		RequestDispatcher rs=request.getRequestDispatcher("./meterial.jsp?return="+errormsg);
		rs.forward(request,response);
	}

}
