<%-- 
    Document   : artist_form
    Created on : 12-Aug-2020, 5:12:33 PM
    Author     : SAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        input[type=text], select, textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  background-color: #008080;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background-color: #008B8B;
}

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
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
        <marquee> <h2>Welcome <%=session.getAttribute("uname")%>
           </h2></marquee>
        <ul>
            <li style="float:right"><a href="http://localhost:8080/artgalleryproj/logout">Logout</a></li>
            <li style="float:right"><a href="changepwd.jsp">Change Password</a></li>
            <li style="float:right"><a href="artist.jsp">Home</a></li>
  
</ul>
  <br><br>
       <div class="container">
  <form action="artistservlet" method="post" enctype="multipart/form-data">
    <label for="painting_title">Painting Title</label>
    <input type="text" id="painting_title" name="painting_title" placeholder="Enter the title of the painting">
    <label for="price">Price</label>
    <input type="text" id="price" name="price" placeholder="Enter the price of your painting">
    <label for="date">Painting Date(When was it painted)</label>
    <input type="text" id="date" name="date" placeholder="yyyy-MM-dd">
    <label for="size_of_painting">Size of Painting</label>
    <select name="painting_size" id="size">
    <option value="ACEO(2.5x3.5in.)">ACEO(2.5x3.5in.)</option>
    <option value="Mini(up to 6in.)">Mini(up to 6in.)</option>
  <option value="Small(up to 6in.)">Small(up to 12in.)</option>
  <option value="Medium(up to 36in.)">Medium(up to 6in.)</option>
  <option value="Large(up to 60in.)">Large(up to 60in.)</option>
  <option value="Giant(over 60in.)">Giant(over 60in.)</option>
</select>
    <label for="cats">Painting Category</label>
<select name="painting_category" id="cats">
    <option value="Acrylic">Acrylic</option>
    <option value="Digital Painting">Digital Painting</option>
  <option value="Oil Painting">Oil Painting</option>
  <option value="Pastels">Pastels</option>
  <option value="Watercolors">Water colors</option>
</select>
    <label for="Description">Painting Description</label>
    <textarea id="painting_description" name="painting_description" placeholder="Describe something about your painting" style="height:200px"></textarea>
    <label for="img">Select image:</label>
    <input type="file" id="img" name="img" accept="image/*"><br>
    <center><input type="submit" value="Submit"></center>

  </form>
</div>
  <%}
else{%>
<p>Invalid page access</p>
       <% }%>
    </body>
</html>

