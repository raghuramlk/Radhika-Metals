<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>

 <%@page import="com.satya.co.Db" %>
    <%@ page language="java" import="java.sql.*,java.io.*"%>
    
    <%!String mid=null; 
     ResultSet rs1=null;
     ResultSet rs2=null;
     %>	
      <%!ResultSet rs=null;
                                               Statement st=null;
                                               Statement st1=null;
                                               Connection conn=null; int i=0;
                                               Db db=new Db();
                                               %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                            <h3 class="inner-tittle">Master Product </h3>

                            <div class="graph">
                                <nav> <script type="text/javascript">
                                function hide(obj){
                                  //document.getElementbyId("sol").hidden=true;
                                	obj.hidden=true;
                                	    }
                                </script>
                                    <ul>
                                        <li><a href="#section-1" class="icon-shop"><i class="fa fa-list-alt"></i>
                                            <span>Material List</span></a></li>
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
                                                      
                                                            <th>Meterial Id</th>
                                                            <th>Meterial Name</th>
                                                            <th>Price</th>
                                                            <th>Operation</th>

                                                        </tr> </thead>
                                                        <tbody> 
                                                                     
                                                           <%
               try{
             // st=conn.createStatement();
                                                       
                                                         conn =db.getConnection();
                                                        		st=conn.createStatement();
              String query="select meterial_id,meterial_name,meterial_price from meterial_master";
            
             rs=st.executeQuery(query);
             
          
             while(rs.next()) {%>
                                                        
                                                        <tr>
                                                                         <td><%=rs.getString(1)%></td>
            	<td><%=rs.getString(2)%></td>
            	
            	<td><%=rs.getString(3)%></td>
            	
                                                       

                                                        
                                                        
                                                        
                                                    
                                               	<td><a href="./metdel?id=<%=rs.getString(1)%>" class="button-delete" ><img src="images/trash.png" height="32" width="32"/></a> </td></tr>
             
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

                                                    <form action="./Meterial" method="post">
                                                        <div class="vali-form">
														  <div class="col-md-6 form-group1">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Meterial Id" name="mid" required="">
                                                            </div>
                                                            <div class="col-md-12 form-group1 form-last">
                                                               <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Meterial Name" name="mname" required="">
                                                                       
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>


                                                        <div class="clearfix"></div>
                                                        <div class="col-md-12 form-group1 group-mail">
                                                         <!--   <label class="control-label">Url</label>-->
                                                            <input type="text" placeholder="Price"  name="mprice" required="">
                                                        </div>
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
                                                    <!---->

                                                    <form name="f1">
                                                      <!--  <div class="vali-form">
                                                            <div class="col-md-6 form-group1">

                                                                <input type="text" placeholder="Customer Id"
                                                                       required="">
                                                            </div>-->
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
	mid="";
	mid=request.getParameter("mid");
	//out.print(custid);
	if(mid==null)
rs=st.executeQuery("select meterial_id from meterial_master");
//	out.print("The value of"+rs);
if(mid!=null ){
rs1=st.executeQuery("select * from meterial_master where meterial_id='"+request.getParameter("mid")+"'");
//rs2=st1.executeQuery("select * from concession_master where custid='"+request.getParameter("Custid")+"'");
}
}
catch(Exception e)
{
System.out.println(e);	
}
%><script type="text/javascript">
function getDetails(){
//	alert("satya");
	document.f1.action="./meterial.jsp";
	f1.submit();
}
function getStatus(){
	//alert("satya");
	var s="";
	document.f1.action="./meterial.jsp";
	f1.submit();

}
function update(){
	
	document.f1.method="post";
	document.f1.action="./meterialupdate";
	
	f1.submit();
	
}
</script>											<%if(mid==null){ %>
                                                            <select  name="mid" onchange="getDetails()" >
                                                                <option value="" readonly="readonly">Product Id</option>
                                                               
                                                               <%
                                                               try{
                                                            
                                                               while(rs.next()){ 
                                                               
                                                               %>
                                                                <option ><%=rs.getString("meterial_id")%></option>
                                                               
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
                                                                <input type="text" value="<%=rs1.getString("meterial_id") %>" name="mid" readonly required>
                                                            </div>
                                                            <div class="col-md-6 form-group1 form-last">
                                                                <!-- <label class="control-label"></label>-->
                                                                <input type="text" placeholder="Customer Name" value="<%=rs1.getString("meterial_name")%>" name="mname"  required>
                                                            </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>


                                                        <div class="clearfix"></div>
                                                        <div class="col-md-12 form-group1 group-mail">
                                                            <!--   <label class="control-label">Url</label>-->
                                                            <input type="text" placeholder="Price" name="mprice" value="<%=rs1.getString("meterial_price")%>"
                                                                   required="">
                                                        </div>
                                                        <div class="clearfix"></div>

<%} } catch(Exception e){
                                                        	
                                                         }}%>

                                                         <div class="col-md-12 form-group button-2">
                                                            <button  class="btn btn-primary" onclick="update()">Update</button>
                                                            
                                                          <!--  <button type="reset" onclick="getStatus()" class="btn btn-default">Reset
                                                            </button>-->
                                                            <a href="./meterial.jsp" class="btn btn-default">Reset</a>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </form>

                                                    <!---->
                                                </div>

                                            </div>
                                        </div>
                                    </section>
                                  <!--  <section id="section-4">
                                        <div class="mediabox">
                                            <i class="fa fa-trophy"></i>

                                            <h3>Tomato Cucumber Curd</h3>

                                            <p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish
                                                garlic brussels sprout groundnut summer purslane earthnut pea tomato
                                                spring onion azuki bean gourd. </p>
                                        </div>
                                        <div class="mediabox">
                                            <i class="fa fa-coffee"></i>

                                            <h3>Mushroom Green</h3>

                                            <p>Salsify taro catsear garlic gram celery bitterleaf wattle seed collard
                                                greens nori. Grape wattle seed kombu beetroot horseradish carrot squash
                                                brussels sprout chard.</p>
                                        </div>
                                        <div class="mediabox">
                                            <i class="fa fa-leaf"></i>

                                            <h3>Swiss Celery Chard</h3>

                                            <p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish
                                                garlic brussels sprout groundnut summer purslane earthnut pea tomato
                                                spring onion azuki bean gourd. </p>
                                        </div>
                                    </section>
                                    <section id="section-5">
                                        <div class="mediabox">
                                            <i class="fa fa-leaf"></i>

                                            <h3>Radish Tomato</h3>

                                            <p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish
                                                garlic brussels sprout groundnut summer purslane earthnut pea tomato
                                                spring onion azuki bean gourd. </p>
                                        </div>
                                        <div class="mediabox">
                                            <i class="fa fa-trophy"></i>

                                            <h3>Fennel Wasabi</h3>

                                            <p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish
                                                garlic brussels sprout groundnut summer purslane earthnut pea tomato
                                                spring onion azuki bean gourd. </p>
                                        </div>
                                        <div class="mediabox">
                                            <i class="fa fa-coffee"></i>

                                            <h3>Red Tofu Wrap</h3>

                                            <p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish
                                                garlic brussels sprout groundnut summer purslane earthnut pea tomato
                                                spring onion azuki bean gourd. </p>
                                        </div>
                                    </section>-->
                                </div><!-- /content -->
                            </div>
                            <!-- /tabs -->

                        </div>
                        <script src="js/cbpFWTabs.js"></script>
                        <script>
                            new CBPFWTabs(document.getElementById('tabs'));
                        </script>
                       <!-- <h3 class="inner-tittle two">Vertical Tabs </h3>

                        <div class="graph">

                            <div class="tabs">
                                <nav class="second"><a>Tab #1</a> <a>Tab #2</a> <a>Tab #3</a></nav>
                                <div class="context">
                                    <p>Content #1</p>

                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id ultricies
                                        lorem. Donec mattis ornare eros, eget hendrerit est porttitor nec. Aenean
                                        tristique massa vel nunc lobortis venenatis. Integer sit amet faucibus dolor,
                                        vitae iaculis ex. Sed blandit libero ut ante facilisis, ac imperdiet nibh
                                        mollis. Suspendisse eget leo suscipit, malesuada metus at, semper libero.
                                        Aliquam neque libero, fermentum id bibendum eu, feugiat consequat leo.
                                        Vestibulum ut purus et libero pulvinar mollis. Morbi dapibus varius ipsum eu
                                        tristique. Donec tortor justo, tincidunt malesuada nunc sed, ornare viverra
                                        eros. Nullam et massa ultrices, vulputate neque at, blandit velit. Nunc
                                        ultricies at quam vitae tempor. Quisque maximus fringilla arcu, vel sollicitudin
                                        dui luctus ac.</p>

                                    <p>Sed vitae consectetur urna. Aenean facilisis vitae massa quis auctor. Ut at
                                        ullamcorper magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Suspendisse et venenatis justo. Vivamus feugiat purus sit amet mi tincidunt, id
                                        egestas erat sodales. Vivamus dapibus rhoncus feugiat. Quisque pulvinar eu est
                                        vitae facilisis. Maecenas ac vestibulum lectus, in auctor turpis. In ultrices
                                        massa eget finibus volutpat. Nam eu nibh quis purus euismod eleifend. Fusce quis
                                        mattis erat. Praesent aliquet urna non imperdiet condimentum. Praesent a
                                        venenatis tortor. Donec porttitor enim nec facilisis volutpat.</p>
                                </div>
                                <div class="context">
                                    <p>Content #2</p>

                                    <p>Ut molestie, neque ac malesuada aliquet, orci ligula ornare lorem, et sagittis
                                        diam dolor id odio. Maecenas blandit dolor nec tincidunt vulputate. Proin
                                        ultrices dui vulputate ullamcorper molestie. Sed non orci id tortor commodo
                                        molestie. Curabitur lectus lacus, iaculis eu quam nec, congue rutrum felis.
                                        Morbi rhoncus metus a diam mattis, vel lacinia lectus ultricies. Quisque aliquet
                                        magna justo, quis pretium purus vulputate sit amet. Vivamus vehicula nisl eu
                                        sollicitudin efficitur. Curabitur egestas, felis vel tempus efficitur, felis
                                        nibh fermentum nulla, at gravida risus mauris sed sapien. Donec lobortis mi
                                        convallis tortor iaculis, sit amet vulputate libero mollis. Cras sagittis ligula
                                        eget est sodales tempor.</p>
                                </div>
                                <div class="context">
                                    <p>Content #3</p>

                                    <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                                        himenaeos. Suspendisse tempor accumsan purus a rutrum. Nam congue tempor dui,
                                        vel auctor dolor tincidunt id. Proin fringilla consectetur urna. Fusce nec
                                        sodales turpis, eu rhoncus enim. Pellentesque pretium, dui et feugiat venenatis,
                                        sapien augue molestie quam, ac vulputate arcu quam et mauris. Duis lectus mi,
                                        congue ac tortor vel, maximus venenatis sem. Nam eget cursus sapien, sit amet
                                        rhoncus lacus. Vestibulum est justo, scelerisque ac erat eu, fermentum suscipit
                                        tellus. Aliquam velit nisi, feugiat ut arcu et, finibus efficitur lectus.</p>

                                    <p>Nulla aliquam dapibus nunc, sed convallis sem semper sit amet. Mauris et
                                        ullamcorper lorem. Donec volutpat egestas massa, vitae porttitor mi venenatis
                                        sit amet. Nulla condimentum fermentum risus non mattis. Mauris ut posuere erat.
                                        Duis vel ante sit amet augue blandit facilisis. Nulla congue turpis at imperdiet
                                        porta. Nullam quis aliquet augue. Duis et arcu in augue fringilla sodales.
                                        Aliquam pulvinar elit non iaculis egestas. Nam risus enim, malesuada id augue a,
                                        sagittis pharetra quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Maecenas eleifend, ligula eget ultrices venenatis, metus neque finibus tortor,
                                        sit amet venenatis turpis nibh et odio.</p>
                                </div>
                            </div>
                            <script>
                                $(function () {
                                    $('.tabs nav a').on('click', function () {
                                        show_content($(this).index());
                                    });

                                    show_content(0);

                                    function show_content(index) {
                                        // Make the content visible
                                        $('.tabs .context.visible').removeClass('visible');
                                        $('.tabs .context:nth-of-type(' + (index + 1) + ')').addClass('visible');

                                        // Set the tab to selected
                                        $('.tabs nav.second a.selected').removeClass('selected');
                                        $('.tabs navnav.second a:nth-of-type(' + (index + 1) + ')').addClass('selected');
                                    }
                                });
                            </script>

                        </div>
                        <div class="col-md-6 graph-2">
                            <h3 class="inner-tittle">Panel Background </h3>

                            <div class="panel panel-primary">
                                <div class="panel-heading">Panel with panel-primary class</div>
                                <div class="panel-body"><p>Panel Content Chickweed okra pea winter purslane coriander
                                    yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut
                                    pea tomato spring onion azuki bean gourd.radish garlic brussels Lorem ipsum dolor
                                    sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                                    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                    laboris nisi ut aliquip ex ea commodo consequat. earthnut pea radish garlic brussels
                                    sprout groundnut summer purslane earthnut pea tomato spring onion azuki bean
                                    gourd.tomato spring onion azuki bean gourd.Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                                    ex ea commodo consequat.</p></div>
                            </div>
                        </div>
                        <div class="col-md-6 graph-2 second">
                            <h3 class="inner-tittle">Panel with footer </h3>

                            <div class="panel panel-primary two">
                                <div class="panel-heading">Panel with panel-primary class</div>
                                <div class="panel-body two"><p>Panel Content Chickweed Lorem ipsum dolor sit amet,
                                    consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                                    nisi ut aliquip ex ea commodo consequat. okra pea winter purslane coriander yarrow
                                    sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. tomato spring
                                    onion azuki bean gourd.</p></div>
                                <div class="panel-footer">
                                    Panel footer
                                </div>
                            </div>
                        </div>-->
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!--//tabs-inner-->
            </div>
            <!--//tabs-->
        </div>
        <!--//outer-wp-->
        <!--footer section start-->
        <footer>
            <!--<p>&copy 2016  All Rights Reserved | Design by <a href="" target="_blank"></a>
            </p>-->
        </footer>
        <!--footer section end-->
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
            <a href="index.html"><img src="images/logo.png"></a>
         <!--   <a href="index.html"><span class=" name-caret">Invoice Management System</span></a>-->
            <h5>Invoice Management System</h5>
            <!-- <p>System Administrator in Company</p>
            <ul>
            <li><a class="tooltips" href="index.html"><span>Profile</span><i class="lnr lnr-user"></i></a></li>
                <li><a class="tooltips" href="index.html"><span>Settings</span><i class="lnr lnr-cog"></i></a></li>
                <li><a class="tooltips" href="index.html"><span>Log out</span><i class="lnr lnr-power-switch"></i></a></li>
                </ul>-->
        </div>
        <!--//down-->
        <div class="menu">
            <ul id="menu" >
                <li><a href="index.html"><i class="fa fa-tachometer"></i> <span >Dashboard</span></a></li>
                <li><a href="customer.jsp"><i class="lnr lnr-chart-bars"></i> <span >Customer Profile</span> </a>

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


                <li><a href="#"><i class="fa fa-inbox"></i> <span class="active">Material List</span><span class="fa fa-angle-right" style="float: right"></span></a>
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
                <li><a href="settings.html"><i class="fa fa-cog fa-fw"></i> <span>Settings</span></a></li>


                <!-- <ul id="menu-academico-sub" >
                    <li id="menu-academico-avaliacoes" ><a href="grids.html">Grids</a></li>
                    <li id="menu-academico-boletim" ><a href="media.html">Media Objects</a></li>

                  </ul>-->
                <!-- </li>
                <li><a href="chart.html"><i class="lnr lnr-chart-bars"></i> <span>Charts</span> <span class="fa fa-angle-right" style="float: right"></span></a>
                  <ul>
                    <li><a href="map.html"><i class="lnr lnr-map"></i> Maps</a></li>
                    <li><a href="graph.html"><i class="lnr lnr-apartment"></i> Graph Visualization</a></li>
                </ul>
                </li>-->
                <!--<li id="menu-comunicacao" ><a href="#"><i class="fa fa-smile-o"></i> <span>More</span><span class="fa fa-angle-double-right" style="float: right"></span></a>
                  <ul id="menu-comunicacao-sub" >
                    <li id="menu-mensagens" style="width:120px" ><a href="project.html">Projects <i class="fa fa-angle-right" style="float: right; margin-right: -8px; margin-top: 2px;"></i></a>
                      <ul id="menu-mensagens-sub" >
                        <li id="menu-mensagens-enviadas" style="width:130px" ><a href="ribbon.html">Ribbons</a></li>
                        <li id="menu-mensagens-recebidas"  style="width:130px"><a href="blank.html">Blank</a></li>
                      </ul>
                    </li>
                    <li id="menu-arquivos" ><a href="500.html">500</a></li>
                  </ul>
                </li>-->
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
</body>
</html>