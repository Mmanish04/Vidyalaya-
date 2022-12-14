<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
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
  .amounttopay {
   border-radius: 2px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    border: px solid #f4511e;
    font-size: 16px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    font-family: Montserrat, sans-serif;
    width: 80%;
    margin: 0 auto;
    padding: 16px;
    padding-top:100px;
  }
  }
</style>
<script>
$(document).ready(function() {
    $('#payment_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            paymentGateway: {
                validators: {
                    notEmpty: {
                        message: 'Please select payment gateway'
                    }
                }
            },
                }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#payment_form').data('bootstrapValidator').resetForm();

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
<title>Checkout</title>
<link rel="icon" href="https://www.onlinelogomaker.com/blog/wp-content/uploads/2018/01/education-logo-design-1.jpg">
</head>
<body>
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
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		<li><a href="showProfile">My Profile</a></li>
        <li><a href="performLogout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<form action="enroll" method="post" class="form-horizontal amounttopay" id="payment_form">


<div class="form-group">
  <label class="col-md-4 control-label" >Amount to pay</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
  <input type="text" name="phoneNumber" value=${skill.fee} class="form-control" READONLY/> 
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Select Payment Option:	</label> 
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
    	<label class="radio"><input type="radio" name="paymentGateway" value="UPI"/>UPI</label>
    	<label class="radio"><input type="radio" name="paymentGateway" value="RazorPay"/>RazorPay</label>
    	<label class="radio"><input type="radio" name="paymentGateway" value="Stripe"/>Stripe</label>
    	<label class="radio"><input type="radio" name="paymentGateway" value="Paypal"/>Paypal</label>
    	</div>
    </div>
</div>
<input type="text" name="skillId" value="${skill.id}" hidden/>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspProceed to Pay <span class="glyphicon glyphicon-menu-right"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
</form>
</body>
</html>