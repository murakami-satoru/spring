<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    function getSelect(text) {
    	document.getElementById('selectedCategory').value = text;
    }
</script>
<%@ include file="/resources/css/css.jsp" %>
<title>掲示板システム</title>
</head>
<body id="home">
	<div id="wrapper">
		<div id="header">
			<h1>新規投稿</h1>
			<h2 id="loginInfo"><label>ログインユーザー：</label><c:out value="${ sessionScope.loginUser.name }"/></h2>
			<div id="menu">
				<ul>
					<li><a href="home">ホーム</a></li>
				</ul>
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
		<div id="form">
			<form:form modelAttribute="post" action="${pageContext.request.contextPath}/addPost">
				<div>
					<label>件名:</label>
					<form:input path="title" size="40" maxlength="50"/>
					<c:forEach items="${ violationMessages['_title'] }" var="message">
						<div class="error"><c:out value="${ message }"/></div>
					</c:forEach>
				</div>
				<div>
					<label>投稿内容:</label>
					<form:textarea path="text" cols="50" rows="10"/>
					<c:forEach items="${ violationMessages['_text'] }" var="message">
						<div class="error"><c:out value="${ message }"/></div>
					</c:forEach>
				</div>
				<div>
					<label>カテゴリー:</label>
					<form:input path="category" id="selectedCategory" size="12" maxlength="10"/>
					<c:forEach items="${ violationMessages['_category'] }" var="message">
						<div class="error"><c:out value="${ message }"/></div>
					</c:forEach>
				</div>
				<div>
					<label>カテゴリー一覧:</label>
					<form:select path="categories" items="${categories}" onChange="getSelect(this.value)" size="3" />
				</div>
				<div><input id="button" type="submit" value="登録"></div>
			</form:form>
		</div>
	</div>
</body>
</html>