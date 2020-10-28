<%-- 
    Document   : admin_custdata
    Created on : 16-Aug-2020, 12:22:56 AM
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
table{
    table-layout: fixed;
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
            <li style="float:right"><a href="admin_sales.jsp">Sales data</a>
                <li style="float:right"><a href="admin_paintings.jsp">Paintings</a></li>
            <li style="float:right"><a href="admin.jsp">Home</a></li>
        </ul>
<br>
                    <br>
<%
    try{
        String url="jdbc:mysql://localhost:3306/artist";
        String user="root";
        String pwd="";
        PrintWriter outs=response.getWriter();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url,user,pwd);
                String anme = session.getAttribute("uname").toString();
                PreparedStatement pstmt = conn.prepareStatement("select * from register where usertype=?");
                pstmt.setString(1,"customer");
                ResultSet rs=pstmt.executeQuery();
                %>
                <br><br>
    <center>
                <table width =100% height ="50" border="2">
                        <tr>
                            <td><b>Customer Name</b></td>
                            <td><b>Email Id</b></td>
                            <td><b>Phone Number</b></td>
                            <td><b>action</b></td>
                        </tr>
                </table>
                    <%
                while(rs.next()){
                    %>
                    
    <center>
                    <table width = 100% height ="50" border="1">
                        
                        <tr>
                            <td>&nbsp;&nbsp;<%=rs.getString(1)%><br></td>
                            <td>&nbsp;&nbsp;<%=rs.getString(3)%><br></td>
                            <td>&nbsp;&nbsp;<%=rs.getString(4)%><br></td>
                            <td>           
                                <form action="admin_delete_user.jsp" method="GET">
                                    <input type="hidden" id="hidden" name="username" value=<%=rs.getString(1)%>>
                                       <input type="submit" value="Remove">
                                    </form>       
                        </tr>
                    </table></center>
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