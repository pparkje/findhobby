<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_hobby_plus_body">
		
		<div class="master_hobby_plus_sub">공지답변</div>
		
		<div class="master_qna_plus_cont">
			<form action="${pageContext.request.contextPath}/master/master_qna_answer_ok.do" method="post" >
			
				<input type="hidden" name="id" id="id" value="${output_qna_update.id}">
				<input type="hidden" name="q_m_num" id="q_m_num" value="${output_qna_update.q_m_num}">
				
				<div class="master_qna_plus_cont_partA">
			
					<div class="master_qna_plus_cont_sub">
						<label for="q_subject">문의제목</label>
						<textarea class="master_qna_plus_cont_sub_textarea" id="q_subject" name="q_subject" readonly>${output_qna_update.q_subject}</textarea>
					</div>
					
					<div class="master_qna_plus_cont_cont">
						<label for="q_cont">문의내용</label>
						<textarea class="master_qna_plus_cont_cont_textarea" id="q_cont" name="q_cont" readonly>${output_qna_update.q_cont}</textarea>
					</div>
				
					<div class="master_qna_plus_cont_mid">
						<label for="q_m_id">작성자</label>
						<input type="text" value="${output_qna_update.q_m_id}" name="q_m_id" id="q_m_id" readonly/>
					</div>
					
					<div class="master_qna_plus_cont_answer_check">
						<label for="q_answer_ch">답변상황</label>
						<input type="text" value="${output_qna_update.q_answer_ch}" name="q_answer_ch" id="q_answer_ch" readonly/>
					</div>
				
				</div>
				
				<div class="master_qna_plus_cont_partB">
				
					<div class="master_qna_plus_cont_answer_cont">
						<label for="q_answer">답변내용</label>
						<textarea class="master_qna_plus_cont_answer_cont_textarea" id="q_answer" name="q_answer">${output_qna_update.q_answer}</textarea>
					</div>
					
					<div class="master_qna_plus_cont_answer_aid">
						<label for="q_a_id">답변작성자</label>
						<input type="text" value="운영자 AhAh" name="q_a_id" id="q_a_id" />
					</div>
					
					<div class="master_qna_plus_cont_cancel">
						<a class="master_qna_plus_cont_cancel_atag" href="${pageContext.request.contextPath}/master/master_qna_main.do" >
							취소 
						</a>
					</div>
					
					<div class="master_qna_plus_cont_submit">
						<button type="submit">답변작성하기</button>
					</div>
					
				</div>
				
			</form>
		</div>
		
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">



</script>
</body>

</html>