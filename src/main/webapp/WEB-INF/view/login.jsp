<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Re:Cypher's Bad Site</title>
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/css/magnific-popup.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="resources/css/style.css">

	<!-- Modernizr JS -->
	<script src="resources/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="resources/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(resources/images/img_bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>Re:Cypher's Bad Site</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 animate-box">
						<h3>Let's Hack</h3>
						<div class="error">
							<c:if test="${ not empty errorMessages }">
								<c:forEach items="${ errorMessages }" var="message">
									<c:out value="${ message }"/>
								</c:forEach>
								<c:remove var="errorMessages" scope="session"/>
							</c:if>
						</div>
						<form:form modelAttribute="login">
							<div class="row form-group">
								<div class="col-md-6">
									<label for="fname">Login ID</label>
									<form:input path="loginId" class="form-control" />
								</div>
								<div class="col-md-6">
									<label for="fname">password</label>
									<form:password path="password" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<input type="submit" value="Login" class="btn btn-primary">
							</div>
						</form:form>		
					</div>
					<div class="col-md-5 col-md-push-1 animate-box">
						
						<div class="fh5co-contact-info">
							<h3>Contact Information</h3>
							<ul>
								<li class="url"><a href="https://recypher.alhinc.jp/contact/">Re:Cypher</a></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script src="resources/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="resources/js/main.js"></script>

	</body>
</html>

