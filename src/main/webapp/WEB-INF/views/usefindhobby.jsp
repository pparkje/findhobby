<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_usefindhobby = (members) session.getAttribute("key");
    session.setAttribute("key", key_usefindhobby);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="usefindhobby_body">
	<div class="usefindhobby_body_center">
	
		<div class="usefindhobby_title">이용안내</div>
		
		<div class="usefindhobby_title_two">FindHobby를 이용하시는 방법!</div>
		
		<div class="usefindhobby_cont_A">◈ 첫째! 간단한 검색을 통한 취미 탐색!</div>
		
		<div class="usefindhobby_find_img">
			<img class="usefindhobby_img" src="${pageContext.request.contextPath}/views/img/banner1_mk1.png" />
		</div>
		
		<div class="usefindhobby_cont_A">◈ 둘째! 인기 취미 탐색을 통한 취미 견문 넓히기!</div>
		
		<div class="usefindhobby_find_img">
			<img class="usefindhobby_img" src="${pageContext.request.contextPath}/views/img/banner1_mk2.png" />
		</div>
		
		<div class="usefindhobby_cont_A">◈ 셋째! 간단한 테스트를 통해 취미 추천받기! </div>
		
		<div class="usefindhobby_find_img">
			<img class="usefindhobby_img" src="${pageContext.request.contextPath}/views/img/banner1_mk3.png" />
		</div>
		
		<div class="usefindhobby_cont_A">◈ 넷째! 관심있는 취미는 등록하고! 관심있는 취미 유튜브를 통해 취미를 간접 경험 해보기!</div>
		
		<div class="usefindhobby_cont_A">◈ 취미를 찾아보고 나의 취향에 맞는 취미를 가져보자!</div>
		
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