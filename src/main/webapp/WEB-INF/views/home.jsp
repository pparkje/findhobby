<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>FindHobby</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/style.css" />
</head>
<body>
<h1>
	Hello world!  
</h1>

<!-- 홈 컨트롤러로 접근하기 위한 링크  -->
<a href="${pageContext.request.contextPath}">HomeController</a>

<h2>HomeController</h2>
<ul>
	<li><a href="${pageContext.request.contextPath}">home 페이지</a></li>
	<li><a href="${pageContext.request.contextPath}/user_agent.do">UserAgent 확인 예제</a></li>
</ul>

<p> The time on the server is ${serverTime}. </p>
<script src="${pageContext.request.contextPath}/views/assets/js/script.js"></script>
</body>
</html>