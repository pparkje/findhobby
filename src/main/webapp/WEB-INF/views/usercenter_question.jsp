<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_usercenter_question = (members) session.getAttribute("key");
    session.setAttribute("key", key_usercenter_question);
%>

<!-- 이곳에 HTML 코딩 진행  -->
<div class="question_body">
	<div class="question_body_center">
	
		<div class="question_sub">1:1 문의</div>
		
		<div class="question_cont">
			<form action="${pageContext.request.contextPath}/usercenter_question_ok.do" method="post">
				
				<input type="hidden" name="q_m_id" id="q_m_id" value="${output_members_something.m_id}">
				<input type="hidden" name="q_m_num" id="q_m_num" value="${output_members_something.id}">
			
				<div class="question_cont_sub">문의제목</div>
				
				<div class="question_cont_subtext">
		        	<input type="text" name="q_subject" id="q_subject" placeholder="문의 제목을 입력하세요." class="question_cont_subtext_input" />
		        </div>
		        
		        <div class="question_cont_contsub">질문내용</div>
		        
				<div class="question_cont_conttext">
		        	<input type="text" name="q_cont" id="q_cont" placeholder="문의 내용을 입력하세요." class="question_cont_conttext_input"  />
		        </div>
		        
		        <div class="question_cont_btn">
	        		<button type="submit">작성완료</button>
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