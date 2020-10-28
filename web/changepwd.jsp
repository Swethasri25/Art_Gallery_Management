<%-- 
    Document   : changepwd
    Created on : 15-Aug-2020, 2:44:32 PM
    Author     : SAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
a:active{
    color:black;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width:30%;
  border-style:solid;
  border-color:#008B8B;
}
input[type=submit]:hover {
  background-color: #008B8B;
}
input[type=submit] {
  background-color: #008080;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=password], select{ /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}
</style>
    </head>
    <%String s=(String)session.getAttribute("uname");
    if(s!=null){%>
    <body>
        <body style="background-image: url('bg.jpg');">
    <marquee> <h2>Welcome <%=session.getAttribute("uname")%>
           </h2></marquee>
        <ul>
            <li style="float:right"><a href="http://localhost:8080/artgalleryproj/logout">Logout</a></li>
            <li style="float:right"><a href="#about">Change Password</a></li>
            <li style="float:right"><a href="artist.jsp">Home</a></li>
</ul>
<br>
<br>
<center>
<div class="container">
       <form action="changepwd" method="post">
           <p style="color:red">Password should have at least one uppercase and at least one number and should be minimum 8 characters</p>
           <label for="old pwd">Enter your current password:</label><br>
           <input type="password" id="old pwd" name="oldpwd" placeholder="current password"><br>
           <label for="new pwd">Enter the new password:</label><br>
           <input type="password" id="newpwd" name="newpwd" placeholder="new password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"><br>
           <label for="new pwd">Reconfirm your new password:</label><br>
    <input type="password" id="newpwd2" name="newpwd2" placeholder="new password confirmation">
    <br>
    <input type="submit" value="Submit">   
    </div>
    </center>
<%}
else{%>
<p>Invalid page access</p>
       <% }%>
    </body>
</html>
