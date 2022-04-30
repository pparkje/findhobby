<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	String pw_ok = (String) session.getAttribute("pw_ok");
    session.setAttribute("pw_ok", pw_ok);
    
    members key_PW_B = (members) session.getAttribute("key");
    session.setAttribute("key", key_PW_B);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="PW_A_body">
	<div class="PW_A_body_center">
	
		<div class="PW_B_sub">PW 찾기</div>
		<div class="PW_B_sub_sub">이메일로 전송된 인증번호 8자리를 입력해 주세요.</div>
		
		<div class="PW_A_cont_part">
			<form action="${pageContext.request.contextPath}/findPW_B_ok.do" method="post">
				<div class="PW_A_cont_part_idnameemail_Last">
					<label>인증번호</label>
					<input type="text" placeholder="인증번호를 입력해주세요"  name="pass_code" id="pass_code" />
				</div>
				<div class="PW_A_cont_part_cancel">
					<a class="PW_A_cont_part_cancel_icon" href="${pageContext.request.contextPath}/main.do" >
						취소 
					</a>
				</div>
				<div class="PW_A_cont_part_submit">
					<button type="submit">다음으로</button>
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