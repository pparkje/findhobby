<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_main = (members) session.getAttribute("key");
    session.setAttribute("key", key_main);
%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="usercenter_body">
	<div class="usercenter_body_center">
	
		<div class="usercenter_sub">고객센터</div>
		<div class="usercenter_pastel_background"></div>
		
		<div class="usercenter_sub_notice">
			<a class="usercenter_sub_notice_tag" href="${pageContext.request.contextPath}/usercenter_detail.do" >
			공지사항
			</a>
		</div>
		
		<div class="usercenter_sub_notice_part">
			<ul class="usercenter_sub_notice_part_ulpart">
			
				<c:forEach var="i" begin="1" end="6" step="1" varStatus="status">
				
					<c:url value="/usercenter_detail_detail.do" var="notice_detail_detail_URL">
						<c:param name="id" value="${output_A[status.index-1].id}" />
					</c:url>
				
					<li class="usercenter_sub_notice_part_list">
						<a class="usercenter_tag" href="${notice_detail_detail_URL}" >
							<div class="usercenter_sub_notice_part_list_sub">${output_A[status.index-1].n_subject}</div>
							<div class="usercenter_sub_notice_part_list_cont">${output_A[status.index-1].n_cont}</div>
							<div class="usercenter_sub_notice_part_list_time">${output_A[status.index-1].n_updatedate}</div>
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
		</div>
		
		<div class="usercenter_sub_usercenter_part_sub">
			<a class="usercenter_sub_notice_tag" href="${pageContext.request.contextPath}/usercenter_detail_qna.do" >
			고객문의
			</a>
		</div>
		
		<div class="usercenter_sub_usercenter_part">
			<ul class="usercenter_sub_usercenter_part_ulpart">
			
				
				<c:forEach var="i" begin="1" end="6" step="1" varStatus="status">
				
					<c:url value="/usercenter_detail_detail_qna.do" var="usercenter_detail_detail_qna_URL">
						<c:param name="id" value="${output_B[status.index-1].id}" />
					</c:url>
				
					<li class="usercenter_sub_usercenter_part_list">
						<a class="usercenter_tag" href="${usercenter_detail_detail_qna_URL}" >
							<div class="usercenter_sub_usercenter_part_list_sub">${output_B[status.index-1].q_subject}</div>
							<div class="usercenter_sub_usercenter_part_list_cont">${output_B[status.index-1].q_cont}</div>
							<div class="usercenter_sub_usercenter_part_list_mid">${output_B[status.index-1].q_m_id}</div>
						</a>
					</li>
				
				</c:forEach>
				
			</ul>
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