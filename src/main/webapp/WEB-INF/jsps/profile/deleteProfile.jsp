<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
.navbar {
    margin-bottom: 0;
    background-color: #004c4c;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
}
.navbar li a, .navbar .navbar-brand {
    color: #fff !important;
}
.navbar-nav li a:hover, .navbar-nav li.active a {
    color: #145A32 !important;
    background-color: #fff !important;
}
.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}
  .profileheading{
  color: #FF0000;
  padding: 60px 10px 10px 20px;
  text-align: center;
  }
  .delete-warning{
   color: #FF0000;
  	border-radius: 2px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    border: 1px solid #145A32;
    font-size: 16px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 2px;
    font-family: Montserrat, sans-serif;
    width: 80%;
    margin: 0 auto;
    padding: 16px;
  }
  .deleteform{
  padding: 50px;
  text-align: center;
  margin: 0 auto;
  }
</style>
<title>Delete Profile</title>
<link rel="icon" href="https://www.onlinelogomaker.com/blog/wp-content/uploads/2018/01/education-logo-design-1.jpg">
</head>
<body>

<nav id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="showDashboard">Home</a>
    </div>
</nav>
<h2 class="profileheading">Delete Profile</h2><br />

<p class="delete-warning">Are you sure you want to delete your profile ?<br />
All your achievement as well as your current enrollments info will be deleted.<br />
Note that this action cannot be undone !<br />
</p>

<div class="deleteform">
<form autocomplete="off" action="deleteProfile">
<h4>To delete your account enter "CONFIRM" and click delete.<br /></h4><br />
<input type="text" id="deleteCheck"  onkeyup="stoppedTyping()" /> 
<input type="submit" id="deleteButton" value="DELETE" disabled />
<script type="text/javascript">
function stoppedTyping(){
var i = document.getElementById("deleteCheck");
if(i.value != "CONFIRM")
    {
    document.getElementById("deleteButton").disabled=true;
    }
else
    document.getElementById("deleteButton").disabled=false;
}
</script>
</form>
</div>
</body>
</html>