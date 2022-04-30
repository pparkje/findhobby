<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_usercenter_detail_qna = (members) session.getAttribute("key");
    session.setAttribute("key", key_usercenter_detail_qna);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="usercenter_detail_body">
	<div class="usercenter_detail_body_center">
	
		<div class="usercenter_detail_sub">문의사항</div>
		
		<!-- 나중에 검색어 기능 , 페이지 번호 까지 구현해야함  -->
		<form method="get" action="${pageContext.request.contextPath}/usercenter_detail_qna.do" class="usercenter_detail_form_part">
			<label for="keyword">검색어 : </label> 
			<input type="search" name="keyword" id="keyword" placeholder="문의사항 검색" value="${keyword}" />
			<button type="submit">검색</button>
		</form>
		
		<div class="usercenter_detail_cont">
		
			<div class="usercenter_detail_cont_part">
				<div class="usercenter_detail_cont_part_number">문의번호</div>
				<div class="usercenter_detail_cont_part_sub">문의제목</div>
				<div class="usercenter_detail_cont_part_cont">문의내용</div>
				<div class="usercenter_detail_cont_part_date">답변현황</div>
			</div>
			
			<ul class="usercenter_sub_notice_part_ulpart">
			
				<c:forEach var="qna_detail" items="${output_qna}" varStatus="status">
					
					<c:set var="q_cont" value="${qna_detail.q_cont}" />
					
					<c:if test="${keyword != ''}">
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<c:set var="q_cont" value="${fn:replace(q_cont, keyword, mark)}" />
					</c:if>
						
					<c:url value="/usercenter_detail_detail_qna.do" var="qna_detail_detail_URL">
						<c:param name="id" value="${qna_detail.id}" />
					</c:url>
				
					<li class="usercenter_detail_cont_list">
						<a class="usercenter_tag" href="${qna_detail_detail_URL}" >
							<div class="usercenter_detail_cont_list_number">${qna_detail.id}</div>
							<div class="usercenter_detail_cont_list_sub">${qna_detail.q_subject}</div>
							<div class="usercenter_detail_cont_list_cont">${q_cont}</div>
							<div class="usercenter_detail_cont_list_date">${qna_detail.q_answer_ch}</div>
						</a>
					</li>
				
				</c:forEach>
				
				
			</ul>
			
			<div class="usercenter_detail_number_page">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/usercenter_detail_qna.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${prevPageUrl}">[이전]</a>
					</c:when>
					<c:otherwise>
						[이전]
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
					<c:url value="/usercenter_detail_qna.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					
					<c:choose>
						<c:when test="${pageData.nowPage == i }">
							<strong>[${i}]</strong>
						</c:when>
						
						<c:otherwise>
							<a href="${pageUrl}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageData.nextPage > 0}">
						<c:url value="/usercenter_detail_qna.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${nextPageUrl}">[다음]</a>
					</c:when>
					<c:otherwise>
						[다음]
					</c:otherwise>
				</c:choose>
            </div>
			
		</div>
		
			<!-- 세션 처리 필요 -->
		
			<div class="usercenter_detail_qna_question">
				<a href="${pageContext.request.contextPath}/qna_login.do" class="usercenter_detail_qna_question_btn">1:1 문의 하러 가기</a>
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