<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_main_body">
		
		<div class="master_main_sub">회원관리</div>
		
		<div class="master_main_add_memebers">
			<a class="banner_icon" href="${pageContext.request.contextPath}/master/master_user_plus.do" >
				회원추가
			</a>
		</div>
		
		<form method="get" action="${pageContext.request.contextPath}/master/master_members.do" class="members_find_search_part">
			<label for="keyword">검색어 : </label> 
			<input type="search" name="keyword" id="keyword" placeholder="회원정보검색" value="${keyword}" />
			<button type="submit">검색</button>
		</form>
		
		<div class="master_main_cont">
			<div class="master_main_cont_subpart">
				<li>구분</li>
				<li>ID</li>
				<li>이메일</li>
				<li>닉네임</li>
				<li>이름</li>
				<li>연락처</li>
				<li>성별</li>
				<li>생년월일</li>
				<li>탈퇴여부</li>
				<li>수정</li>
			</ul>
		</div>
		
		<!-- 나중에 리스트 처리해야함 -->
		<div class="master_main_cont_part">
			<ul class="master_main_cont_part_cont">
				
				<c:forEach var="master_members" items="${output_master_members}" varStatus="status">
				
					<c:set var="m_id" value="${master_members.m_id}" />
					<c:set var="m_name" value="${master_members.m_name}" />
					<c:set var="m_username" value="${master_members.m_username}" />
					<c:set var="m_email" value="${master_members.m_email}" />
					<c:set var="m_phone" value="${master_members.m_phone}" />
					
					<c:if test="${keyword != ''}">
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<c:set var="m_id" value="${fn:replace(m_id, keyword, mark)}" />
						<c:set var="m_name" value="${fn:replace(m_name, keyword, mark)}" />
						<c:set var="m_username" value="${fn:replace(m_username, keyword, mark)}" />
						<c:set var="m_email" value="${fn:replace(m_email, keyword, mark)}" />
						<c:set var="m_phone" value="${fn:replace(m_phone, keyword, mark)}" />
					</c:if>
					
					<c:url value="/master/master_user_see.do" var="master_members_detail_URL">
						<c:param name="id" value="${master_members.id}" />
					</c:url>
				
					<li class="master_main_cont_part_cont_first">${master_members.id}</li>
					
					<a class="master_main_cont_part_cont_detail_part" href="${master_members_detail_URL}" >
						<li>${m_id}</li>
						<li>${m_email}</li>
						<li>${m_username}</li>
						<li>${m_name}</li>
						<li>${m_phone}</li>
						<li>${master_members.m_gender}</li>
						<li>${master_members.m_birthday}</li>
						<li>${master_members.m_end}</li>
					</a>
					
					<c:url value="/master/master_user_update.do" var="master_members_update_URL">
						<c:param name="id" value="${master_members.id}" />
					</c:url>
					
					<li class="master_main_cont_part_cont_last">
						<a href="${master_members_update_URL}" >
							수정
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
		</div>
		
		<div class="master_members_number_page">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/master/master_members.do" var="prevPageUrl">
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
					<c:url value="/master/master_members.do" var="pageUrl">
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
						<c:url value="/master/master_members.do" var="nextPageUrl">
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