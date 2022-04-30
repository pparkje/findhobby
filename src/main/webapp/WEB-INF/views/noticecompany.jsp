<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_noticecompany = (members) session.getAttribute("key");
    session.setAttribute("key", key_noticecompany);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="noticecompany_body">
	<div class="noticecompany_body_center">
	
		<div class="noticecompany_title">회사개요</div>
		
		<div class="noticecompany_name">
			<ul class="noticecompany_name_list">
				<li>◈ 회사명 : AhAhIT</li>
				<li>◈ 대표이사 : 박재현</li>
				<li>◈ 설립일 : 2022-02-28</li>
				<li>◈ 본사소재지 : 경기도 성남시 분당구 판교역로 146번길 20</li>
			</ul>
		</div>
		
		<div class="noticecompany_name_represent_A">AhAhIT 대표 사업</div>
		<div class="noticecompany_name_represent_B">FindHobby 개요</div>
		
		<div class="noticecompany_name_find_img">
			<img class="noticecompany_name_find_img_img" src="${pageContext.request.contextPath}/views/img/banner1_mk1.png" />
		</div>
		
		<div class="noticecompany_name_find_cont">◎ 자신이 뭘 좋아하는지에 대해 생각해본 적이 있나요? 혹시 좋아하는걸 더 배워보고 싶지는 않았나요?</div>
		
		<div class="noticecompany_name_find_img">
			<img class="noticecompany_name_find_img_img" src="${pageContext.request.contextPath}/views/img/banner1_mk2.png" />
		</div>
		
		<div class="noticecompany_name_find_cont">◎ 넌 뭘 잘해? 라는 질문에 대답을 망설이신적은 없나요?</div>
		<div class="noticecompany_name_find_cont">◎ 무언가를 잘하고 싶었지만 그게 뭔지 조차 몰라서 잘할 수가 없었던 적은 없으셨나요?</div>
		
		<div class="noticecompany_name_find_img">
			<img class="noticecompany_name_find_img_img" src="${pageContext.request.contextPath}/views/img/banner1_mk3.png" />
		</div>
		
		<div class="noticecompany_name_find_cont">◎ FindHobby에서 찾아보세요 본인이 좋아하고 잘하는 취미를!</div>

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