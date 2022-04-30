<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test_A = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test_A);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_A_body">
	<div class="hobby_test_A_body_center">
	
		<div class="hobby_test_A_sub">test 1 / 4</div>
		
		<div class="hobby_test_A_sub_two">질문1</div>
		
		<div class="hobby_test_A_sub_three">갑자기 과일이 먹고 싶어진 나는 어떤 행동에 더 가깝지?</div>
		
		<form method="post" action="${pageContext.request.contextPath}/hobby_test_B.do" name="form1">
			
			<div class="hobby_test_A_testpart">
				<div class="hobby_test_A_testpartA">
				
					<label for="test_A" class="hobby_test_A_testpart_label">
						<input type="radio" name="test_A" id="test_A" value="E" class="hobby_test_btn_A" onclick="test_btn_changeA();" />
						<span class="test_btn_A_span">바람도 쐴 겸 직접 과일을 사러 나간다.</span>
						<input type="radio" name="test_A" id="test_A" value="I" class="hobby_test_btn_B" onclick="test_btn_changeB();" />
						<span class="test_btn_B_span">나가기 귀찮다. 배달 , 인터넷 주문을 한다.</span>
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


function test_btn_changeA() {
	var cl1 = document.querySelector('.test_btn_A_span');
	var cl2 = document.querySelector('.test_btn_B_span');
	
	cl1.style.color = "#fff";
	cl2.style.color = "#333";
}

function test_btn_changeB() {
	var cl1 = document.querySelector('.test_btn_A_span');
	var cl2 = document.querySelector('.test_btn_B_span');
	
	cl1.style.color = "#333";
	cl2.style.color = "#fff";
}

	
</script>
</body>

</html>