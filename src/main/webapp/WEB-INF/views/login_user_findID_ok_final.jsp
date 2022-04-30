<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_user_findID_ok_final_body">
	<div class="login_user_findID_ok_final_center">
	
		<div class="login_user_findID_ok_final_sub">ID 찾기</div>
		
		<div class="login_user_findID_ok_final_name_part">이름 : ${output_findID.m_name}</div>
		
		<div class="login_user_findID_ok_final_email_part">이메일 : ${output_findID.m_email}</div>
		
		<div class="login_user_findID_ok_final_end_part">${output_findID.m_name} 님 ID는 '${output_findID.m_id}' 입니다.</div>
		
		<div class="login_user_findID_ok_final_button_part">
			<a class="login_user_findID_ok_final_login_button" href="${pageContext.request.contextPath}/login.do">
				로그인 페이지로
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