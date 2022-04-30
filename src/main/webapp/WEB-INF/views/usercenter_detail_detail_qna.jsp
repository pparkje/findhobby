<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_usercenter_detail_detail_qna = (members) session.getAttribute("key");
    session.setAttribute("key", key_usercenter_detail_detail_qna);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="usercenter_detail_detail_qna_body">
	<div class="usercenter_detail_detail_qna_body_center">
	
		<div class="usercenter_detail_detail_qna_sub">문의사항</div>
		
		<div class="usercenter_detail_detail_qna_cont">
		
			<div class="usercenter_detail_detail_qna_cont_admin">작성자 : ${output_qna_detail_detail.q_m_id}</div>
			<div class="usercenter_detail_detail_qna_cont_sub">문의사항 제목 : ${output_qna_detail_detail.q_subject}</div>
			<div class="usercenter_detail_detail_qna_cont_cont_sub">문의내용</div>
			
			<div class="usercenter_detail_detail_qna_cont_cont">
				<div class="usercenter_detail_detail_qna_cont_cont_cont">${output_qna_detail_detail.q_cont}</div>
			</div>
			
		</div>
		
		<c:set var="check" value="${output_qna_detail_detail.q_answer_ch}" />	
		
		<c:choose>	
		
			<c:when test="${check == 'N'}">
				<div class="usercenter_detail_detail_qna_answer_part">답변상황 : 답변 작성예정입니다.</div>
			</c:when>
		
			<c:otherwise>
				<div class="usercenter_detail_detail_qna_answer_part">답변상황 : 답변이 작성되었습니다.</div>
			</c:otherwise>
			
		</c:choose>
		
		<div class="usercenter_detail_detail_qna_answer_sub">답변내용</div>
		
		<div class="usercenter_detail_detail_qna_answer_part_cont">
				
				
				
				<c:choose>	
				
					<c:when test="${check == 'N'}">
						<div class="usercenter_detail_detail_qna_cont_cont_cont">답변이 작성되지 않은 문의입니다.</div>
					</c:when>
					
					<c:otherwise>
						<div class="usercenter_detail_detail_qna_cont_cont_cont">${output_qna_detail_detail.q_answer}</div>
					</c:otherwise>
							
				</c:choose>
			
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