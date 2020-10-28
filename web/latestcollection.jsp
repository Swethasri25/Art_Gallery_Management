<%-- 
    Document   : artist_gallery
    Created on : 12-Aug-2020, 9:03:35 PM
    Author     : SAM
--%>

<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel='stylesheet' href='external.css' />
    <script type='text/javascript' src='buttonaction.js'></script>
        <title>Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #008080;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
 .center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px; 
  margin-left: 500px;
  margin-top: 150px;
}
</style>
    </head>
            <script>
                function change(clicked_id) {
                       document.querySelector("#"+clicked_id).textContent = '$ SOLD $';
                       document.getElementById(clicked_id).style.backgroundColor='Green'; 
                       document.getElementById(clicked_id).disabled = true;
                       
                   }         
</script>            
    </head>
    <%String s=(String)session.getAttribute("uname");
    if(s!=null){%>
    <body style="background-image: url('bgsoma.jpeg');">
    <center> <h2><marquee>Welcome
            <%=session.getAttribute("uname")%>!!!</marquee></h2></center>
        <ul>
  <li style="float:right"><a href="http://localhost:8080/artgalleryproj/logout">Logout</a></li>
  <li style="float:right"><a href="changepwd_cust.jsp">Change Password</a></li>
  <li style="float:right"><a href="myorders.jsp">My Orders</a></li>
  <li style="float:right"><a href="latestcollection.jsp">Latest Collection</a></li>
  <li style="float:right"><a href="customer.jsp">Home</a></li>
</ul>
        <center>       <h1>While We fill your
<textarea rows="2" cols="4" style="background-color:GreenYellow;color:OrangeRed;">
 Life
</textarea>
  with Art</h1>
        <h2>You Look at our Erstwhile collection for a while....</h2>
        </center>
    </body>
</html>
<%
    try{
    String url="jdbc:mysql://localhost:3306/artist";
                String user="root";
                String pwd="";
                PrintWriter outs=response.getWriter();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url,user,pwd);
               //String anme=session.getAttribute("uname").toString();
                //out.println("kp");
                out.println("<marquee>Recently added products are displayed!</marquee>");
               /* PreparedStatement pt = conn.prepareStatement("SELECT COUNT(*)FROM artist");
                ResultSet rscount=pt.executeQuery();
                int kp=0;
                while(rscount.next())
                {
                    kp=rscount.getInt(1);
                    //kp=rscount.getInt("COUNT(*)");
                }*/
               // out.println(kp);
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM artist where status=? and soldstatus=? order by painting_id desc");
                //out.println("bye");
                pstmt.setInt(1,1);
                pstmt.setInt(2,0);
                ResultSet rs=pstmt.executeQuery();
                //out.println("hi");
                while(rs.next()){
                    byte[] imgData = rs.getBytes("painting"); // blob field 
            String encode = Base64.getEncoder().encodeToString(imgData);
            request.setAttribute("imgBase", encode);
            %>
<table width="750" height="200" border="0">
  <tr>
    <td>
                <img src="data:image/jpeg;base64,${imgBase}" width="300" height="300" alt=hname/></td>
    <td><b>ID:</b>&nbsp;&nbsp;<%=rs.getString(2)%><br>
        <b>Artist:</b>&nbsp;&nbsp;<%=rs.getString(1)%><br>
        <b>Title:</b>&nbsp;&nbsp;<%=rs.getString(3)%><br>
        <b>Description:</b>&nbsp;&nbsp;<%=rs.getString(7)%><br>
        <b>Price:</b>&nbsp;&nbsp;
    <%=rs.getInt(4)%><br>
    <b>Date:</b>&nbsp;&nbsp;
    <%=rs.getDate(5)%><br>
    <b>Size:</b>&nbsp;&nbsp;
    <%=rs.getString(8)%><br>
    <b>Category:</b>&nbsp;&nbsp;
    <%=rs.getString(6)%><br>
    <button style="color:black" onClick="parent.location='confirmation form.jsp'" id='<%=rs.getString(2)%>' value="Buy Now">Buy Now</Button>
        </td>
  </tr>
                <%;
                    }
                
    }
    catch(Exception e){}
    %>
    <%}
else{%>
<p>Invalid page access</p>
       <% }%>