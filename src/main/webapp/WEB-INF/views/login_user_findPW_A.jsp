<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="PW_A_body">
	<div class="PW_A_body_center">
	
		<div class="PW_A_sub">PW 찾기</div>
		
		<div class="PW_A_cont_part">
			<form action="${pageContext.request.contextPath}/findPW_A_ok.do" method="post">
			
				<div class="PW_A_cont_part_idnameemail">
					<label>아이디</label>
					<input type="text" placeholder="아이디를 입력해 주세요"  name="m_id" id="m_id" />
				</div>
				
				<div class="PW_A_cont_part_idnameemail">
					<label>이름</label>
					<input type="text" placeholder="이름을 입력해 주세요"  name="m_name" id="m_name" />
				</div>
				
				<div class="PW_A_cont_part_idnameemail_Last">
					<label>이메일</label>
					<input type="text" placeholder="이메일을 입력해 주세요"  name="m_email" id="m_email" />
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