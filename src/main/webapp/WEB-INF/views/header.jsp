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
<title>Hobby Finding</title>

<!-- css 참조 -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/findhobby.css?ver=2" /> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/main1.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/favhobby.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/findhobby.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/noticecompany.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usefindhobby.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/allhobby.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/mypage.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_plus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_IDPW.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_findID.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_findID_ok_final.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/popularity_hobby.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/hobby_detail.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/hobby_test.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/hobby_test_A.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/hobby_test_result.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usercenter.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usercenter_detail.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usercenter_detail_detail.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usercenter_detail_detail_qna.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/usercenter_question.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/login_user_findPW_A.css" />


<!-- 플러그인 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/swiper-bundle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/plugins/sweetalert2.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/plugins/lightbox/css/lightbox.min.css"/>




<style type="text/css">



</style>
</head>



<body>


<div class="container">
	<!-- header 전체 부분 -->
    <div class="header">
    	<!-- header 중앙으로 부분 -->
    	<div class="header_center">
    		<!-- 아이콘 로그인 부분  -->
    		<div class="header_top">
	    		<!-- 아이콘부분 -->
	    		<div class="icon">
	    			<a class="icon_A" href="${pageContext.request.contextPath}/main.do" >
	    				<img class="icon_img" src="${pageContext.request.contextPath}/views/img/mk_6.PNG" />
	    			</a>
	    		</div>
	    		<!-- 검색부분 -->
	    		<div class="search">
	    			<form class="search_main" action="${pageContext.request.contextPath}/findhobby.do" method="post"/>
		    			<a class="search_icon" href="${pageContext.request.contextPath}/findhobby.do">
		    				<img alt="검색" src="${pageContext.request.contextPath}/views/img/icon_magnifier_black.png" />
		    			</a>
		    			<input class="search_text" type="text" placeholder=" ex) 음악 , 운동" name="search_text" id="search_text" />
	    			</form>
	    		</div>
	    		<!-- 관심부분 -->
	    		<div class="interest_A">
	    			<a class="interest_icon" href="${pageContext.request.contextPath}/favhobby_fav.do">
	    				관심취미
	    			</a>
	    		</div>
	    		<!-- 로그인 부분 -->
	    		
	    		<% 
	    		
						request.setCharacterEncoding("UTF-8");
						members key_header = (members) session.getAttribute("key");
						session.setAttribute("key", key_header);
	    		
                    	if(key_header == null){ 
                %>
                
	    		<div class="login">
	    			<a class="login_icon" href="${pageContext.request.contextPath}/login.do">
	    				로그인
	    			</a>
	    		</div>
	    		
	    		<% }else{ 
                    	
                    	session.setAttribute("key", key_header);
                %>
                
                <div class="login">
	    			<a class="login_icon" href="${pageContext.request.contextPath}/mypage.do">
	    				마이페이지
	    			</a>
	    		</div>
	    		
                <% } %>
    		</div>
    	</div>
    </div>
</div>