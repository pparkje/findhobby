<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_body">
	<div class="hobby_test_center">
	
		<div class="hobby_test_sub">
			취미 테스트 !
		</div>
		
		<div class="hobby_test_sub_two">
			지금부터 총 4가지의 선택을 진행 보도록 하죠!
		</div>
		
		<div class="hobby_test_nextprev_part">
		
			<div class="hobby_test_next_sub">
				<a class="banner_icon" href="${pageContext.request.contextPath}/hobby_test_A.do" >
					다음으로!
				</a>
			</div>
			
			<div class="hobby_test_prev_sub">
				<a class="banner_icon" href="${pageContext.request.contextPath}/main.do" >
					다음에 할게욧!
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