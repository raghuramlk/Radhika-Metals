<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.satya.co.Db" %>
    <%@ page language="java" import="java.sql.*,java.io.*"%>
    
    <%!String custid=null; 
     ResultSet rs1=null;
     ResultSet rs2=null;
     %>	
      <%!ResultSet rs=null;
                                               Statement st=null;
                                               Statement st1=null;
                                               Connection conn=null; int i=0;
                                               Db db=new Db();
                                               %>  
<!DOCTYPE HTML>
<html >
<head>
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />

    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/amcharts.js"></script>
    <script src="js/serial.js"></script>
    <script src="js/light.js"></script>
    <script src="js/radar.js"></script>
    <link href="css/barChart.css" rel='stylesheet' type='text/css' />
    <link href="css/fabochart.css" rel='stylesheet' type='text/css' />
    <script src="js/css3clock.js"></script>
    <script src="js/skycons.js"></script>
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/dashboard.js"></script>
    <script src="angular/angular.js"></script>
    <script src="angular/ui-bootstrap-tpls-0.11.0.min.js"></script>
    <script src="angular/app.js"></script>
    <script src="tablejs/jquery.dataTables.min.js"></script>
    <script src="tablejs/dataTables.bootstrap.min.js"></script>
</head>
<body ng-app="invoiceApp" >
<div ng-controller="HeaderController">
    <div ng-include="header.url"  ></div>
</div>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="inner-content">

            <!--//outer-wp-->
            <div class="outter-wp">
                <!--/sub-heard-part-->

                <!--/sub-heard-part-->
                <!--/tabs-->
                <div class="tab-main">
                    <!--/tabs-inner-->
                    <%!String status=""; %>
