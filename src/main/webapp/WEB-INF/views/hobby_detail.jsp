<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_detail = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_detail);
%>



<!-- css(o) , DB처리(o) , 관심처리(o) , 유튜브처리(o) , 관련 취미처리(o) , 이미지모달처리(o)-->


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_detail_body">
	<div class="hobby_detail_body_center">
		
		<!-- 나중에 취미제목 나오게 해야함 -->
		<div class="hobby_detail_sub">${output_hobby_detail.h_option}&nbsp&nbsp > &nbsp&nbsp${output_hobby_detail.h_name}</div>
		
		<div class="hobby_detail_cont_A">
			<div class="hobby_detail_cont_A_img">
				<a class="hobby_detail_cont_A_img_tag" href="${pageContext.request.contextPath}/views/img/${output_hobby_detail.h_image_a}" data-lightbox="myphoto-1" data-title="${output_hobby_detail.h_name}" style="width:500px;">
					<img class="hobby_detail_cont_A_img_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_detail.h_image_a}" />
				</a>
			</div>
			
			<div class="hobby_detail_cont_A_cont">
				<div class="hobby_detail_cont_A_cont_textpart">
					${output_hobby_detail.h_cont}
				</div>
			</div>
			
			<div class="hobby_detail_cont_A_fav_button">
			
				<c:url value="/favhobby_add.do" var="favhobby_add_URL">
					<c:param name="id" value="${output_hobby_detail.id}" />
					<c:param name="h_name" value="${output_hobby_detail.h_name}" />
					<c:param name="h_image_a" value="${output_hobby_detail.h_image_a}" />
				</c:url>
					
				<a class="hobby_detail_cont_A_fav_button_tag" href="${favhobby_add_URL}" >
				관심등록
				</a>
			</div>
		</div>
		
		<div class="hobby_detail_cont_B">
			<a class="hobby_detail_cont_B_youtube" href="https://www.youtube.com/results?search_query=${output_hobby_detail.h_name}" >
				관련 유튜브 검색
			</a>
		</div>
		
		<div class="hobby_detail_cont_C">
		
			<div class="hobby_detail_cont_C_picture_sub">${output_hobby_detail.h_name} 취미 관련사진</div>
			
			<ul class="hobby_detail_cont_C_picture_img">
			
				<c:choose>	
				
					<c:when test="${output_hobby_detail.h_image_b == null || fn:length(output_hobby_detail.h_image_b) == 0}">
						<h1>조회결과가 없습니다.</h1>
					</c:when>
					
					<c:otherwise>
						<c:set var="photo" value="${fn:split(output_hobby_detail.h_image_b,',')}" />
						<c:forEach items="${photo}" varStatus="status" var="i">
							<li class="hobby_detail_cont_C_picture_img_list">
								<a class="hobby_detail_cont_A_img_tag" href="${pageContext.request.contextPath}/views/img/${i}" data-lightbox="myphoto-2" data-title="${output_hobby_detail.h_name}" >
									<img class="hobby_detail_cont_C_picture_img_list_img" src="${pageContext.request.contextPath}/views/img/${i}" />
								</a>
							</li>
				
						</c:forEach>
					</c:otherwise>
					
				</c:choose>
				
			</ul>
		</div>
		
		<div class="hobby_detail_cont_D">
		
			<div class="hobby_detail_cont_D_sub">${output_hobby_detail.h_name} 카테고리 연관취미</div>
			
			<ul class="hobby_detail_cont_D_find_similar">
			
				<c:forEach var="i" begin="1" end="6" step="1" varStatus="status">
				
					<c:url value="/hobby_detail.do" var="hobby_detail_URL">
						<c:param name="id" value="${output_similar_hobby[status.index-1].id}" />
					</c:url>
			
					<li class="hobby_detail_cont_D_find_similar_list">
						<a class="hobby_detail_cont_D_find_similar_list_tag" href="${hobby_detail_URL}" >
							<img class="hobby_detail_cont_D_find_similar_list_img" src="${pageContext.request.contextPath}/views/img/${output_similar_hobby[status.index-1].h_image_a}" />
							<div class="hobby_detail_cont_D_find_similar_list_cont">${output_similar_hobby[status.index-1].h_name}</div>
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
		</div>

	</div>
</div>
<!-- 이곳에 HTML 코딩 진행  -->    
<!-- footer부분 -->
<%@ include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/plugins/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/plugins/lightbox/js/lightbox.min.js"></script>





<script type="text/javascript">
$(document).ready(function(){
	lightbox.option({
		'positionFromTop' : 300,
		'fitImagesInViewport': true,
		'maxWidth' : 700,
	})
});


	
</script>
</body>

</html>