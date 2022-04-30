<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_user_see_body">
		
	<div class="master_user_see_sub">공지정보</div>
		
	<div class="master_notice_see_cont">
			
		<ul class="master_notice_see_cont_partA">
   			<li>공지제목</li>
   			<li>공지내용</li>
   			<li>작성자</li>
   			<li>공지시간</li>
   		</ul>
    		
   		<ul class="master_notice_see_cont_partB">
   			<li class="master_notice_see_cont_partB_cont_sub">
   				<div class="master_notice_see_cont_partB_cont_sub_center">
	   			${output_notice_detail.n_subject}
	   			</div>
   			</li>
   			<li class="master_notice_see_cont_partB_cont_cont">
   				<div class="master_notice_see_cont_partB_cont_cont_center">
	   			${output_notice_detail.n_cont}
	   			</div>
   			</li>
   			<li>${output_notice_detail.n_admin}</li>
   			<li>${output_notice_detail.n_updatedate}</li>
   		</ul>
    		
	</div>	
	
	<div class="master_user_see_update">
	
		<c:url value="/master/master_notice_update.do" var="master_notice_update_URL">
			<c:param name="id" value="${output_notice_detail.id}" />
		</c:url>
		
		<a href="${master_notice_update_URL}" >
   		공지수정하기
   		</a>
	</div>
		
	<div class="master_user_see_delete">
	
		<c:url value="/master/master_notice_delete.do" var="master_notice_delete_URL">
			<c:param name="id" value="${output_notice_detail.id}" />
		</c:url>
		
		<a href="${master_notice_delete_URL}" >
    	공지 삭제 처리
    	</a>
	</div>
	
	<div class="master_user_see_mainpage">
		<a href="${pageContext.request.contextPath}/master/master_notice_main.do" >
    	공지관리 페이지로 이동
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