<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<link rel="stylesheet" type="text/css" href="resources\css\style.css">
<meta charset="utf-8">


<title>掲示板システム</title>
</head>
	<body id="home">
		<div id="wrapper">
			<div id="header">
				<h2 id="loginInfo"><label>ログインユーザー：</label><c:out value="${ sessionScope.loginUser.name }"/></h2>
				<div id="menu">
					<div id="home">
						<a href="${pageContext.request.contextPath}/home">ホーム</a>
					</div>
					<div id="itest">
						<a href="${pageContext.request.contextPath}/injection">インジェクションテスト</a>
					</div>
					<div id="logout">
						<a href="logout">ログアウト</a>
					</div>
				</div>
				<div class="error">
					<c:if test="${ not empty errorMessages }">
						<c:forEach items="${ errorMessages }" var="message">
							<c:out value="${ message }"/>
						</c:forEach>
						<c:remove var="errorMessages" scope="session"/>
					</c:if>
				</div>
			</div>
			<span id="postTitle" class="title-t2">OSコマンドインジェクション</span>
	        <div id="form">
				<form action="osInjection" method="post">
					<textarea rows="5" cols="80" name="osInjection" placeholder="Math.sqrt(5)などを入力" ></textarea>
					<input type="submit" value="OSコマンドを送信">
				</form>
			</div>
			<span id="postTitle" class="title-t2">パストラバーサル</span>
	        <div id="form">
				<form action="pathTraversal" method="post">
					<input type="text" name="pathTraversal" value="../../resources/css/style.css" />
					<input type="submit" value="CSS読み込み">
				</form>
			</div>
			<div>
				<textarea rows="5" cols="80" disabled><c:out value="${ injection.result }"/></textarea>
			</div>
        </div>
    </body>
</html>