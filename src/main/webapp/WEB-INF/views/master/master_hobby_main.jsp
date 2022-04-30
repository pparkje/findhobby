<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_main_body">
		
		<div class="master_main_sub">취미관리</div>
		
		<div class="master_main_add_memebers">
			<a class="banner_icon" href="${pageContext.request.contextPath}/master/master_hobby_plus.do" >
				취미추가
			</a>
		</div>
		
		<form method="get" action="${pageContext.request.contextPath}/master/master_hobby_main.do" class="members_find_search_part">
			<label for="keyword">검색어 : </label> 
			<input type="search" name="keyword" id="keyword" placeholder="취미정보검색" value="${keyword}" />
			<button type="submit">검색</button>
		</form>
		
		<div class="master_hobby_main_cont">
			<div class="master_hobby_main_cont_subpart">
				<li>구분</li>
				<li>취미제목</li>
				<li>취미사진</li>
				<li>취미내용</li>
				<li>관련사진</li>
				<li>분류</li>
				<li>조회수</li>
				<li>수정</li>
			</ul>
		</div>
		
		<!-- 나중에 리스트 처리해야함 -->
		<div class="master_hobby_main_cont_part">
			<ul class="master_hobby_main_cont_part_cont">
				
				<c:forEach var="master_hobbys" items="${output_hobby_main}" varStatus="status">
				
					<c:set var="h_name" value="${master_hobbys.h_name}" />
					<c:set var="h_option" value="${master_hobbys.h_option}" />
					<c:set var="h_cont" value="${master_hobbys.h_cont}" />
					
					<c:if test="${keyword != ''}">
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<c:set var="h_name" value="${fn:replace(h_name, keyword, mark)}" />
						<c:set var="h_option" value="${fn:replace(h_option, keyword, mark)}" />
						<c:set var="h_cont" value="${fn:replace(h_cont, keyword, mark)}" />
					</c:if>
					
					<c:url value="/master/master_hobby_see.do" var="master_hobbys_detail_URL">
						<c:param name="id" value="${master_hobbys.id}" />
					</c:url>
				
					<li class="master_hobby_main_cont_part_cont_first">${master_hobbys.id}</li>
					
					<a class="master_hobby_main_cont_part_cont_detail_part" href="${master_hobbys_detail_URL}" >
						<li>${h_name}</li>
						<li>${master_hobbys.h_image_a}</li>
						<li>${h_cont}</li>
						<li>${master_hobbys.h_image_b}</li>
						<li>${h_option}</li>
						<li>${master_hobbys.h_count}</li>
					</a>
					
					<c:url value="/master/master_hobby_update.do" var="master_hobby_update_URL">
						<c:param name="id" value="${master_hobbys.id}" />
					</c:url>
					
					<li class="master_hobby_main_cont_part_cont_last">
						<a href="${master_hobby_update_URL}" >
							수정
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
		</div>
		
		<div class="master_members_number_page">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/master/master_hobby_main.do" var="prevPageUrl">
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
					<c:url value="/master/master_hobby_main.do" var="pageUrl">
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
						<c:url value="/master/master_hobby_main.do" var="nextPageUrl">
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