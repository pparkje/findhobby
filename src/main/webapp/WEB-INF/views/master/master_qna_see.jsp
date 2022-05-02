<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_user_see_body">
		
	<div class="master_user_see_sub">문의정보</div>
		
	<div class="master_qna_see_contA">
			
		<ul class="master_qna_see_cont_partA">
			<li>문의제목</li>
			<li>문의내용</li>
			<li>작성자</li>
			<li>답변상황</li>
   		</ul>
    		
   		<ul class="master_qna_see_cont_partB">
   			<li class="master_qna_see_cont_partB_cont_sub">
   				<div class="master_qna_see_cont_partB_cont_sub_center">
	   			${output_qna_detail.q_subject}
	   			</div>
   			</li>
   			<li class="master_qna_see_cont_partB_cont_cont">
   				<div class="master_qna_see_cont_partB_cont_cont_center">
	   			${output_qna_detail.q_cont}
	   			</div>
   			</li>
   			<li>${output_qna_detail.q_m_id}</li>
   			<li>${output_qna_detail.q_answer_ch}</li>
   		</ul>
    		
	</div>	
	
	<div class="master_qna_see_contB">
			
		<ul class="master_qna_see_contB_partA">
			<li>답변작성자</li>
			<li>답변내용</li>
			<li>문의시간</li>
   		</ul>
    		
   		<ul class="master_qna_see_contB_partB">
   			<li>${output_qna_detail.q_a_id}</li>
   			<li class="master_qna_see_contB_partB_cont_answer">
   				<div class="master_qna_see_contB_partB_cont_answer_center">
	   			${output_qna_detail.q_answer}
	   			</div>
   			</li>
   			<li>${output_qna_detail.q_updatedate}</li>
   		</ul>
    		
	</div>
	
	<div class="master_qna_see_update">
	
		<c:url value="/master/master_qna_update.do" var="master_qna_update_URL">
			<c:param name="id" value="${output_qna_detail.id}" />
		</c:url>
		
		<a href="${master_qna_update_URL}" >
   		문의수정하기
   		</a>
	</div>
		
	<div class="master_qna_see_delete">
	
		<c:url value="/master/master_qna_delete.do" var="master_qna_delete_URL">
			<c:param name="id" value="${output_qna_detail.id}" />
		</c:url>
		
		<a href="${master_qna_delete_URL}" >
    	문의 삭제 처리
    	</a>
	</div>
	
	<div class="master_qna_see_answer">
	
		<c:url value="/master/master_qna_answer.do" var="master_qna_answer_URL">
			<c:param name="id" value="${output_qna_detail.id}" />
		</c:url>
		
		<a href="${master_qna_answer_URL}" >
   		답변하기
   		</a>
	</div>
	
	<div class="master_qns_see_mainpage">
		<a href="${pageContext.request.contextPath}/master/master_qna_main.do" >
    	문의관리 페이지로 이동
    	</a>
	</div>
		
	
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>