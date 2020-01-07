<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>掲示板システム</title>
	<script type="text/javascript" src="<c:url value="/resources/js/jkl-calendar.js"/>" charset="Shift_JIS"></script>
	<link rel="stylesheet" type="text/css" href="resources\css\style.css">
	<script>
		function getSelect(text) {
			document.getElementById('category').value = text;
		}

		var toCal = new JKL.Calendar("toCal","searchPosts","toDate");
		var fromCal = new JKL.Calendar("fromCal","searchPosts","fromDate");
		toCal.max_date = new Date();
		fromCal.max_date = new Date();

		function selectPostsByBranch(id) {
			select('selectPostsByBranch',id);
		}
		function selectPostsByUser(id) {
			select('selectPostsByUser',id);
		}
		function selectCommentsByBranch(id) {
			select('selectCommentsByBranch',id);
		}
		function selectCommentsByUser(id) {
			select('selectCommentsByUser',id);
		}

		function select(action,id){
			var form = document.createElement("FORM");
			form.action = action;
			form.method = "post";

			var target_id = document.createElement("input");
			target_id.type = "text";
			target_id.name = "target_id";
			target_id.value = id;

			form.appendChild(target_id);
			form.submit();
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
							<li class="active"><a href="home">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/newPost">New Post</a></li>
							<li><a href="${pageContext.request.contextPath}/injection">injection Test</a></li>
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
<c:forEach items="${ posts }" var="post" varStatus="status">
		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeIn">
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="testimony">
								<h3><c:out value="${ post.title }"/></h3>
								<strong class="role">Category:<c:out value="${ post.category }"/></strong>
								<br>
								<strong class="role">Date:<c:out value="${ post.createdDateString }"/></strong>
								<blockquote>
									&ldquo;<c:out escapeXml="fales" value="${ post.text }"/>&rdquo;
								</blockquote>
								<h4><i class="icon-user"></i><c:out value="${ post.userName }"/></h4>
							</div>
							<!-- 編集ボタン -->
							<form action="editPost" method="post">
								<input type="hidden" name="id" value="<c:out value="${ post.id }"/>">
								<div class="form-group">
									<input type="submit" value="do edit" class="btn btn-primary">
								</div>
							</form>
							<!-- 削除ボタン -->
							<form action="deletePost" method="post">
								<input type="hidden" name="id" value="<c:out value="${ post.id }"/>">
								<div class="form-group">
									<input type="submit" value="this post delete" class="btn btn-primary">
								</div>
							</form>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
							<div class="mt">
								<h2>Comment</h2>
								<c:forEach items="${ post.comments }" var="comment">
									<strong class="role">Date:<c:out value="${ comment.createdDateString }"/></strong>
									<blockquote>
										&ldquo;<c:out escapeXml="fales" value="${ comment.text }"/>&rdquo;
									</blockquote>
									<h4><i class="icon-user"></i><c:out value="${ comment.userName }"/></h4>
									<form action="deleteComment" method="post">
										<input type="hidden" name="id" value="<c:out value="${ comment.id }"/>">
										<div class="form-group">
											<input type="submit" value="this comment delete" class="btn btn-primary">
										</div>
									</form>
								</c:forEach>
								<c:if test="${ post.comments.isEmpty() }">
									<blockquote>
										&ldquo;No commented&rdquo;
									</blockquote>
								</c:if>
							</div>
							<div id="commentForm">
								<form:form modelAttribute="addComment" action="${pageContext.request.contextPath}/addComment">
									<form:textarea path="text" cols="70" rows="5"/>
									<form:hidden path="postId" value="${ post.id }"/>
									<div class="form-group">
										<input type="submit" value="do commnet" class="btn btn-primary">
									</div>
								</form:form>
								<c:if test="${ isErrorPost == post.id }">
									<c:forEach items="${ violationMessages['_text'] }" var="message">
										<div class="error"><c:out value="${ message }"/></div>
									</c:forEach>
								</c:if>
							</div>
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