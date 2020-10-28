<%-- 
    Document   : confirmation form
    Created on : Aug 13, 2020, 9:02:05 PM
    Author     : SOMASHEKHAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel='stylesheet' href='loader.css'/>
        <script type='text/javascript' src='loader.js'></script>
        <title>JSP Page</title>
    </head>
    <%String s=(String)session.getAttribute("uname");
    if(s!=null){%>
    <body style="background-image: url('bg.jpg');">
    <center>
        <h1>Lets Verify!</h1>
        <form action="pidorder" method="post">
            <label for="pidconfirm"> Enter Painting Pid to confirm the order</label>
            <input type="text" name="pidcnfrm">
            <br>
            <br>
            <input type="submit" value="Submit">
        </form>
        <br>
        <br>
        <br>
        <button class="w3-btn w3-teal" onClick="parent.location='customer.jsp'">Cancel Transaction</button>
    </center>
    <%}
else{%>
<p>Invalid page access</p>
       <% }%>
    </body>
</html>
