<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_user_findID_body">
	<div class="login_user_findID_center">
	
		<div class="login_user_findID_sub">ID 찾기</div>
		
		<div class="login_user_findID_cont">
		
			<form action="${pageContext.request.contextPath}/login_user_findID_ok.do" method="post">
			
				<div class="login_user_findID_name_part">
					<label>이름</label>
					<input type="text" placeholder="이름"  name="m_name" id="m_name" />
				</div>
				
				<div class="login_user_findID_email_part">
					<label>이메일</label>
					<input type="text" placeholder="이메일"  name="m_email" id="m_email" />
				</div>
				
				<div class="login_user_findID_cancel_part">
					<a class="banner_icon" href="${pageContext.request.contextPath}/login.do" >
						취소 
					</a>
				</div>
				
				<div class="login_user_findID_submit_part">
					<button type="submit">ID 찾기</button>
				</div>
				
			</form>
			
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