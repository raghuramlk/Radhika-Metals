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
 * Servlet implementation class Meterial
 */
@WebServlet("/Meterial")
public class Meterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Meterial() {
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
		doGet(request, response);
		String mid=request.getParameter("mid");
		String mname=request.getParameter("mname");
		String mprice=request.getParameter("mprice");
		
		String h="";
		String errormsg="";
		String conmast="";
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(mid+""+mname+""+mprice+"");
		try {
			Connection conn = null;
		
			Db db=new Db();
			  conn = db.getConnection();
				
		Statement t= conn.createStatement();
		ResultSet rs=t.executeQuery("select * from meterial_master");
		while(rs.next()){
			 h=rs.getString(2);
			
		}
		if(h.equals(mid))
		{
		errormsg="Customer already existed...";	
		}
		else{
		
			if(mid!=null||mid!="")
		{		
		String custmast="INSERT INTO meterial_master(meterial_id,meterial_name,meterial_price) VALUES (?,?,?)";
		//conmast="INSERT INTO concession_master(custid,vat,cst,welfare) VALUES (?,?,?,?)";
		PreparedStatement preparedStatement = conn.prepareStatement(custmast);
		preparedStatement.setString(1,mid);
		preparedStatement.setString(2,mname);
		preparedStatement.setString(3,mprice);
		/*preparedStatement.setString(4, state);
		preparedStatement.setString(5,phno);
		preparedStatement.setString(6,adress);*/
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			
			/*PreparedStatement preparedStatement1 = conn.prepareStatement(conmast);
			preparedStatement1.setString(1,cid);
			preparedStatement1.setInt(2,Integer.parseInt(vat));
			preparedStatement1.setInt(3,Integer.parseInt(cst));
			preparedStatement1.setInt(4,Integer.parseInt(welfare));
			 status1=preparedStatement1.executeUpdate();
			if(status1>=1)*/
			errormsg="Meterial Record Inserted Successfully.....";
		}
	
		}
		}
		}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//String block="Customer Record Inserted Successfully.....";
		
		RequestDispatcher rs=request.getRequestDispatcher("./meterial.jsp?return="+errormsg);
		rs.forward(request,response);
		
	}

}
