<%@ page import="javax.servlet.RequestDispatcher"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
<body class="w3-light-grey">

<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-large">
  <%
  String login=(String)request.getParameter("login");
	if(login.equals("-")){
%>
  <form action="index.jsp" >
  	<button class="w3-bar-item w3-button w3-blue w3-mobile" type="submit" ><i class="w3-margin-right"></i> WhereToGo</button>
  </form>
    <%
        } else {
    		%>
    		<form action="index2.jsp" >
    		<input type="hidden" name="login" value=<%=login%>>
  	<button class="w3-bar-item w3-button w3-blue w3-mobile" type="submit" ><i class="w3-margin-right"></i> WhereToGo</button>
  </form>
  <%		}   %>
  <a href="#Help" class="w3-bar-item w3-button w3-mobile">Help</a>
  <a href="#contact" class="w3-bar-item w3-button w3-mobile">Contact</a>
  <%
  if(login.equals("-")){
	  %>
  <form action="login.jsp" >
  	<button class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile" type="submit"><i class="w3-margin-right"></i> Login/Register</button>
  </form>
   <%
        } else {
    		%>	
   <form action="index.jsp" >
   	<input type="hidden" name="login" value="-">
  	<button class="fa fa-times-circle-o w3-bar-item w3-button w3-right  w3-mobile" type="submit"><i class="w3-margin-right"></i> </button>
  </form>
 <form action="user" >
 <input type="hidden" name="login" value=<%=login%>>
  	<button class="fa fa-user fa-fw w3-bar-item w3-button w3-right  w3-mobile" type="submit"><i class="w3-margin-right"></i> <%=login%></button>
  </form>
<%		}   %>
</div>
<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:2000px;max-height: 5500px;min-width:1500px;min-height: 920px;">
  <img class="w3-image" src="airline.jpg" alt="The Airline" style="min-width:1000px" width="1500" height="800">
  <div class="w3-display-left w3-padding w3-col l6 m8">
    <div class="w3-container w3-blue">
      <h2><i class=""></i>Flight Found!</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <%
    String airId1 = (String) request.getAttribute("airId1");
 	String airId2 = (String) request.getAttribute("airId2");
		
		String departing= (String) request.getAttribute("departing");
		String departing2= (String) request.getAttribute("departing2");
	    String origin = (String) request.getAttribute("origin"); 
	  	String destination = (String) request.getAttribute("destination"); 
	  	String origin2 = (String) request.getAttribute("origin2"); 
	  	String destination2 = (String) request.getAttribute("destination2"); 
  %>
     
      	<div class="w3-text-blue">
      	<h2>From <%=origin%> To <%=destination%></h2>
      	</div>
      <%
      	   if (airId1.equals("Not Found")) {
      %>
      		<div class="w3-text-red">
      		<h2>	Not Found</h2>
      		</div>
      <%
        } else {
        	String flightNo1 = (String) request.getAttribute("flightNo1");
        	String legNo1 = (String) request.getAttribute("legNo1");
        	String depTime1 = (String) request.getAttribute("depTime1");
        	String arrTime1 = (String) request.getAttribute("arrTime1"); 
        	String fareType1 = (String) request.getAttribute("fareType1"); 
        	String fare1 = (String) request.getAttribute("fare1");
        	double result1 = Double.parseDouble(fare1)/10;
        	String bookingFee1 = ""+result1;
        	String airClass1= (String) request.getAttribute("airClass1");
        	String departId1 = (String) request.getAttribute("departId1");
        	String arrId1 = (String) request.getAttribute("arrId1");
      %>
      	 <form action="order" method="post">
        <h3><i class=""></i>FlightNo: <%=airId1%><%=flightNo1%></h3>
        <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-check-o"></i> Depart From <br><%=departId1%>, <%=origin%></label>
            <div class="w3-container w3-section w3-light-blue">
  				<h4><%=depTime1%></h4>
			</div>
         </div>
         <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-check-o"></i> Estimated Arrive Time at<br> <%=arrId1%>, <%=destination%></label>
            <div class="w3-container w3-section w3-blue">
  				<h4><%=arrTime1%></h4>
			</div>
         </div>
        <h3><i class=""></i>Fare Type: <%=fareType1%>, Class: <%=airClass1%></h3>
        <h3><i class=""></i>Fare : <%=fare1%>, Booking Fee: <%=bookingFee1%></h3><br>
        <input type="hidden" name="login" value=<%=login%>>
        <input type="hidden" name="airId" value=<%=airId1%>>
        <input type="hidden" name="flightNo" value=<%=flightNo1%>>
        <input type="hidden" name="airClass" value=<%=airClass1%>>
        <input type="hidden" name="fare" value=<%=fare1%>>
        <input type="hidden" name="bookingFee" value=<%=bookingFee1%>>
        <input type="hidden" name="depTime" value=<%=depTime1%>>
        <input type="hidden" name="legNo" value=<%=legNo1%>>
        <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-shopping-cart w3-margin-right"></i> book</button>    
      </form>
         <%
        } 
      %>
      <br> <div class="w3-text-blue">
        <h2>From <%=origin2%> To <%=destination2%></h2>
        </div>
        
         <%
        if (airId2.equals("Not Found")) {
       %>
      		<div class="w3-text-red">
      		<h2>	Not Found</h2>
      		</div>
      <%
        } else {
        
        	String flightNo2 = (String) request.getAttribute("flightNo2");
    		String legNo2 = (String) request.getAttribute("legNo2");
    		String depTime2 = (String) request.getAttribute("depTime2");
    		String arrTime2 = (String) request.getAttribute("arrTime2"); 
    		String fareType2 = (String) request.getAttribute("fareType2"); 
    		String fare2 = (String) request.getAttribute("fare2");
    		double result2 = Double.parseDouble(fare2)/10;
    		String bookingFee2 = ""+result2;
    		String airClass2= (String) request.getAttribute("airClass2");
    		String departId2 = (String) request.getAttribute("departId2");
    		String arrId2 = (String) request.getAttribute("arrId2");
    	%>	
    	 <form action="order" method="post">
         <h3><i class=""></i>FlightNo: <%=airId2%><%=flightNo2%></h3>
        <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-check-o"></i> Depart From <br><%=departId2%>, <%=origin2%></label>
            <div class="w3-container w3-section w3-light-blue">
  				<h4><%=depTime2%></h4>
			</div>
         </div>
         <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-check-o"></i> Estimated Arrive Time at<br> <%=arrId2%>, <%=destination2%></label>
            <div class="w3-container w3-section w3-blue">
  				<h4><%=arrTime2%></h4>
			</div>
         </div>
        <h3><i class=""></i>Fare Type: <%=fareType2%>, Class: <%=airClass2%></h3>
        <h3><i class=""></i>Fare : <%=fare2%>, Booking Fee: <%=bookingFee2%></h3>
        <input type="hidden" name="login" value=<%=login%>>
        <input type="hidden" name="airId" value=<%=airId2%>>
        <input type="hidden" name="flightNo" value=<%=flightNo2%>>
        <input type="hidden" name="airClass" value=<%=airClass2%>>
        <input type="hidden" name="fare" value=<%=fare2%>>
        <input type="hidden" name="bookingFee" value=<%=bookingFee2%>>
        <input type="hidden" name="depTime" value=<%=depTime2%>>
        <input type="hidden" name="legNo" value=<%=legNo2%>>
        <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-shopping-cart w3-margin-right"></i> book</button>
      </form>
        <%
        } 
      %>
      
    </div>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1532px;">

   <div class="w3-row-padding" id="Help">
    <div class="w3-col l4 m7">
      <h3>Help</h3>
       <form action="ER.pdf" target="_blank">
 				<input type="hidden" name="login" value=<%=login%>>		
  			<button class=" w3-button   w3-mobile" type="submit" ><i class="w3-margin-right"></i> ER-diagram</button>
  				</form>  
               <form action="RelationModel.pdf" target="_blank">
 				<input type="hidden" name="login" value=<%=login%>>		
  			<button class=" w3-button   w3-mobile" type="submit" ><i class="w3-margin-right"></i>Relational Model</button>
  				</form>  
      <form action="SQLcode.pdf" target="_blank">
 				<input type="hidden" name="login" value=<%=login%>>		
  			<button class=" w3-button   w3-mobile" type="submit" ><i class="w3-margin-right"></i>SQL code</button>
  				</form>  
  		<form action="description.pdf" target="_blank">
 				<input type="hidden" name="login" value=<%=login%>>		
  			<button class=" w3-button   w3-mobile" type="submit" ><i class="w3-margin-right"></i>Description</button>
  				</form> 
  		<form action="arch.pdf" target="_blank">
 				<input type="hidden" name="login" value=<%=login%>>		
  			<button class=" w3-button   w3-mobile" type="submit" ><i class="w3-margin-right"></i>architectural diagram</button>
  				</form> 
    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    </div>
  </div>

  <div class="w3-container" id="contact">
    <h2>Contact</h2>
    <p>If you have any questions, do not hesitate to ask them.</p>
    <i class="fa fa-envelope w3-text-red" style="width:30px"></i> Email: yuege.chen@stonybrook.edu<br>
    <i class="fa fa-envelope w3-text-red" style="width:30px"></i> Email: zijun.he@stonybrook.edu<br>
    <i class="fa fa-envelope w3-text-red" style="width:30px"> </i> Email: nan.jiang.1@stonybrook.edu<br>
  </div>

<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-padding-32 w3-black w3-center w3-margin-top">
  <div class="w3-xlarge w3-padding-16">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>CSE 305 2017 Fall <a href="http://www3.cs.stonybrook.edu/~sas/courses/cse305/fall17/project/main.html" target="_blank" class="w3-hover-text-green">Final Project</a></p>
</footer>



</body>
</html>
