<%-- 
    Document   : register
    Created on : 13-Aug-2020, 1:18:44 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
 
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
height: 30px;
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
<h2> Register </h2>
<form action="Register" method="post">
<label>User Name :</label>
<input type="text" name="username" id="Name" required pattern="^([A-Za-z|' ']{1,45})$"/>
<p style="color:red">Password should have at least one uppercase and at least one number and should be minimum 8 characters</p>
<label>Password :</label>
<input type="password" name="password" id="Password" placeholder="Minimum of 8 Characters" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" required/>
<label>Email ID :</label>
<input type="text" name="emailid" id="Email" required pattern="^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})$"/>
<label>Phone number :</label>
<input type="text" name="phonenumber" id="Phone number" required pattern="[0-9]{10}"/>
<label for="users">Choose User type:</label>

<select name="usertype" id="users" required>
    <option value="artist">artist</option>
  <option value="customer">customer</option>
</select>
            <br><br>
        <center><input type="submit" value="Register" onClick="validate()"/></a></center>


</form>

</div>
</div>
</body>
</html>