<%status=request.getParameter("return");%>
                    <div class="tab-inner">
                        <div id="tabs" class="tabs">
                            <h3 class="inner-tittle">Customer Profile </h3>

                            <div class="graph">
                                <nav>
                                    <ul>
                                        <li><a href="#section-1" class="icon-shop"><i class="fa fa-users"></i>
                                            <span>Profile</span></a></li>
                                        <li><a href="#section-2" class="icon-cup"><i class="fa fa-chevron-circle-right"></i> <span>New</span></a>
                                        </li>
                                     <li><a href="#section-3" class="icon-cup"><i class="fa fa-pencil-square-o"></i> <span>Edit</span></a>
                                        </li>
                                       <!-- <li><a href="#section-3" class="icon-food"><i class="fa fa-cutlery"></i> <span></span></a>
                                        </li>
                                        <li><a href="#section-4" class="icon-lab"><i class="fa fa-flask"></i>
                                            <span>Lab</span></a></li>
                                        <li><a href="#section-5" class="icon-truck"><i class="fa fa-truck"></i> <span>Order</span></a>
                                        </li>-->
                                    </ul>
                                </nav>
                                <script type="text/javascript">
                                function hide(obj){
                                  //document.getElementbyId("sol").hidden=true;
                                	obj.hidden=true;
                                	    }
                                </script>
                                <div class="content tab">
                                    <section id="section-1">
                                   <% if(status!=null){%>
								
									<div class="alert alert-info"  role="alert" onclick="hide(this)">
												 <%=status %>
												 <button type="button" class="close" id="hide" >×</button>
												   </div>
												   <%} %>
                                        <div class="outter-wp">
                                           <!-- <h3 class="inner-tittle two">Responsive Table </h3>-->
                                            <div class="graph">
                                                <div class="tables">
                                                    <table class="table table-bordered" id="example">
                                                        <thead> <tr>
                                                            
                                                            <th>Custid</th>
                                                            <th>Customer Name</th>
                                                            <th>Destination</th>
                                                            <th>phoneno</th>
                                                            <th>VAT (%)</th>
                                                            <th>CST (%)</th>
                                                            <th>Welfare (%)</th>
                                                            <th>Opertion</th>
                                                        </tr> </thead>
                                                        <tbody> 
                                                  
                                                     
                                                           <%
               try{
             // st=conn.createStatement();
                                                       
                                                         conn =db.getConnection();
                                                        		st=conn.createStatement();
              String query="select cm.custid,cm.name,cm.city,cm.phoneno,cmm.vat,cmm.cst,cmm.welfare from customer_master cm, concession_master cmm where cm.custid=cmm.custid";
            
             rs=st.executeQuery(query);
             
          
             while(rs.next()) {%>
            	
            	<tr scope="row">
            
            	<td><%=rs.getString(1)%></td>
            	<td><%=rs.getString(2)%></td>
            	
            	<td><%=rs.getString(3)%></td>
            	<td><%=rs.getString(4)%></td>
            	<td><%=rs.getInt(5)%></td>
            	<td><%=rs.getInt(6)%></td>
            	<td><%=rs.getInt(7)%></td>          	
<!-- data-toggle = "modal" data-target = "#myModal" -->
                      	<td><a href="./customerdel?id=<%=rs.getString(1)%>" class="button-delete" ><img src="images/trash.png" height="32" width="32"/></a> </td></tr>
             
                      <%}      }
                                                           catch(Exception e){
                                                        	   
                                                        	 e.printStackTrace();
                                                        	 
                                                        	 response.sendRedirect("./error.jsp");
                                                           }%>                                  
                                                       

                                                        





                                                        </tbody> </table>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <section id="section-2">

                                      <!--  <h3 class="inner-tittle two">Responsive Table </h3>-->
                                        <div class="forms-main">


                                            <div class="graph-form">
                                                <div class="validation-form">
                                                 

                                                    <form action="./Customer" method="post">
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                               <!-- <label class="control-label"></label>-->
                                                                <input type="text" name="cid" placeholder="Customer Id"
                                                                       required="">
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                               <!-- <label class="control-label"></label>-->
                                                                <input type="text" name="cname" placeholder="Customer Name"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>

                                                        <div class="col-md-12 form-group1 ">

                                                            <textarea placeholder="Address" name='address' required=""></textarea>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="col-md-12 form-group1 group-mail">
                                                         <!--   <label class="control-label">Url</label>-->
                                                            <input type="text" name='city' placeholder="City"
                                                                   required="">
                                                        </div>
                                                        <div class="clearfix"></div>
                                                       <!-- <div class="col-md-12 form-group2 group-mail">
                                                            <label class="control-label">Language</label>
                                                            <select>
                                                                <option value="">English</option>
                                                                <option value="">Japanese</option>
                                                                <option value="">Russian</option>
                                                                <option value="">Arabic</option>
                                                                <option value="">Spanish</option>
                                                            </select>
                                                        </div>-->
                                                  <!--      <div class="clearfix"></div>-->
                                                        <!--<div class="col-md-12 form-group1 ">
                                                            <label class="control-label">Your Comment</label>
                                                            <textarea placeholder="Your Comment..." required="">Your Comment.....</textarea>
                                                        </div>
                                                        <div class="clearfix"></div>-->
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                              <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text" name='state' placeholder="State"
                                                                       required="">
                                                            </div>
                                                            <!-- <div class="col-md-6 form-group1 form-last">
                                                             
                                                                <input type="text" placeholder="Destination"
                                                                       required="">
                                                            </div> -->
                                                             <div class="col-md-6 form-group1">
                                                              <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text" name='phone' placeholder="phoneno"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                     <!--   <div class="vali-form vali-form1">
                                                            <div class="col-md-6 form-group1">
                                                                <label class="control-label">Create a
                                                                    password</label>
                                                                <input type="password"
                                                                       placeholder="Create a password" required="">
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <label class="control-label">Repeated
                                                                    password</label>
                                                                <input type="password"
                                                                       placeholder="Repeated password" required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>-->
                                                        <div class="col-md-12 form-group1 group-mail">
                                                           <!-- <label class="control-label">Number</label>-->
                                                            <input type="text" name='vat' placeholder="VAT (%)" required="">


                                                        </div>
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                                <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text" name='welfare' placeholder="Welfare (%)"
                                                                       required="">
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!--  <label class="control-label">Mobile Number</label>-->
                                                                <input type="text" name='cst' placeholder="CST (%)"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>


                                                        <div class="clearfix"></div>


                                                        <div class="col-md-12 form-group button-2">
                                                            <button type="submit" class="btn btn-primary">Submit
                                                            </button>
                                                            <button type="reset" class="btn btn-default">Reset
                                                            </button>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </form>

                                                    <!---->
                                                </div>

                                            </div>
                                        </div>
                                    </section>
                                    <section id="section-3">
                                        <div class="forms-main">


                                            <div class="graph-form">
                                                <div class="validation-form">
                                                 

                                                    <form name="f1" method="post">
                                                    
                                                        <div class="vali-form">
                                                        <div class="col-md-6 form-group2 ">
                                                        
                                                       
