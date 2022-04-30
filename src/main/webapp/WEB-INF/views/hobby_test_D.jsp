<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test_D = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test_D);
%>

<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_A_body">
	<div class="hobby_test_A_body_center">
	
		<div class="hobby_test_A_sub">test 4 / 4</div>
		
		<div class="hobby_test_A_sub_two">질문4</div>
		
		<div class="hobby_test_A_sub_three">해야 하는 일이 많다. 많아도 너무 많다. 그런데도 놀고 싶은 나는 ?</div>
		
		<form method="post" action="${pageContext.request.contextPath}/hobby_test_result.do" name="form1">
		
			<input type="hidden" name="test_A" id="test_A" value="${output_test_result_A}">
			<input type="hidden" name="test_B" id="test_B" value="${output_test_result_B}">
			<input type="hidden" name="test_C" id="test_C" value="${output_test_result_C}">
			
			<div class="hobby_test_A_testpart">
				<div class="hobby_test_A_testpartA">
				
					<label for="test_D" class="hobby_test_A_testpart_label">
						<input type="radio" name="test_D" id="test_D" value="J" class="hobby_test_btn_G" onclick="test_btn_changeG();" />
						<span class="test_btn_G_span">놀더라도 마음은 편하게 하고 <br>노는게 좋지 않을까 하며 일을 모두 끝마친다.</span>
						<input type="radio" name="test_D" id="test_D" value="P" class="hobby_test_btn_H" onclick="test_btn_changeH();" />
						<span class="test_btn_H_span">미래의 나는 지금보다 부지런하고 더 노력해서<br> 열심히 하겠지! 라며 일단 나가서 논다.</span>
					</label> 
					
				</div>
				
			</div>	
			
			<div class="hobby_test_A_testpart_button">
				<button type="submit">결과는?!</button>
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

function test_btn_changeG() {
	var cl1 = document.querySelector('.test_btn_G_span');
	var cl2 = document.querySelector('.test_btn_H_span');
	
	cl1.style.color = "#fff";
	cl2.style.color = "#333";
}

function test_btn_changeH() {
	var cl1 = document.querySelector('.test_btn_G_span');
	var cl2 = document.querySelector('.test_btn_H_span');
	
	cl1.style.color = "#333";
	cl2.style.color = "#fff";
}
	
</script>
</body>

</html>