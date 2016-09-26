<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="com.satya.co.Db" %>
    <%@ page language="java" import="java.sql.*,java.io.*"%>
    
    <%!String custid=null; 
     ResultSet rs1=null;
     ResultSet rs2=null;
     ResultSet ms=null;
     ResultSet cs=null;
     %>	
      <%!ResultSet rs=null;
                                               Statement st=null;
                                               Statement st1=null;
                                               Statement sts=null;
                                               Statement scs=null;
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
                  <%!String status=""; %>
<%status=request.getParameter("return");%>
                    <!--/tabs-inner-->
                    <div class="tab-inner">
                        <div id="tabs" class="tabs">
                            <h3 class="inner-tittle">Delivery Challan</h3>

                            <div class="graph">
                                <nav>
                                 <script type="text/javascript">
                                function hide(obj){
                                  //document.getElementbyId("sol").hidden=true;
                                	obj.hidden=true;
                                	    }
                                </script>
                                    <ul>
                                        <li><a href="#section-1" class="icon-shop"><i class="fa fa-tasks"></i>
                                            <span>DC List</span></a></li>
                                        <li><a href="#section-2" class="icon-cup"><i class="fa fa-chevron-circle-right"></i> <span>New</span></a>
                                        </li>
                                        <li><a href="#section-2" class="icon-cup"><i class="fa fa-pencil-square-o"></i> <span>Edit</span></a>
                                        </li>
                                        <!-- <li><a href="#section-3" class="icon-food"><i class="fa fa-cutlery"></i> <span></span></a>
                                         </li>
                                         <li><a href="#section-4" class="icon-lab"><i class="fa fa-flask"></i>
                                             <span>Lab</span></a></li>
                                         <li><a href="#section-5" class="icon-truck"><i class="fa fa-truck"></i> <span>Order</span></a>
                                         </li>-->
                                    </ul>
                                </nav>
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
                                                         
                                                            <th>DC No</th>
                                                            <th>Date</th>
                                                            <th>Custid</th>
                                                            <th>Material</th>
                                                            <th>Truck No</th>
                                                            <th>Qunatity</th>
                                                            <th>Operation</th>

                                                        </tr> </thead>
                                                        <tbody>
                                                                    
                                                           <%
               try{
             // st=conn.createStatement();
                                                       
                                                         conn =db.getConnection();
                                                        		st=conn.createStatement();
                                                        		sts=conn.createStatement();
                                                        		scs=conn.createStatement();
              String query="select dm.dc_id,dm.dc_date,dm.custid,mm.meterial_name,dm.truckno,dm.quantity from dc_master dm, meterial_master mm where dm.meterial_id=mm.meterial_id";
              String q1="select custid from customer_master";
              String q2="select meterial_name from meterial_master";
             rs=st.executeQuery(query);
             ms=sts.executeQuery(q1);
             cs=scs.executeQuery(q2);
          
             while(rs.next()) {%>
                                                        
                                                         <tr>
                                                      
                                                           <td><%=rs.getString(1)%></td>
            	<td><%=rs.getString(2)%></td>
            	
            	<td><%=rs.getString(3)%></td>
            	<td><%=rs.getString(4)%></td>
            	<td><%=rs.getString(5)%></td>
            	<td><%=rs.getString(6)%></td>
            	
                                                     
                                                             <!--    <a href="" class="button-delete" data-toggle = "modal" data-target = "#myModal1"><img src="images/print.png" height="36" width="36"/></a>-->


                                                        


                                               	<td><a href="./dcdel?id=<%=rs.getString(1)%>" class="button-delete" ><img src="images/trash.png" height="32" width="32"/></a> </td></tr>
             
                      <%}      }
                                                           catch(Exception e){
                                                        	   
                                                        	 e.printStackTrace();
                                                        	 
                                                        	 response.sendRedirect("./error.jsp");
                                                           }%>           

