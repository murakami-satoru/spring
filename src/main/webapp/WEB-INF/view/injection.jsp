<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Re:Cypher's Bad Site</title>
	<script type="text/javascript" src="<c:url value="/resources/js/jkl-calendar.js"/>" charset="Shift_JIS"></script>
	<link rel="stylesheet" type="text/css" href="resources\css\style.css">
	<script>
    function getSelect(text) {
    	document.getElementById('selectedCategory').value = text;
    }
	</script>
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
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<a><i class="icon-user"></i><c:out value="${ sessionScope.loginUser.name }"/></a>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li><a href="home">Home</a></li>
							<li><a href="newPost">New Post</a></li>
							<li class="active"><a href="injection">Injection Test</a></li>
							<c:if test="${ sessionScope.loginUser.id == 1}" >
							<li><a href="manage">User Manage</a></li>
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
		<div class="error">
			<c:if test="${ not empty errorMessages }">
				<c:forEach items="${ errorMessages }" var="message">
					<c:out value="${ message }"/>
				</c:forEach>
				<c:remove var="errorMessages" scope="session"/>
			</c:if>
		</div>
		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeIn">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInUp">
							<h2>Injection Test</h2>
							<!-- OSコマンドインジェクション -->	
							<form action="osInjection" method="post">
								<div class="form-group">
									<label>OS Command Injection</label>
										<textarea class="form-control" rows="5" cols="80" name="osInjection"></textarea>
								</div>
								<!-- 登録ボタン -->
								<div class="form-group">
									<input type="submit" value="Submit" class="btn btn-primary">
								</div>
							</form>
							<!-- パストラバーサル -->	
							<form action="pathTraversal" method="post">
								<div class="form-group">
									<label>OS Command Injection</label>
										<input type="hidden" name="pathTraversal" value="/var/lib/tomcat/webapps/vaddyTest/resources/css/style.css" />
								</div>
								<!-- CSS読み込み -->
								<div class="form-group">
									<input type="submit" value="Load CSS" class="btn btn-primary">
								</div>
							</form>

							<!-- 実行結果 -->
							<label>Result</label>
							<pre><c:out value="${ injection.result }"/></pre>
						</div>
					</div>
				</div>
			</div>
		</div>
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