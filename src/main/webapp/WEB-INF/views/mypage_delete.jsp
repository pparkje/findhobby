<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>


<%
	request.setCharacterEncoding("UTF-8");
	members key_mypage_delete = (members) session.getAttribute("key");
	session.setAttribute("key", key_mypage_delete);
%>



<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_body">
	<div class="login_body_center">
	
		<form method="post" action="${pageContext.request.contextPath}/mypage_delete_ok.do">
			
			<input type="hidden" name="id" id="id" value="${output_mypage_delete_page.id}">
			
			<div class="login_title">탈퇴를 위한 비밀번호 확인</div>
			
			<div class="login_id">
				<label for="m_pwA">비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="m_pwA" id="m_pwA"  />
			</div>
			
			<div class="login_password_A">
				<label for="m_pwB">비밀번호 확인</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="m_pwB" id="m_pwB"  />
			</div>
			
			<div class="login_submit">
				<button type="submit">회원탈퇴</button>
			</div>
			
		</form>
		
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