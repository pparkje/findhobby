<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_allhobby = (members) session.getAttribute("key");
    session.setAttribute("key", key_allhobby);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="allhobby_body">
	<div class="allhobby_body_center">
	
		<div class="allhobby_title_A">취미 찾으러 오셨나요~</div>
		
		<div class="allhobby_title_B">여기 모든 취미가 있으니 관심 있는 취미를 둘러보세요!</div>
		
		<!-- 나중에 취미상세페이지로 이동 설정해야함 -->
		<div class="allhobby_list">
			<ul class="allhobby_list_cont">
				<c:forEach var="i" items="${output_allhobby}" varStatus="status">
					<li class="allhobby_list_cont_list">
						<a class="allhobby_list_cont_tag" href="${pageContext.request.contextPath}/main.do" >
							<img class="allhobby_list_cont_list_img" src="${pageContext.request.contextPath}/views/img/${i.h_image_a}" />
							<div class="allhobby_list_cont_list_sub">${i.h_name}</div>
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