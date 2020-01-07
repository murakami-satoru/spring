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
				<h2>${ title }</h2>
				<div class="error">
					<c:if test="${ not empty errorMessages }">
						<c:forEach items="${ errorMessages }" var="message">
							<c:out value="${ message }"/>
						</c:forEach>
						<c:remove var="errorMessages" scope="session"/>
					</c:if>
				</div>
			</div>
	        <div id="form">
		        <form:form modelAttribute="login">
		        	<div>
						<label>ログインID:</label><form:input path="loginId" />
					</div>
					<div>
						<label>パスワード:</label><form:password path="password" />
					</div>
					<div><input type="submit" value="ログイン"></div>
				</form:form>
	        </div>
        </div>
    </body>
</html>