<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="PW_A_body">
	<div class="PW_A_body_center">
	
		<div class="PW_B_sub">PW 찾기</div>
		<div class="PW_B_sub_sub">비밀번호 재설정</div>
		
		<div class="PW_A_cont_part">
			<form action="${pageContext.request.contextPath}/findPW_C_ok.do" method="post">
				
				<div class="PW_A_cont_part_idnameemail">
					<label>PW 재설정</label>
					<input type="text" placeholder="변경하실 PW를 입력해주세요"  name="m_pw_A" id="m_pw_A" />
				</div>
				<div class="PW_A_cont_part_idnameemail_Last">
					<label>PW 재설정 확인</label>
					<input type="text" placeholder="변경하실 PW를 한번더 입력해주세요" name="m_pw_B" id="m_pw_B" />
				</div>
				<div class="PW_A_cont_part_cancel">
					<a class="PW_A_cont_part_cancel_icon" href="${pageContext.request.contextPath}/main.do" >
						취소 
					</a>
				</div>
				<div class="PW_A_cont_part_submit">
					<button type="submit">비밀번호 재설정</button>
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