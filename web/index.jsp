<%-- 
    Document   : index
    Created on : 13-Aug-2020, 7:58:53 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <br>
    <center><font face = "Comic Sans MS" size =" 6">Welcome to Art Gallery System!!! </font><br /></center>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
 
<style>
  body{
        background-image: url('image14.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
    }
h2{
background-color: #FEFFED;
padding: 30px 35px;
margin: -10px -50px;
text-align:center;
border-radius: 10px 10px 0 0;
}
hr{
margin: 10px -50px;
border: 0;
border-top: 1px solid #ccc;
margin-bottom: 40px;
}
div.container{
width: 400px;
height: 410px;
margin:35px auto;
font-family: 'Raleway', sans-serif;
}
div.main{
width: 300px;
padding: 10px 50px 25px;
border: 2px solid gray;
border-radius: 10px;
font-family: raleway;
float:left;
margin-top:30px;
}
input[type=text],input[type=password]{
width: 100%;
height: 20px;
padding: 5px;
margin-bottom: 5px;
margin-top: 5px;
border: 2px solid #ccc;
color: #4f4f4f;
font-size: 16px;
border-radius: 5px;
}
label{
color: #464646;
text-shadow: 0 1px 0 #fff;
font-size: 14px;
font-weight: bold;
}
center{
font-size:32px;
}
.note{
color:red;
}
.valid{
color:green;
}
.back{
text-decoration: none;
border: 1px solid rgb(0, 143, 255);
background-color: rgb(0, 214, 255);
padding: 3px 20px;
border-radius: 2px;
color: black;
}
input[type=submit]{
font-size: 16px;
background: linear-gradient(#ffbc00 5%, #ffdd7f 100%);
border: 1px solid #e5a900;
color: #4E4D4B;
font-weight: bold;
cursor: pointer;
width: 30%;
border-radius: 5px;
padding: 10px 0;
outline:none;
}
input[type=submit]:hover{
background: linear-gradient(#ffdd7f 5%, #ffbc00 100%);
}
</style>
</head>
<body>
<div class="container">
<div class="main">
<h2> Login </h2>
<form action="login" method="post">
<label>User Name :</label>
<input type="text" name="username" required/>
<label>Password :</label>
<input type="password" name="password" required/>

<center><input type="submit" value="Login"/></center>
</form>
<br>
<center><a href="register.jsp"><input type="submit" value="Signup"/></a></center>

</div>
</div>

</body>
</html>
