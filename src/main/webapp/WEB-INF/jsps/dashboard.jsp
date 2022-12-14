<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="icon" href="https://www.onlinelogomaker.com/blog/wp-content/uploads/2018/01/education-logo-design-1.jpg">
<link rel="icon" href="https://www.onlinelogomaker.com/blog/wp-content/uploads/2018/01/education-logo-design-1.jpg">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #008060;
}
h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
}
h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
}  
.jumbotron {
     background-image: url("https://blog.prezi.com/wp-content/uploads/2019/03/jason-leung-479251-unsplash.jpg");
    color: #fff;
     padding-top:70px;
    padding-bottom:30px;
    font-family: Montserrat, sans-serif;
}
.container-fluid {
    padding: 60px 50px;
}
.bg-grey {
    background-color: #f6f6f6;
}
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
footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #f4511e;
}
.slideanim {visibility:hidden;}
.slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
}  
.skillcard {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  flex-grow: 1;
  flex-shrink: 1;
  width: 200px;
  flex-basis: 150px;
  height: 100px;
  box-sizing: border-box;
  padding: 30px 10px;
  font-size: 14px !important;
  line-height: 1.42857143 !important;
  letter-spacing: 4px;
  border-radius: 0;
  font-family: Montserrat, sans-serif;
}

.skillcard a {
    color: #f4511e !important;
}
.skillcard a:hover{
    color: #fff !important;
    background-color: #f4511e !important;
}
.skillcard:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.skillcontainer {
  padding: 2px 16px;
}
.myskills {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-evenly;
	align-items: center;
	width: 100%;
}
.myskill {
	border-radius: 16px;
	background: #dfdddd;
	box-shadow:  10px 10px 21px #bebcbc, 
             -10px -10px 21px #fffefe;
    padding: 20px 20px;
    font-family: Montserrat, sans-serif;
    font-weight: bold;
}
.trendingskills {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-evenly;
	align-items: center;
	width: 100%;
}
.utilityoptions {
	background-color: #008060;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
    flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-evenly;
	align-items: stretch;
	display: flex;
	box-sizing: border-box;
}
.utilityelement {
	padding: 14px 16px;
	display: inline-block;
	flex-grow: 1;
  width: 100%;
  height: 100%;
	
}
.utilityoptions a {
    color: #fff !important;
    float: center;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  border: 1px solid #145A32;
  align-items: stretch;
  flex-grow: 1;
}
.utilityoptions a:hover{
    color: #145A32 !important;
    background-color: #fff !important;
  }  
@keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
}
@-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
}
@media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
}
@media screen and (max-width: 480px) {
    .trendingskills {
    flex-direction: column;
    }
    .skillcard{
    width: auto;
    }
    .utilityoptions {
    flex-direction: column;
    }
    .utilityelement {
	padding: 14px 16px;
	display: inline-block;
  	width: 100%;
  	height: 100%;
	}
}
.noSkills{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
</style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		<li><a href="showProfile">My Profile</a></li>
        <li><a href="performLogout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>Vidyalaya</h1> 
  <p>Learn or Teach anything on Vidyalaya !</p> 
</div>

<div class="container-fluid text-center">
<h2>Trending Skills</h2>
<div class="trendingskills">
	<c:forEach items="${trendingSkills}" var="trendingSkill">
	<a href="showSkillDetails?skillName=${trendingSkill}">
		<div class="skillcard">
  			<div class="skillcontainer">
    		<h4><b>${trendingSkill}</b></h4> 
  			</div>
		</div>
	</a>
	</c:forEach>
</div>
</div>

<div class="container-fluid bg-grey text-center">
<h2>My Skills</h2>
<c:choose>
  <c:when test="${mySkills.size() != 0}">
  <div class="myskills">
  	<c:forEach items="${mySkills}" var="mySkill">
    	<div class="myskill"># ${mySkill}</div>
    </c:forEach>
 </div>
 </c:when>
 <c:otherwise>
   <p class="noSkills">No skills listed.</p>
 </c:otherwise>
</c:choose>
</div>



<div class="utilityoptions">
    <a href="showLearn"><div class="utilityelement">Learn New Skill !</div></a>
    <a href="showTeach"><div class="utilityelement">Teach New Skill !</div></a>
    <a href="showEnrollments"><div class="utilityelement">My Enrollments</div></a>
    <a href="showTrainees"><div class="utilityelement">My Trainees</div></a>
    <a href="showCourses"><div class="utilityelement">My Courses</div></a>
</div>
</body>
</html>