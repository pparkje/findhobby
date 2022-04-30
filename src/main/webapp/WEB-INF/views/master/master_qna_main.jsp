<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_main_body">
		
		<div class="master_main_sub">문의관리</div>
		
		<form method="get" action="${pageContext.request.contextPath}/master/master_qna_main.do" class="members_find_search_part">
			<label for="keyword">검색어 : </label> 
			<input type="search" name="keyword" id="keyword" placeholder="문의정보검색" value="${keyword}" />
			<button type="submit">검색</button>
		</form>
		
		<div class="master_qna_main_cont">
			<div class="master_qna_main_cont_subpart">
				<li>구분</li>
				<li>문의제목</li>
				<li>문의내용</li>
				<li>작성자</li>
				<li>답변상황</li>
				<li>답변내용</li>
				<li>답변작성자</li>
				<li>문의시간</li>
				<li>수정</li>
				<li>답변</li>
			</ul>
		</div>
		
		<!-- 나중에 리스트 처리해야함 -->
		<div class="master_qna_main_cont_part">
			<ul class="master_qna_main_cont_part_cont">
				
				<c:forEach var="master_qna" items="${output_qna_main}" varStatus="status">
				
					<c:set var="q_subject" value="${master_qna.q_subject}" />
					<c:set var="q_cont" value="${master_qna.q_cont}" />
					<c:set var="q_m_id" value="${master_qna.q_m_id}" />
					<c:set var="q_answer" value="${master_qna.q_answer}" />
					<c:set var="q_a_id" value="${master_qna.q_a_id}" />
					
					<c:if test="${keyword != ''}">
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<c:set var="q_subject" value="${fn:replace(q_subject, keyword, mark)}" />
						<c:set var="q_cont" value="${fn:replace(q_cont, keyword, mark)}" />
						<c:set var="q_m_id" value="${fn:replace(q_m_id, keyword, mark)}" />
						<c:set var="q_answer" value="${fn:replace(q_answer, keyword, mark)}" />
						<c:set var="q_a_id" value="${fn:replace(q_a_id, keyword, mark)}" />
					</c:if>
					
					<c:url value="/master/master_qna_see.do" var="master_qna_detail_URL">
						<c:param name="id" value="${master_qna.id}" />
					</c:url>
				
					<li class="master_qna_main_cont_part_cont_first">${master_qna.id}</li>
					
					<a class="master_qna_main_cont_part_cont_detail_part" href="${master_qna_detail_URL}" >
						<li>${q_subject}</li>
						<li>${q_cont}</li>
						<li>${q_m_id}</li>
						<li>${master_qna.q_answer_ch}</li>
						<li>${q_answer}</li>
						<li>${q_a_id}</li>
						<li>${master_qna.q_updatedate}</li>
					</a>
					
					<c:url value="/master/master_qna_update.do" var="master_qna_update_URL">
						<c:param name="id" value="${master_qna.id}" />
					</c:url>
					
					<li class="master_qna_main_cont_part_cont_last_update">
						<a href="${master_qna_update_URL}" >
							수정
						</a>
					</li>
					
					<c:url value="/master/master_notice_answer.do" var="master_qna_answer_URL">
						<c:param name="id" value="${master_qna.id}" />
					</c:url>
					
					<li class="master_qna_main_cont_part_cont_last_answer">
						<a href="${master_qna_answer_URL}" >
							답변
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
		</div>
		
		<div class="master_members_number_page">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/master/master_qna_main.do" var="prevPageUrl">
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
					<c:url value="/master/master_qna_main.do" var="pageUrl">
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
						<c:url value="/master/master_qna_main.do" var="nextPageUrl">
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
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>