<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_populartity_hobby = (members) session.getAttribute("key");
    session.setAttribute("key", key_populartity_hobby);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="popularity_hobby_body">
	<div class="popularity_hobby_body_center">
	
		<div class="popularity_hobby_sub">인기취미</div>
		
		<!-- 인기취미 10개임 -->
		<div class="popularity_hobby_cont">
			<ul class="popularity_hobby_cont_A">
			
				<c:forEach var="i" begin="1" end="10" step="1" varStatus="status">
				
					<c:url value="/hobby_detail.do" var="hobby_detail_URL">
						<c:param name="id" value="${output_popularity_hobby[status.index-1].id}" />
					</c:url>
				
					<li class="popularity_hobby_list">
						<a class="popularity_hobby_list_tag" href="${hobby_detail_URL}" >
							<div class="popularity_hobby_list_rank">조회수 <strong>${i}위</strong> 취미</div>
							
							<div class="popularity_hobby_list_imgsub">
								<img class="popularity_hobby_list_img" src="${pageContext.request.contextPath}/views/img/${output_popularity_hobby[status.index-1].h_image_a}" />
								<div class="popularity_hobby_list_sub">${output_popularity_hobby[status.index-1].h_name}</div>
							</div>
							
							<div class="popularity_hobby_list_cont">${output_popularity_hobby[status.index-1].h_cont}</div>
							
							<div class="popularity_hobby_list_count">조회수: <strong>${output_popularity_hobby[status.index-1].h_count}</strong></div>
							
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
<script type="text/javascript">
	
</script>
</body>

</html>