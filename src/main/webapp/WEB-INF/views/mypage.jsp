<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>


<%
	request.setCharacterEncoding("UTF-8");
	members key_mypage = (members) session.getAttribute("key");
	session.setAttribute("key", key_mypage);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="mypage_body">
	<div class="mypage_body_center">
		
		<div class="mypage_my_imfor">${output.m_name}님 개인정보</div>
		
		<div class="mypage_my_findhobby_imfor">
		
	    	<h4>
		    	안녕하세요, ${output.m_name}님.
		    	<br/>
		    	<br/>
				고객님과 FindHobby는 반가운 사이입니다.
			</h4>
			
	    </div>
	    
		<div class="mypage_logout_but">
			<a class="" href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
		</div>
		
		<h2 class="mypage_imfor_main"> 기본 정보 </h2>
		
		<div class="mypage_imfor_main_detail">
			
			<ul class="mypage_imfor_main_detail_partA">
    			<li>ID</li>
    			<li>닉네임</li>
    			<li>이메일</li>
    			<li>이름</li>
    			<li>연락처</li>
    			<li>성별</li>
    			<li>생년월일</li>
    		</ul>
    		
    		<ul class="mypage_imfor_main_detail_partB">
    			<li>${output.m_id}</li>
    			<li>${output.m_username}</li>
    			<li>${output.m_email}</li>
    			<li>${output.m_name}</li>
    			<li>${output.m_phone}</li>
    			<li>${output.m_gender}</li>
    			<li>${output.m_birthday}</li>
    		</ul>
    		
		</div>
		
		<div class="mypage_update_imfor">
			<a href="${pageContext.request.contextPath}/mypage_update.do" >
    		수정하기
    		</a>
		</div>
		
		<div class="mypage_delete_imfor">
			<a href="${pageContext.request.contextPath}/mypage_delete.do" >
	    	FindHobby 탈퇴하기
	    	</a>
		</div>

	</div>
</div>
<!-- 이곳에 HTML 코딩 진행  -->    
<!-- footer부분 -->
<%@ include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
	
</script>
</body>

</html>