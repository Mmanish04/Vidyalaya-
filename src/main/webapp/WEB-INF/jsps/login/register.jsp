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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<title>Register User</title>
<link rel="icon" href="https://www.onlinelogomaker.com/blog/wp-content/uploads/2018/01/education-logo-design-1.jpg">
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
.jumbotron {
    background-image: url("https://blog.prezi.com/wp-content/uploads/2019/03/jason-leung-479251-unsplash.jpg");

    color: #fff;
    padding-top:40px;
    padding-bottom:5px;
    font-family: Montserrat, sans-serif;
  }
h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #004c4c;
    font-weight: 600;
    margin-bottom: 30px;
  }
  .loginfooter {
	background-color: #008060;
    letter-spacing: 2px;
    border-radius: 0;
	width: 100%;
	box-sizing: border-box;
	padding: 1px 1px;
	width: 100%;
}
.loginfooter a {
    color: #fff !important;
    float: center;
  text-align: center;
  padding: 18px 18px;
  text-decoration: none;
  font-size: 17px;
  border: 1px solid #145A32;
  display: inline-block;
  width: 100%;
  height: 100%;
  }
  .loginfooter a:hover{
    color: #145A32 !important;
    background-color: #fff !important;
  }
    .neomorphism{
  	width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffff;
    font-family: Montserrat, sans-serif;
    padding: 30px;
    padding-top: 50px;
  }
</style>
<script>
$(document).ready(function() {
    $('#register_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstName: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please enter your First Name'
                    }
                }
            },
             lastName: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Please enter your Last Name'
                    }
                }
            },
			 date: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Date of Birth'
                    }
                }
            },
            country: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Country'
                    }
                }
            },
			 password: {
                validators: {
                     stringLength: {
                        min: 7,
                    },
                    notEmpty: {
                        message: 'Please enter your Password'
                    }
                }
            },
			confirmPassword: {
                validators: {
                     stringLength: {
                        min: 7,
                    },
                    notEmpty: {
                        message: 'Please confirm your Password'
                    },
					identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Email Address'
                    },
                    emailAddress: {
                        message: 'Please enter a valid Email Address'
                    }
                }
            },
            phoneNumber: {
                validators: {
                  stringLength: {
                        min: 10, 
                        max: 15,
                    notEmpty: {
                        message: 'Please enter your Contact No.'
                     }
                }
            },
                }
            }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#register_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
</script>
</head>
<Body background="https://static-cse.canva.com/blob/142356/removing-background-images_Unsplash.jpeg">   
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.html">Home </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="support">Contact Us?</a></li>
      </ul>
  </div>
</nav>
<div class="jumbotron text-center">
  <h1>Vidyalaya</h1> 
  <p>Learn or Teach anything on Vidyalaya!</p> 
</div>

<h2 class="text-center">User Registration:-</h2><br />

<div class="neomorphism">
<form class="form-horizontal" action="registerUser" method="post" id="register_form">

<div class="form-group">
  <label class="col-md-4 control-label">First Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input class="form-control" placeholder="Enter First Name" type="text" name="firstName" />
   </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Last Name</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="lastName" placeholder="Last Name" class="form-control"/>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Date of birth</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input type="date" name="dateOfBirth" placeholder="YYYY-MM-DD" class="form-control"/>
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Gender</label> 
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    	<label class="radio-inline"><input type="radio" name="gender" value="male"/>Male</label>
    	<label class="radio-inline"><input type="radio" name="gender" value="female"/>Female</label>
    	<label class="radio-inline"><input type="radio" name="gender" value="not_specified"/>Not Specified</label>
    	</div>
    </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Country</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
  <input type="text" name="country" placeholder="Country" class="form-control" /> 
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Phone Number</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input type="text" name="phoneNumber" placeholder="+01234567890" class="form-control" /> 
    </div>
  </div>
</div>
 <div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="email" placeholder="abcdef@ghi.xyz" class="form-control"  type="email">
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password" name="password"  placeholder="Password" class="form-control">
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Confirm Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password" name="confirmPassword" placeholder="Confirm Password" class="form-control">
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspREGISTER <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>    
</form>
</div>
<br />
<div class="loginfooter">
	<a href="showLogin">Already a member? Click here  to go to the login page.</a>
</div>
</body>
</html>