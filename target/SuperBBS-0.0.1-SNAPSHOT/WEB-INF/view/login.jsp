<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>掲示板システム</title>
    </head>
    <body>
        <h2>${ title }</h2>
        <div id="form">
	        <form:form modelAttribute="login">
				<label>ログインID:</label><form:input path="loginId" />
				<label>パスワード:</label><form:password path="password" />
				<input type="submit" value="ログイン">
	        </form:form>
        </div>
    </body>
</html>