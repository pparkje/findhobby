<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_hobby_test_result = (members) session.getAttribute("key");
    session.setAttribute("key", key_hobby_test_result);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="hobby_test_result_body">
	<div class="hobby_test_result_body_center">
	
		<div class="hobby_test_result_sub">테스트 결과!</div>
		
		<div class="hobby_test_result_sub_one">${testResultMBTI} 성향입니다!</div>
		
		<div class="hobby_test_result_sub_two">${testResultMBTI} 성향은 ${testResultMBTI_cont} 입니다.</div>
		
		<div class="hobby_test_result_sub_one">${testResultMBTI} 취미 추천은!</div>
		
		<div class="hobby_test_result_sub_two">${testResultMBTI_hobby} 취미를 추천합니다.</div>
		
		<div class="hobby_test_result_cont">
			<ul class="hobby_test_result_cont_part">
			
				<c:url value="/hobby_detail.do" var="hobby_detail_URL_A">
					<c:param name="id" value="${output_test_A.id}" />
				</c:url>
				<c:url value="/hobby_detail.do" var="hobby_detail_URL_B">
					<c:param name="id" value="${output_test_B.id}" />
				</c:url>
			
				<li class="hobby_test_result_cont_part_A">
					<a class="hobby_test_result_cont_part_A_tag" href="${hobby_detail_URL_A}" >
						<img class="hobby_test_result_cont_part_A_img" src="${pageContext.request.contextPath}/views/img/${output_test_A.h_image_a}" />
						<div class="hobby_test_result_cont_part_A_sub">${output_test_A.h_name}</div>
					</a>
				</li>
				
				<li class="hobby_test_result_cont_part_B">
					<a class="hobby_test_result_cont_part_B_tag" href="${hobby_detail_URL_B}" >
						<img class="hobby_test_result_cont_part_A_img" src="${pageContext.request.contextPath}/views/img/${output_test_B.h_image_a}" />
						<div class="hobby_test_result_cont_part_A_sub">${output_test_B.h_name}</div>
					</a>
				</li>
				
			</ul>
		</div>
		
		<div class="hobby_test_result_sub_explan">취미를 클릭하면 상세 페이지로 이동합니다</div>
		
		
		<div class="hobby_test_result_allhobby">
			<a class="hobby_test_result_allhobby_atag" href="${pageContext.request.contextPath}/allhobby.do" >
			모든 취미 보러가기
			</a>
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