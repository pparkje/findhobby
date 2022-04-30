<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test_B = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test_B);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_A_body">
	<div class="hobby_test_A_body_center">
	
		<div class="hobby_test_A_sub">test 2 / 4</div>
		
		<div class="hobby_test_A_sub_two">질문2</div>
		
		<div class="hobby_test_A_sub_three">오랫만에 여행을 와서 산책을 하는데 사과를 보았다 당신은 어떤 생각이 나는가?</div>
		
		<form method="post" action="${pageContext.request.contextPath}/hobby_test_C.do" name="form1">
		
			<input type="hidden" name="test_A" id="test_A" value="${output_test_result_A}">
			
			<div class="hobby_test_A_testpart">
				<div class="hobby_test_A_testpartA">
				
					<label for="test_B" class="hobby_test_A_testpart_label">
						<input type="radio" name="test_B" id="test_B" value="S" class="hobby_test_btn_C" onclick="test_btn_changeC();" />
						<span class="test_btn_C_span">둥글고 빨간 사과가 맛있어 보인다.</span>
						<input type="radio" name="test_B" id="test_B" value="N" class="hobby_test_btn_D" onclick="test_btn_changeD();" />
						<span class="test_btn_D_span">뉴턴 , 아이폰 , 스티브잡스 , 백설공주 가 생각이 난다.</span>
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

function test_btn_changeC() {
	var cl1 = document.querySelector('.test_btn_C_span');
	var cl2 = document.querySelector('.test_btn_D_span');
	
	cl1.style.color = "#fff";
	cl2.style.color = "#333";
}

function test_btn_changeD() {
	var cl1 = document.querySelector('.test_btn_C_span');
	var cl2 = document.querySelector('.test_btn_D_span');
	
	cl1.style.color = "#333";
	cl2.style.color = "#fff";
}
	
</script>
</body>

</html>