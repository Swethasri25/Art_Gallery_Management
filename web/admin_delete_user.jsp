<%-- 
    Document   : admin_delete_cust
    Created on : 16-Aug-2020, 12:41:28 AM
    Author     : bikumalla
--%>

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/artist";%>
<%!String user = "root";%>
<%!String pwd = "";%>
<%
String usrname = request.getParameter("username");
PrintWriter outs=response.getWriter();
if(usrname != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,pwd);
String sql="Delete from register where username=?";
ps = con.prepareStatement(sql);
ps.setString(1, usrname);
int i = ps.executeUpdate();
String query="delete from artist where artist_name=?";
ps=con.prepareStatement(query);
ps.setString(1,usrname);
int j=ps.executeUpdate();
if(i > 0)
{
outs.print("Record Deleted Successfully");
response.sendRedirect("admin.jsp");
}
else
{
outs.print("There is a problem in  deleting Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
outs.println(sql);
}
}
%>