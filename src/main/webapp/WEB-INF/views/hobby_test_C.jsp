<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test_C = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test_C);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_A_body">
	<div class="hobby_test_A_body_center">
	
		<div class="hobby_test_A_sub">test 3 / 4</div>
		
		<div class="hobby_test_A_sub_two">질문3</div>
		
		<div class="hobby_test_A_sub_three">친구가 시험도 떨어지고 집에 오는길에 차 사고 까지 난 상황이다. 당신의 선택은?</div>
		
		<form method="post" action="${pageContext.request.contextPath}/hobby_test_D.do" name="form1">
		
			<input type="hidden" name="test_A" id="test_A" value="${output_test_result_A}">
			<input type="hidden" name="test_B" id="test_B" value="${output_test_result_B}">
			
			<div class="hobby_test_A_testpart">
				<div class="hobby_test_A_testpartA">
				
					<label for="test_C" class="hobby_test_A_testpart_label">
						<input type="radio" name="test_C" id="test_C" value="F" class="hobby_test_btn_E" onclick="test_btn_changeE();" />
						<span class="test_btn_E_span">많이 속상하겠다. 다치진 않았어? 괜찮은거야? </span>
						<input type="radio" name="test_C" id="test_C" value="T" class="hobby_test_btn_F" onclick="test_btn_changeF();" />
						<span class="test_btn_F_span">보험은 들었어? 무슨시험이였는데? <br>시험은 몇점이였는데? 비싼차는 아니였지?</span>
					</label> 
					
				</div>
				
			</div>	
			
			<div class="hobby_test_A_testpart_button">
				<button type="submit">다음으로!</button>
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

function test_btn_changeE() {
	var cl1 = document.querySelector('.test_btn_E_span');
	var cl2 = document.querySelector('.test_btn_F_span');
	
	cl1.style.color = "#fff";
	cl2.style.color = "#333";
}

function test_btn_changeF() {
	var cl1 = document.querySelector('.test_btn_E_span');
	var cl2 = document.querySelector('.test_btn_F_span');
	
	cl1.style.color = "#333";
	cl2.style.color = "#fff";
}
	
</script>
</body>

</html>