<%-- 
    Document   : index
    Created on : 12-Aug-2020, 5:10:22 PM
    Author     : SAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>artist</title>
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
a:active{
    color:black;
}
</style>
    </head>
    <%String s=(String)session.getAttribute("uname");
    if(s!=null){%>
    <body style="background-image: url('bg.jpg');">
    <marquee> <h2>Welcome <%=session.getAttribute("uname")%>
           </h2></marquee>
        <ul>
            <li style="float:right"><a href="http://localhost:8080/artgalleryproj/logout">Logout</a></li>
            <li style="float:right"><a href="changepwd.jsp">Change Password</a></li>
            <li style="float:right"><a href="artist.jsp">Home</a></li>
  
</ul>
       <div class="w3-container">
  <div class="w3-show-inline-block">
  <div class="w3-bar">
      <div class="center">
      <button class="w3-btn w3-black" onClick="parent.location='artist_gallery.jsp'">View My Paintings</button>
       <button class="w3-btn w3-teal" onClick="parent.location='artist_form.jsp'">Add New Painting</button>
      </div>
  </div>
  </div>
</div>
<%}
else{%>
<p>Invalid page access</p>
       <% }%>
    </body>
</html>