<% 
try{
	
	conn =db.getConnection();
	st=conn.createStatement();
	st1=conn.createStatement();
	//out.print(st);
	rs1=null;
	rs2=null;
	custid="";
	 custid=request.getParameter("Custid");
	//out.print(custid);
	if(custid==null)
rs=st.executeQuery("select custid from customer_master");
//	out.print("The value of"+rs);
if(custid!=null ){
rs1=st.executeQuery("select * from customer_master where custid='"+request.getParameter("Custid")+"'");
rs2=st1.executeQuery("select * from concession_master where custid='"+request.getParameter("Custid")+"'");
}
}
catch(Exception e)
{
System.out.println(e);	
}
%><script type="text/javascript">
function getDetails(){
//	alert("satya");
	document.f1.action="./customer.jsp";
	f1.submit();
}
function getStatus(){
	//alert("satya");
	var s="";
	document.f1.action="./customer.jsp";
	f1.submit();

}
function update(){
	
	document.f1.method="post";
	document.f1.action="./customerupdate";
	
	f1.submit();
	
}
</script>													<%if(custid==null){ %>
                                                            <select name="Custid" onchange="getDetails()">
                                                                <option value="" readonly="readonly">Customer Id</option>
                                                              
                                                              
                                                               <%
                                                               try{
                                                            
                                                               while(rs.next()){ 
                                                               
                                                               %>
                                                                <option ><%=rs.getString("custid")%></option>
                                                               
                                                               <%} %>
                                                            </select>
                                                            
                                                        </div>
                                                            <%}catch(Exception e){
                                                            	
                                                            }
                                                               
															}else{ %>
                                                              <%
                                                               try{
                                                               while(rs1.next()){ %>
                                                             
                                                            
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" value="<%=rs1.getString("custid") %>" name="cid" required>
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Customer Name" value="<%=rs1.getString("name")%>" name="cname"  required>
                                                            </div>
                                                            
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>

                                                <div class="col-md-12 form-group1 ">

                                                    <textarea placeholder="Address"  name="address" required><%=rs1.getString("address")%></textarea>
                                                </div>
                                                        <div class="clearfix"></div>
                                                        <div class="col-md-12 form-group1 group-mail">
                                                            <!--   <label class="control-label">Url</label>-->
                                                            <input type="text" placeholder="City" name="city" value="<%=rs1.getString("city")%>" required>
                                                                   
                                                        </div>
                                                        <div class="clearfix"></div>

                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                                <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text" placeholder="State"  name="state" value="<%=rs1.getString("state")%>"  required>
                                                                       
                                                            </div>
                                                             <div class="col-md-6 form-group1">
                                                                <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text"  placeholder="phoneno" name="phone" value="<%=rs1.getString("phoneno")%>"  required>
                                                                       
                                                            </div>
                                                           
                                                            <div class="clearfix"></div>
                                                        </div>

															<%} } catch(Exception e){
                                                        	
                                                         }}%>
                                                         <%
                                                               try{
                                                            
                                                               while(rs2.next()){ 
                                                               
                                                               %>
                                                        <div class="col-md-12 form-group1 group-mail">
                                                            <!-- <label class="control-label">Number</label>-->
                                                            <input type="text" placeholder="VAT (%)" name="vat" value="<%=rs2.getString("VAT")%>" required>


                                                        </div>
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                                <!--  <label class="control-label">Phone Number</label>-->
                                                                <input type="text" placeholder="Welfare (%)" name="welfare" value="<%=rs2.getString("WELFARE")%>" required>
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!--  <label class="control-label">Mobile Number</label>-->
                                                                <input type="text" placeholder="CST (%)" name="cst" value="<%=rs2.getString("CST")%>" required>
                                                                       
                                                            </div>
                                                            
                                                            	<%} }catch(Exception e){
                                                        	 e.printStackTrace();
                                                         }%>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>


                                                        <div class="clearfix"></div>

 														
                                                        <div class="col-md-12 form-group button-2">
                                                            <button  class="btn btn-primary" onclick="update()">Update</button>
                                                            
                                                          <!--  <button type="reset" onclick="getStatus()" class="btn btn-default">Reset
                                                            </button>-->
                                                            <a href="./customer.jsp" class="btn btn-default">Reset</a>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </form>

                                                    <!---->  </div>
                                                </div>

                                            </div>

                                    </section>

                                </div><!-- /content -->
                            </div>
                            <!-- /tabs -->

                        </div>
                        <script src="js/cbpFWTabs.js"></script>
                        <script>
                            new CBPFWTabs(document.getElementById('tabs'));
                        </script>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <!--//tabs-inner-->
            </div>
            <!--//tabs-->
        </div>
        <!--//outer-wp-->

    </div>

    <!--//content-inner-->
    <!--/sidebar-menu-->
    <div class="sidebar-menu">
        <header class="logo">
            <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="index.html"> <span id="logo"> <h4>Radhika Metals </br>& Minerals</h4></span>
            <!--<img id="logo" src="" alt="Logo"/>-->
        </a>
        </header>

        <!--/down-->
        <div class="down">
            <a href="index.html"><img src="logo.jpg" /></a>
         <!--   <a href="index.html"><span class=" name-caret">Invoice Management System</span></a>-->
            <h5>Invoice Management System</h5>

        </div>
        
        <div class="menu">
            <ul id="menu" >
                <li><a href="index.html"><i class="fa fa-tachometer"></i> <span >Dashboard</span></a></li>
                <li><a href="customer.jsp"><i class="lnr lnr-chart-bars"></i> <span class="active">Customer Profile</span> </a>

                </li>
                <li id="menu-academico" ><a href="deliverychalan.jsp"><i class="fa fa-table"></i> <span> Delivery Challan</span> <!--<span class="fa fa-angle-right" style="float: right"></span>--></a>
                    <!--  <ul id="menu-academico-sub" >
                       <li id="menu-academico-avaliacoes" ><a href="tabs.html"> Tabs &amp; Panels</a></li>
                       <li id="menu-academico-boletim" ><a href="widget.html">Widgets</a></li>
                       <li id="menu-academico-avaliacoes" ><a href="calender.html">Calendar</a></li>

                     </ul>-->
                </li>
                <li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i> <span>RM & M</span> <span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul id="menu-academico-sub" >
                        <li id="menu-academico-avaliacoes" ><a href="">DC Invoice</a></li>
                        <li id="menu-academico-boletim" ><a href="">Transport Invoice</a></li>
                        <!--<li id="menu-academico-boletim" ><a href="table.html">Tables</a></li>
                        <li id="menu-academico-boletim" ><a href="buttons.html">Buttons</a></li>-->
                    </ul>
                </li>

                <li id="menu-academico" ><a href="rbssd.html"><i class="lnr lnr-layers"></i> <span>RBSSD & FN</span> <!--<span class="fa fa-angle-right" style="float: right"></span>--></a>
                </li>


                <li><a href="#"><i class="fa fa-inbox"></i> <span >Material List</span><span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul>
                        <li><a href="meterial.jsp"><i class="fa fa-pencil-square-o"></i>Master Product</a></li>
                        <!--    <li><a href="compose.html"><i class="fa fa-pencil-square-o"></i> Compose Mail</a></li>
                            <li><a href="editor.html"><span class="lnr lnr-highlight"></span> Editors Page</a></li>
