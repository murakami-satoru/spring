<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Re:Cypher's Bad Site</title>
	<link rel="stylesheet" type="text/css" href="resources\css\style.css">

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
	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<a><i class="icon-user"></i>${ sessionScope.loginUser.name }</a>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li><a href="home">Home</a></li>
							<li><a href="newPost">New Post</a></li>
							<li><a href="injection">Injection Test</a></li>
							<c:if test="${ sessionScope.loginUser.id == 1 && sessionScope.loginUser.id == 2}" >
							<li class="active"><a href="manage">User Manage</a></li>
							</c:if>
							<li><a href="logout">Logout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
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
					<div class="project">
						<div class="mt">
							<div class="col-md-12 animate-box">
								<form:form modelAttribute="searchUsers" action="manage"  method="POST">
									<div class="col-md-2">
										<form:input path="name" class="form-control"/>
									</div>
									<div class="col-md-2">
										<form:select path="branchName" items="${branches}" multiple="false" class="form-control"/>
									</div>
									<div class="col-md-2">
										<form:select path="departmentName" items="${departments}" multiple="false" class="form-control"/>
									</div>
									<div class="col-md-1">
										<input type="submit" value="Serch" class="btn btn-primary">
									</div>
								</form:form>
								<form:form action="manage" method="GET">
									<div class="col-md-1">
										<input type="submit" value="View All" class="btn btn-primary">
									</div>
								</form:form>
							</div>
						</div>
						<div class="mt">
							<div class="col-md-12 animate-box">
								<h3>Filter:
								<c:if test="${ !termBName.isEmpty() && termBName != null }"> Branch-[${ termBName }] </c:if>
								<c:if test="${ !termDName.isEmpty() && termDName != null  }"> Department-[${ termDName }] </c:if>
								<c:if test="${ !termName.isEmpty() && termName != null  }"> User Name-[${ termName }] </c:if>
								</h3>
								<h3>
								Views: <span id="fh5co-counter" class="counter js-counter" data-from="0" data-to="${ users.size() }" data-speed="2500" data-refresh-interval="50">${ users.size() }</span>
								</h3>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
<c:forEach items="${ users }" var="user" varStatus="status">
		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeIn">
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="testimony">
								<h3><i class="icon-user"></i>${ user.name }</h3>
								<strong class="role">Branch:<c:out value="${ user.branchName }"/></strong>
								<br>
								<strong class="role">Department:<c:out value="${ user.departmentName }"/></strong>
							</div>
							<c:if test="${ sessionScope.loginUser.id == 1}" >
							<!-- 編集ボタン -->
							<form action="editUser" method="post">
								<input type="hidden" name="id" value="${ user.id }">
								<div class="form-group">
									<input type="submit" value="do edit" class="btn btn-primary">
								</div>
							</form>
							<!-- 削除ボタン -->
							<form action="deleteUser" method="post">
								<input type="hidden" name="id" value="${ user.id }">
								<div class="form-group">
									<input type="submit" value="this user delete" class="btn btn-primary">
								</div>
							</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>
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