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
@WebServlet("/deliveryupdate")
public class deliveryupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deliveryupdate() {
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
		String dcid=request.getParameter("dcid");
		String dcdate=request.getParameter("dcdate");
		String custid=request.getParameter("custid");
		String meterialid=request.getParameter("meterialid");
		String truckno=request.getParameter("truckno");
		String quantity=request.getParameter("quantity");
		int mtotal=0;
		String mprice="";
		String h="";
		String errormsg="";
		String conmast="";
		Connection con = null;
		PreparedStatement preparedStatement1=null;
		PreparedStatement preparedStatement=null;
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(dcid+""+dcdate+""+custid+""+meterialid+""+truckno+""+quantity+"");
		try {
			
		
			Db db=new Db();
			  con = db.getConnection();
			  System.out.println(con);
			  Statement sst=con.createStatement();
				
				ResultSet rs3=sst.executeQuery("select meterial_price from meterial_master where meterial_id='"+meterialid+"'");
				while(rs3.next()){
					
					mprice=rs3.getString(1);
		            mtotal=Integer.parseInt(mprice)*Integer.parseInt(quantity);		
				}
			if(dcid!=null||dcid!="")
		{		
		String custmast="update dc_master set dc_id='"+dcid+"',custid='"+custid+"',dc_date='"+dcdate+"',meterial_id='"+meterialid+"',truckno='"+truckno+"',quantity='"+quantity+"',total="+mtotal+" where dc_id='"+dcid+"'";
		
		 preparedStatement = con.prepareStatement(custmast);
	
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			System.out.println("status"+status);
		// preparedStatement1 = con.prepareStatement(conmast);

		//	 status1=preparedStatement1.executeUpdate();
		//	if(status1>=1)
		//		System.out.println("status"+status1);
			errormsg="DC Record Updated Successfully.....";
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
		
		
		RequestDispatcher rs=request.getRequestDispatcher("./deliverychalan.jsp?return="+errormsg);
		rs.forward(request,response);
	}

}
