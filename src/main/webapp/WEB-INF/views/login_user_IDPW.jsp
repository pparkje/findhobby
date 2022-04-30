<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_user_IDPW_body">
	<div class="login_user_IDPW_center">
	
		<div class="login_user_IDPW_sub">ID / PW 찾기</div>
		
		<div class="login_user_IDPW_part">
		
			<div class="login_user_IDPW_ID_part">
				<a class="login_user_IDPW_ID_part_A" href="${pageContext.request.contextPath}/login_user_findID.do" >
				ID 찾기
				</a>
			</div>
			
			<div class="login_user_IDPW_PW_part">
				<a class="login_user_IDPW_PW_part_A" href="${pageContext.request.contextPath}/login_user_findPW_A.do" >
				PW 찾기
				</a>
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