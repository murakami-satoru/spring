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
    function setName(col,selected) {
		var idx = selected.selectedIndex;
		var name = selected.options[idx].text;
		var obj = document.getElementById(col);
    	obj.value = name;
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
							<li><a href="injection">Injection Test</a></li>
							<c:if test="${ sessionScope.loginUser.id == 1}" >
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
							<h2>User Info</h2>
							<form:form modelAttribute="user" action="${action_user}">
								<div class="form-group">
									<!-- 名前 -->
									<label>Name</label>
									<form:input path="name" class="form-control" size="40" maxlength="50" readonly="${is_readonly}"/>
									<c:forEach items="${ violationMessages['_name'] }" var="message">
										<div class="error"><c:out value="${ message }"/></div>
									</c:forEach>

									<!-- ログインID -->
									<label>Login ID</label>
									<form:input path="loginId" class="form-control" size="40" maxlength="50" readonly="${is_readonly}"/>
									<c:forEach items="${ violationMessages['_loginId'] }" var="message">
										<div class="error"><c:out value="${ message }"/></div>
									</c:forEach>
									
									<!-- パスワード -->
									<label>Password</label>
									<form:input path="password" class="form-control" size="40" maxlength="32" readonly="${is_readonly}"/>
									<c:forEach items="${ violationMessages['_password'] }" var="message">
										<div class="error"><c:out value="${ message }"/></div>
									</c:forEach>
									
									<c:choose>
										<c:when test="${!is_readonly}">
									<!-- 支店 -->
									<label>Branch</label>
									<select name="branchId" class="form-control" onChange="setName('branchName',this)">
										<c:if test="${user.branchId == 0}">
										<option value="" selected></option>
										</c:if>
										<c:forEach items="${ branches }" var="branch" varStatus="status">
										<option value="${branch.id}" ${branch.id == user.branchId ? "selected" : null} >${branch.name}</option>
										</c:forEach>
									</select>
									
									<!-- 役職 -->
									<label>Department</label>
									<select name="departmentId" class="form-control" onChange="setName('departmentName',this)">
										<c:if test="${user.departmentId == 0}">
										<option value="" selected></option>
										</c:if>
										<c:forEach items="${ departments }" var="department" varStatus="status">
										<option value="${department.id}" ${department.id==user.departmentId ? "selected" : null} >${department.name}</option>
										</c:forEach>
									</select>
									<input type="hidden" id="branchName" name="branchName" value=""/>
									<input type="hidden" id="departmentName" name="departmentName" value=""/>
										</c:when>

										<c:when test="${is_readonly}">
									<!-- 支店 -->
									<label>Branch</label>
									<form:input path="branchName" class="form-control" size="40" maxlength="50" readonly="${is_readonly}"/>
									<form:hidden path="branchId"/>
									
									<!-- 役職 -->
									<label>Department</label>
									<form:input path="departmentName" class="form-control" size="40" maxlength="50" readonly="${is_readonly}"/>
									<form:hidden path="departmentId"/>
										</c:when>
									</c:choose>
									
									<form:hidden path="id"/>
								</div>

								<!-- 登録ボタン -->
								<div class="form-group">
									<input type="submit" value="Submit" class="btn btn-primary">
								</div>
							</form:form>
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