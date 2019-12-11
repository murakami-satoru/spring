<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jkl-calendar.js"/>" charset="Shift_JIS"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>掲示板システム</title>
</head>
<body id="home">
	<div id="wrapper">
		<div id="header">
			<h2 id="loginInfo"><label>ログインユーザー：</label><c:out value="${ sessionScope.loginUser.name }"/></h2>
			<div id="menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/newPost">新規投稿</a></li>
					<li><a href="${pageContext.request.contextPath}/osi">インジェクションテスト</a></li>
					<li>　</li>
					<li>　</li>
					<li>　</li>
					<li>　</li>
					<li><a href="logout">ログアウト</a></li>
				</ul>
			</div>
			<div class="error">
				<c:if test="${ not empty errorMessages }">
					<c:forEach items="${ errorMessages }" var="message">
						<div class="error"><c:out value="${ message }"/></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div id="search">
			<form:form modelAttribute="searchPosts" action="${pageContext.request.contextPath}/searchPosts">
				<form:input path="category" size="20" maxlength="10"/>
				<form:select path="" items="${categories}" onChange="getSelect(this.value)" size="2" />
				<form:input path="fromDate" onClick="toCal.hide(); fromCal.write();"
					onChange="fromCal.getFormValue(); fromCal.hide();" readonly="true" size="8"/>
				<div id="fromCal"></div>
				<label>～</label>
				<form:input path="toDate" onClick="fromCal.hide(); toCal.write();"
					onChange="toCal.getFormValue(); toCal.hide();" readonly="true" size="8" /><div id="toCal"></div>
				<input type="submit" value="検索実行">
			</form:form>
			<form:form path="getAllPost" action="${pageContext.request.contextPath}/getAllPost" method="GET">
				<input type="submit" value="すべて表示">
			</form:form>
		</div>
<!--
		<h3 id="allPosts"><c:out value="${ fn:length(posts) }"></c:out><label>件表示中</label></h3>
		<div id="count">
			<table>
				<thead>
					<tr><th colspan="2">支店別投稿数</th></tr>
					<tr>
						<th>支店名</th>
						<th>投稿数</th>
					</tr>
				</thead>
				<c:forEach items="${ post_by_branch }" var="count">
					<tr onclick="selectPostsByBranch(${ count.id })">
						<td><div><c:out value="${ count.name }"/></div></td>
						<td>
							<div><input name="id" type="hidden" value="${ count.id }"></div>
							<div><c:out value="${ count.count }"/></div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<thead>
					<tr><th colspan="2">ユーザー別投稿数</th></tr>
					<tr>
						<th>ユーザー名</th>
						<th>投稿数</th>
					</tr>
				</thead>
				<c:forEach items="${ post_by_user }" var="count">
					<tr onclick="selectPostsByUser(${ count.id })">
						<td><div><c:out value="${ count.name }"/></div></td>
						<td>
							<div><c:out value="${ count.count }"/></div>
							<div><input type="hidden" value="${ count.id }"></div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<thead>
					<tr><th colspan="2">支店別コメント数</th></tr>
					<tr>
						<th>支店名</th>
						<th>コメント数</th>
					</tr>
				</thead>
				<c:forEach items="${ comment_by_branch }" var="count">
					<tr onclick="selectCommentsByBranch(${ count.id })">
						<td><div><c:out value="${ count.name }"/></div></td>
						<td>
							<div><c:out value="${ count.count }"/></div>
							<div><input type="hidden" value="${ count.id }"></div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<thead>
					<tr><th colspan="2">ユーザー別コメント数</th></tr>
					<tr>
						<th>ユーザー名</th>
						<th>コメント数</th>
					</tr>
				</thead>
				<c:forEach items="${ comment_by_user }" var="count">
					<tr onclick="selectCommentsByUser(${ count.id })">
						<td><div><c:out value="${ count.name }"/></div></td>
						<td>
							<div><c:out value="${ count.count }"/></div>
							<div><input type="hidden" value="${ count.id }"></div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
-->
		<div id="posts">
			<c:forEach items="${ posts }" var="post" varStatus="status">
				<div id="post"  class="kokuban-t2">
					<span id="postTitle" class="title-t2"><c:out value="${ post.title }"/></span>
					<div align="right" id="postCategory">カテゴリー：<c:out value="${ post.category }"/></div>
					<div id="postText"><c:out escapeXml="fales" value="${ post.text }"/> </div>
					<div id="postDate"><c:out value="${ post.createdDateString }"/></div>
					<div id="postName"><c:out value="${ post.userName }"/></div>
					<div id="comments">
						<label>コメント欄</label>
						<c:forEach items="${ post.comments }" var="comment">
							<div id="comment">
								<div id="commentText"><c:out escapeXml="fales" value="${ comment.text }"/></div>
								<div id="commentDate"><c:out value="${ comment.createdDateString }"/></div>
								<div id="commentName"><c:out value="${ comment.userName }"/></div>
							</div>
						<div class="deleteButton">
							<form action="deleteComment" method="post">
								<input type="hidden" name="id" value="<c:out value="${ comment.id }"/>">
								<input type="submit" value="このコメントを削除">
							</form>
						</div>
						</c:forEach>
						<div id="commentForm">
							<form:form modelAttribute="addComment" action="${pageContext.request.contextPath}/addComment">
								<form:textarea path="text" cols="50" rows="10"/>
								<form:hidden path="postId" value="${ post.id }"/>
								<input type="submit" value="コメントする">
							</form:form>
							<c:if test="${ isErrorPost == post.id }">
								<c:forEach items="${ violationMessages['_text'] }" var="message">
									<div class="error"><c:out value="${ message }"/></div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="deleteButton">
						<form action="editPost" method="post">
							<input type="hidden" name="id" value="<c:out value="${ post.id }"/>">
							<input type="submit" value="この投稿を編集">
						</form>
					</div>
					<div class="deleteButton">
						<form action="deletePost" method="post">
							<input type="hidden" name="id" value="<c:out value="${ post.id }"/>">
							<input type="submit" value="この投稿を削除">
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>