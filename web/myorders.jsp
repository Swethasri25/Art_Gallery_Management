<%-- 
    Document   : myorders
    Created on : 12-Aug-2020, 9:03:35 PM
    Author     : Somashekhar
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
        <center>
        <h2>Keep Buying More!</h2>
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
               String anme=session.getAttribute("uname").toString();
                PreparedStatement pstmt = conn.prepareStatement("select * from sales where customer_name=? order by order_date desc");
                //String h="sappap";
                pstmt.setString(1,anme);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
            %>
<table width="750" height="200" border="0">
  <tr>
    <td><b>Painting_ID:</b>&nbsp;&nbsp;<%=rs.getString(1)%><br>
        <b>Artist_name:</b>&nbsp;&nbsp;<%=rs.getString(2)%><br>
        <b>Title:</b>&nbsp;&nbsp;<%=rs.getString(5)%><br>
        <b>Price:</b>&nbsp;&nbsp;<%=rs.getInt(4)%><br>
        <b>Purchase Date:</b>&nbsp;&nbsp;<%=rs.getDate(6)%><br>
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