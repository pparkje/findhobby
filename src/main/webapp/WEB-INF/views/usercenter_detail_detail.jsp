<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_usercenter_detail_detail = (members) session.getAttribute("key");
    session.setAttribute("key", key_usercenter_detail_detail);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="usercenter_detail_detail_body">
	<div class="usercenter_detail_detail_body_center">
	
		<div class="usercenter_detail_detail_sub">공지사항</div>
		
		<div class="usercenter_detail_detail_cont">
			<div class="usercenter_detail_detail_cont_admin">작성자 : ${output_notice_detail_detail.n_admin}</div>
			<div class="usercenter_detail_detail_cont_admin">작성날짜 : ${output_notice_detail_detail.n_updatedate}</div>
			<div class="usercenter_detail_detail_cont_sub">공지사항 제목 : ${output_notice_detail_detail.n_subject}</div>
			<div class="usercenter_detail_detail_cont_cont">
				<div class="usercenter_detail_detail_cont_cont_cont">${output_notice_detail_detail.n_cont}</div>
			</div>
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