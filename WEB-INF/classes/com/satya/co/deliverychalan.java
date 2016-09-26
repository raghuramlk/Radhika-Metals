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
 * Servlet implementation class deliverychalan
 */
@WebServlet("/deliverychalan")
public class deliverychalan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deliverychalan() {
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
		String dcid=request.getParameter("dcid");
		String dcdate=request.getParameter("dcdate");
		String custid=request.getParameter("custid");
		String meterialname=request.getParameter("meterialname");
		String truckno=request.getParameter("truckno");
		String quantity=request.getParameter("quantity");
		String mtid=null;
		String mprice=null;
    int mtotal=0;
		String h="";
		String errormsg="";
		String conmast="";
		int status=0,status1=0;
		//PrintWriter out =response.getWriter();
		System.out.println(dcid+""+dcdate+""+custid+""+meterialname+""+truckno+""+quantity+"");
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
		Statement sst=conn.createStatement();
		ResultSet rs=t.executeQuery("select * from dc_master");
		ResultSet rs3=sst.executeQuery("select meterial_id,meterial_price from meterial_master where meterial_name='"+meterialname+"'");
		while(rs3.next()){
			mtid=rs3.getString(1);
			mprice=rs3.getString(2);
            mtotal=Integer.parseInt(mprice)*Integer.parseInt(quantity);		
		}
		while(rs.next()){
			 h=rs.getString(1);
			
		}
		if(h.equals(dcid))
		{
		errormsg="Dc already existed...";	
		}
		else{
		
			if(dcid!=null||dcid!="")
		{		
		String custmast="INSERT INTO dc_master(dc_id,custid,dc_date,meterial_id,truckno,quantity,total) VALUES (?,?,?,?,?,?,?)";
		//conmast="INSERT INTO concession_master(custid,vat,cst,welfare) VALUES (?,?,?,?)";
		PreparedStatement preparedStatement = conn.prepareStatement(custmast);
		preparedStatement.setString(1,dcid);
		preparedStatement.setString(2,custid);
		preparedStatement.setString(3,dcdate);
		preparedStatement.setString(4, mtid);
		preparedStatement.setString(5,truckno);
		preparedStatement.setString(6,quantity);
		preparedStatement.setString(7,String.valueOf(mtotal));
		 status=preparedStatement.executeUpdate();
		if(status>=1)
		{
			
			/*PreparedStatement preparedStatement1 = conn.prepareStatement(conmast);
			preparedStatement1.setString(1,cid);
			preparedStatement1.setInt(2,Integer.parseInt(vat));
			preparedStatement1.setInt(3,Integer.parseInt(cst));
			preparedStatement1.setInt(4,Integer.parseInt(welfare));
			 status1=preparedStatement1.executeUpdate();*/
			//if(status1>=1)
			errormsg="DC Record Inserted Successfully.....";
		}
	
		}
		}
		}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//String block="Customer Record Inserted Successfully.....";
		
		RequestDispatcher rs=request.getRequestDispatcher("./deliverychalan.jsp?return="+errormsg);
		rs.forward(request,response);
		
			
		
	}

}
