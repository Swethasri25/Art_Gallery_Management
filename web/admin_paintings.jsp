<%-- 
    Document   : admin_paintings
    Created on : 16-Aug-2020, 1:33:54 AM
    Author     : bikumalla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
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
    <%String s=(String)session.getAttribute("uname");
    if(s!=null){%>
    <body>
        <ul>
            <li style="float:right"><a href="http://localhost:8080/artgalleryproj/logout">Logout</a></li>
            <li style="float:right"><a href="changepwd_admin.jsp">Change password</a></li>
            <li style="float:right"><a href="admin_artistdata.jsp">Artist Data</a></li>
            <li style="float:right"><a href="admin_custdata.jsp">Customer data</a></li>
            <li style="float:right"><a href="admin_sales.jsp">Sales data</a></li>
            <li style="float:right"><a href="admin_paintings.jsp">Paintings</a></li>
             <li style="float:right"><a href="admin.jsp">Home</a></li>
                
        </ul>

<%
    try{
        String url="jdbc:mysql://localhost:3306/artist";
        String user="root";
        String pwd="";
        PrintWriter outs=response.getWriter();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url,user,pwd);
                String anme = session.getAttribute("uname").toString();
               //outs.println(anme);
                PreparedStatement pstmt = conn.prepareStatement("select * from artist");
                ResultSet rs=pstmt.executeQuery();
                String approval="";
                String sold="";
                while(rs.next()){
                    byte[] imgData = rs.getBytes("painting"); // blob field 
                    String encode = Base64.getEncoder().encodeToString(imgData);
                    request.setAttribute("imgBase", encode);
                    if(rs.getInt(10)==1)
                    approval="Approved";
                    else
                    approval="Waiting for approval";
                    if(rs.getInt(11)==1)
                    sold="Sold";
                    else
                    sold="In Sale";
                    
                    %>
                    <table width = "750" height ="200" border="0">
                        <tr>
                            <td><img src="data:image/jpeg;base64,${imgBase}" width="250" height="250" alt=hname/></td>
                            <td><b>ID:</b>&nbsp;&nbsp;<%=rs.getString(2)%><br>
                                <b>Title:</b>&nbsp;&nbsp;<%=rs.getString(3)%><br>
                                <b>Artist Name:</b>&nbsp;&nbsp;<%=rs.getString(1)%><br>
                                <b>Description:</b>&nbsp;&nbsp;<%=rs.getString(7)%><br>
                                <b>Price:</b>&nbsp;&nbsp;<%=rs.getInt(4)%><br>
                                <b>Date:</b>&nbsp;&nbsp;<%=rs.getDate(5)%><br>
                                <b>Size:</b>&nbsp;&nbsp;<%=rs.getString(8)%><br>
                                <b>Category:</b>&nbsp;&nbsp;<%=rs.getString(6)%><br>
                                <b>Approval Status:</b>&nbsp;&nbsp;<%=approval%><br>
                                <b>Selling Status:</b>&nbsp;&nbsp;<%=sold%>
                        </tr>
                    </table>
                    <%
                            
                                    }}
    catch(Exception e){}
%>
<%}
else{%>
<p>Invalid page access</p>
       <% }%>
    </body>
</html>