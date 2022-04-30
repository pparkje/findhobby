<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FindHobby</title>
</head>
<body>
	<h1>UserAgent</h1>
	<p>${user_agent}</p>
	
	<h1>Browser</h1>
	<p>${browser}</p>
	
	<h1>OS</h1>
	<p>${os}</p>
	
	<h1>Device</h1>
	<p>${device}</p>
	
</body>
</html>