-->
                    </ul>
                </li>
                <li id="menu-academico" ><a href="#"><i class="lnr lnr-book"></i> <span>Reports</span> <span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul id="menu-academico-sub" >
                        <li id="menu-academico-avaliacoes" ><a href="">Tunnage Reports</a></li>
                        <li id="menu-academico-boletim" ><a href="">Partywise Reports</a></li>
                        <li id="menu-academico-boletim" ><a href="">Gradewise Reports</a></li>
                        <!--<li id="menu-academico-boletim" ><a href="sign.html">Sign up</a></li>
                        <li id="menu-academico-boletim" ><a href="profile.html">Profile</a></li>-->
                    </ul>
                </li>
                <li><a href="settings.html"><i class="fa fa-cog fa-fw" ></i> <span>Settings</span></a></li>



            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<script>
    var toggle = true;

    $(".sidebar-icon").click(function () {
        if (toggle) {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position": "absolute"});
        }
        else {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function () {
                $("#menu span").css({"position": "relative"});
            }, 400);
        }

        toggle = !toggle;
    });
</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    // When the document is ready
    $(document).ready(function () {

        $('#date1').datepicker({
            format: "dd/mm/yyyy"
        });
        $('#example').DataTable();
    });

</script>
<div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog"
     aria-labelledby = "myModalLabel" aria-hidden = "true">

    <div class = "modal-dialog">
        <div class = "modal-content">

            <div class = "modal-header">
                <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                    &times;
                </button>

                <h4 class = "modal-title" id = "myModalLabel">
                    Alert
                </h4>
            </div>

            <div class = "modal-body">
                Are you sure want to delete this?
            </div>

            <div class = "modal-footer">
                <button type = "button" class = "btn btn-default" data-dismiss = "modal">
                    Cancel
                </button>

                <button type = "button" class = "btn btn-primary">
                    Delete
                </button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->

</div><!-- /.modal -->

<div ng-controller="FooterController">
    <div ng-include="footer.url"  ></div>
</div>
<%try{}

finally{
	if(rs1!=null)
		rs1.close();
    if(rs!=null)
    	rs.close();
    if(st!=null)
    	st.close();
    if(st1!=null)
		st1.close();
    if(rs2!=null)
		rs2.close();
    
    if(conn!=null)
    	conn.close();
	
	
} %>
</body>
</html>