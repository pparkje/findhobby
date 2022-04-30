<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_findhobby = (members) session.getAttribute("key");
    session.setAttribute("key", key_findhobby);
%>

<!-- 이곳에 HTML 코딩 진행  -->
<div class="findhobby_body">
	<div class="findhobby_body_center">
	
		<div class="findhobby_title_A">
			<a class="findhobby_tag" href="${pageContext.request.contextPath}/popularity_hobby.do" >
			인기취미
			</a>
		</div>
		
		<div class="findhobby_chu">
			<ul class="findhobby_chu_cont_A">
			<c:forEach var="i" begin="1" end="6" step="1" varStatus="status">
			
				<c:url value="/hobby_detail.do" var="hobby_detail_URL_A">
					<c:param name="id" value="${output_findhobby_list[status.index-1].id}" />
				</c:url>
				
				<li class="findhobby_list_A">
					<a class="findhobby_touch_tag" href="${hobby_detail_URL_A}" >
						<img class="findhobby_chu_img" src="${pageContext.request.contextPath}/views/img/${output_findhobby_list[status.index-1].h_image_a}" />
						<div class="findhobby_chu_list_sub">${output_findhobby_list[status.index-1].h_name}</div>
					</a>
				</li>
			</c:forEach>	
			</ul>
		</div>
		
		<div class="findhobby_the_button">
			<a class="findhobby_the_button_tag" href="${pageContext.request.contextPath}/popularity_hobby.do" >
			더보기
			</a>
		</div>
		
		
		<!-- 검색어 부분 나와야함 검색어 없을시 '모든 취미' 이런식으로 나와야함 -->
		<c:set var="check" value="${output_findhobby_list_all}" />	
		
		<c:choose>	
				
			<c:when test="${check == 'a'}">
				<div class="findhobby_find_sub">모든 취미</div>
			</c:when>
			
			<c:otherwise>
				<div class="findhobby_find_sub">${output_findhobby_list_all} 관련취미</div>
			</c:otherwise>
					
		</c:choose>
		
		<!-- 검색어 없을때 모두 ,검색어 있을때 관련 검색어만 -->
		<div class="findhobby_yesorno">
			<ul class="findhobby_chu_cont_B">
			<c:choose>	
				
				<c:when test="${output_findhobby_list_A == null || fn:length(output_findhobby_list_A) == 0}">
					<h1>검색어 관련 취미가 없습니다. 이런 취미는 어떠세요? ex) 아카펠라 , 제과제빵</h1>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="output_detail" items="${output_findhobby_list_A}"  varStatus="status">
					
					<c:url value="/hobby_detail.do" var="hobby_detail_URL_B">
						<c:param name="id" value="${output_detail.id}" />
					</c:url>
					
					<li class="findhobby_list_B">
						<a class="findhobby_tag_B" href="${hobby_detail_URL_B}" >
							<div class="findhobby_atag_imgcont">
								<img class="findhobby_chu_img" src="${pageContext.request.contextPath}/views/img/${output_detail.h_image_a}" />
								<div class="findhobby_chu_list_sub">${output_detail.h_name}</div>
							</div>
							<div class="findhobby_cont_hobby">${output_detail.h_cont}</div>
						</a>
					</li>
					</c:forEach>
				</c:otherwise>
			
			</c:choose>
			
			</ul>
		</div>
		
		<div class="findhobby_toomuch">
			<a class="findhobby_toomuch_tag" href="${pageContext.request.contextPath}/allhobby.do" >
			더보기
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