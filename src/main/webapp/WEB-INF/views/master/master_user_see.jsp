<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_user_see_body">
	
	<div class="master_user_see_sub">회원정보</div>
		
	<div class="master_user_see_cont">
			
		<ul class="master_user_see_cont_partA">
   			<li>ID</li>
   			<li>닉네임</li>
   			<li>이메일</li>
   			<li>이름</li>
   			<li>연락처</li>
   			<li>성별</li>
   			<li>생년월일</li>
   		</ul>
    		
   		<ul class="master_user_see_cont_partB">
   			<li>${output.m_id}</li>
   			<li>${output.m_username}</li>
   			<li>${output.m_email}</li>
   			<li>${output.m_name}</li>
   			<li>${output.m_phone}</li>
   			<li>${output.m_gender}</li>
   			<li>${output.m_birthday}</li>
   		</ul>
    		
	</div>
		
	<div class="master_user_see_update">
	
		<c:url value="/master/master_user_update.do" var="master_members_update_URL">
			<c:param name="id" value="${output.id}" />
		</c:url>
		
		<a href="${master_members_update_URL}" >
   		수정하기
   		</a>
	</div>
		
	<div class="master_user_see_delete">
	
		<c:url value="/master/master_user_delete.do" var="master_members_delete_URL">
			<c:param name="id" value="${output.id}" />
		</c:url>
		
		<a href="${master_members_delete_URL}" >
    	FindHobby 탈퇴처리
    	</a>
	</div>
	
	<div class="master_user_see_mainpage">
		<a href="${pageContext.request.contextPath}/master/master_main.do" >
    	회원관리 페이지로 이동
    	</a>
	</div>
		
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>