<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_favhobby = (members) session.getAttribute("key");
    session.setAttribute("key", key_favhobby);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="favhobby_body">
	<div class="favhobby_body_center">
	

		<div class="favhobby_title">관심취미</div>
		<div class="no_favhobby">
			<a class="find_hobby_favhobby" href="${pageContext.request.contextPath}/hobby_test.do" >
				나의 <strong>취향</strong>에 맞는 <strong>취미</strong>를 찾아 볼까요?
			</a>
		</div>
		<div class="yes_favhobby">
			<ul>
				
				<c:choose>	
				
					<c:when test="${output_favhobby_list == null || fn:length(output_favhobby_list) == 0}">
						<h1>관심 취미가 없습니다. 취미를 찾으러 가볼까요?</h1>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="i" items="${output_favhobby_list}" varStatus="status">
							
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i.i_h_id}" />
						</c:url>
					
						<li class="yes_favhobby_list">
							<a class="yes_favhobby_tag" href="${hobby_detail_URL}" >
								<img class="yes_favhobby_img" src="${pageContext.request.contextPath}/views/img/${i.i_h_image_a}" />
								<div class="yes_favhobby_cont">${i.i_h_name}</div>
							</a>
						</li>
						
					</c:forEach>
					</c:otherwise>
					
				</c:choose>
				
				
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