</tr>



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
                                                    <!---->

                                                   <form action="./deliverychalan" method="post" >
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Dcid" name="dcid" 
                                                                       required="">
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="date" placeholder="Dc Date" name="dcdate"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>

                                      
                                                        <div class="clearfix"></div>
                                                        <div class="vali-form">
                                                        <div class="col-md-6 form-group2 ">
                                                      
                                                            <select placeholder="custid" name="custid"
                                                                   required="">
                                                                   
                                                                   <option>
                                                                   Custid
                                                                   </option>
                                                                   <%while(ms.next()){ %>
                                                                   <option><%=ms.getString("custid") %></option>
                                                                   <%} %>
                                                                   </select>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                   
                                                     
                                                            <div class="col-md-6 form-group2">
                                                              <select placeholder="custid" name="meterialname" required>
                                                                   
                                                                   
                                                                   <option>
                                                                   Meterial name
                                                                   </option>
                                                                   <%while(cs.next()){ %>
                                                                   <option><%=cs.getString("meterial_name") %></option>
                                                                   <%} %>
                                                                   </select>
                                                            </div>
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                             
                                                                <input type="text" placeholder="Truck No" name="truckno"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    
                                                        <div class="col-md-12 form-group1 group-mail">
                                                            <!-- <label class="control-label">Number</label>-->
                                                            <input type="text" placeholder="Quantity" name="quantity" required="">


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
                                      
                                    </section>
                                    <section id="section-3">
                                        <div class="forms-main">

<form name="f1" >
                                                
                                                        <div class="vali-form">
                                                        <div class="col-md-6 form-group2 ">
                                                    <!---->
<% 
try{
	
	
	//out.print(st);
	rs1=null;
	rs2=null;
	custid="";
	 custid=request.getParameter("Custid");
	// conn =db.getConnection();
		st=conn.createStatement();
		st1=conn.createStatement();
	//out.print(custid);
	if(custid==null)
rs=st.executeQuery("select dc_id from dc_master");
//	out.print("The value of"+rs);
if(custid!=null ){
rs1=st.executeQuery("select * from dc_master where dc_id='"+request.getParameter("Custid")+"'");

}
}
catch(Exception e)
{
System.out.println(e);	
}
%><script type="text/javascript">
function getDetails(){
//	alert("satya");
	document.f1.action="./deliverychalan.jsp";
	f1.submit();
}
function getStatus(){
	//alert("satya");
	var s="";
	document.f1.action="./deliverychalan.jsp";
	f1.submit();

}
function update(){
	
	document.f1.method="post";
	document.f1.action="./deliveryupdate";
	
	f1.submit();
	
}
</script>					


                                                 <%if(custid==null){ %>
                                                            <select name="Custid" onchange="getDetails()">
                                                                <option value="" readonly="readonly">Dc Id</option>
                                                              
                                                              
                                                               <%
                                                               try{
                                                            
                                                               while(rs.next()){ 
                                                               
                                                               %>
                                                                <option ><%=rs.getString("dc_id")%></option>
                                                               
                                                               <%} %>
                                                            </select>
                                                            
                                                        </div>
                                                            <%}catch(Exception e){
                                                            	
                                                            }
                                                               
															}else{ %>
                                                              <%
                                                               try{
                                                               while(rs1.next()){ 
                                                          
                                                               %>
                                                        <div class="vali-form">
                                                            <div class="col-md-6 form-group1">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Dcid" name="dcid" value="<%=rs1.getString("dc_id") %>"
                                                                       required="">
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="date" placeholder="Dc Date" name="dcdate" value="<%=rs1.getString("dc_date")%>"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>

                                      
                                                        <div class="clearfix"></div>
                                                        <div class="vali-form">
                                                       <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Dc Date" name="custid" value="<%=rs1.getString("custid")%>"
                                                                       required="">
                                                            </div>
                                                        <div class="clearfix"></div>
                                                   
                                                     
                                                        <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="" name="meterialid" value="<%=rs1.getString("meterial_id")%>"
                                                                       required="">
                                                            </div>
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                             
                                                                <input type="text" placeholder="Truck No" name="truckno" value="<%=rs1.getString("truckno")%>"
                                                                       required="">
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    
                                                        <div class="col-md-12 form-group1 group-mail">
                                                            <!-- <label class="control-label">Number</label>-->
                                                            <input type="text" placeholder="Quantity" name="quantity" value="<%=rs1.getString("quantity")%>" required="">


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
<%} } catch(Exception e){
                                                        	
                                                         }}%>
                                                    <!---->
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
        <a href="index.html"><img src="logo.jpg"></a>
        <!--   <a href="index.html"><span class=" name-caret">Invoice Management System</span></a>-->
        <h5>Invoice Management System</h5>

    </div>
    <!--//down-->
    <div class="menu">
        <ul id="menu" >
            <li><a href="index.html"><i class="fa fa-tachometer"></i> <span >Dashboard</span></a></li>
            <li><a href="customer.jsp"><i class="lnr lnr-chart-bars"></i> <span >Customer Profile</span> </a>

            </li>
            <li id="menu-academico" ><a href="deliverychalan.jsp"><i class="fa fa-table"></i> <span class="active"> Delivery Challan</span> <!--<span class="fa fa-angle-right" style="float: right"></span>--></a>
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

</body>
</html>