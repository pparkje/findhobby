<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="study.spring.findhobby.model.members"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Hobby Finding admin</title>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_sidebar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_plus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_user_plus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_user_see.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_hobby_main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_hobby_see.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_hobby_plus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_hobby_change.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_notice_main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_notice_plus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_notice_see.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_qna_main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_qna_see.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/master_qna_answer.css" />

<!-- 플러그인 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/swiper-bundle.css"/>
<style type="text/css">


</style>

</head>
<body>
<div class="master_container">
	<!-- header 전체 부분 -->
    <div class="master_header">
    	
		<!-- 아이콘부분 메인홈으로 이동 -->
	    <div class="master_icon">
	    	<a class="master_icon_A" href="${pageContext.request.contextPath}/master/master_members.do" >
	    		<img class="master_icon_A_img" src="${pageContext.request.contextPath}/views/img/admin.png" />
	    	</a>
	    </div>
	    
	    <!-- 로그아웃 부분 -->
	    <div class="master_logout">
	    	<a class="master_logout_A" href="${pageContext.request.contextPath}/master/master_logout.do" >
	    		로그아웃
	    	</a>
	    </div>
	    	
    </div>
</div>