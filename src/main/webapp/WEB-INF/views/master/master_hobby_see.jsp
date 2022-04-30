<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_user_see_body">
		
	<div class="master_user_see_sub">취미정보</div>
		
	<div class="master_hobby_see_contA">
			
		<ul class="master_hobby_see_cont_partA">
   			<li>취미이름</li>
   			<li>분류</li>
   			<li>취미내용</li>
   			<li>조회수</li>
   		</ul>
    		
   		<ul class="master_hobby_see_cont_partB">
   			<li>${master_output_detail.h_name}</li>
   			<li>${master_output_detail.h_option}</li>
   			<li class="master_hobby_see_cont_partB_cont">
   				<div class="master_hobby_see_cont_partB_cont_center">
	   			${master_output_detail.h_cont}
	   			</div>
   			</li>
   			<li>${master_output_detail.h_count}</li>
   		</ul>
    		
	</div>	
	
	<div class="master_hobby_see_contB">
		
		<div class="master_hobby_see_contB_main_sub">메인사진</div>
		
		<div class="master_hobby_see_contB_main_img">
			<img src="${pageContext.request.contextPath}/views/img/${master_output_detail.h_image_a}" />
		</div>
		
		<div class="master_hobby_see_contB_submain_sub">관련사진</div>
		
		<ul class="master_hobby_see_contB_sub_img">
			
			<c:choose>	
			
				<c:when test="${master_output_detail.h_image_b == null || fn:length(master_output_detail.h_image_b) == 0}">
					<h1>조회결과가 없습니다.</h1>
				</c:when>
				
				<c:otherwise>
					<c:set var="photo" value="${fn:split(master_output_detail.h_image_b,',')}" />
					<c:forEach items="${photo}" varStatus="status" var="i">
						<li class="master_hobby_see_contB_sub_img_list">
							<img class="master_hobby_see_contB_sub_img_list_img" src="${pageContext.request.contextPath}/views/img/${i}" />	
						</li>
					</c:forEach>
				</c:otherwise>
			
			</c:choose>
		
			
		</ul>
	
	</div>
	
	<div class="master_user_see_update">
	
		<c:url value="/master/master_hobby_update.do" var="master_hobby_update_URL">
			<c:param name="id" value="${master_output_detail.id}" />
		</c:url>
		
		<a href="${master_hobby_update_URL}" >
   		수정하기
   		</a>
	</div>
		
	<div class="master_user_see_delete">
	
		<c:url value="/master/master_hobby_delete.do" var="master_hobby_delete_URL">
			<c:param name="id" value="${master_output_detail.id}" />
		</c:url>
		
		<a href="${master_hobby_delete_URL}" >
    	취미 삭제 처리
    	</a>
	</div>
	
	<div class="master_user_see_mainpage">
		<a href="${pageContext.request.contextPath}/master/master_hobby_main.do" >
    	취미관리 페이지로 이동
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