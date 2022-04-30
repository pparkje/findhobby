<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="noticecompany_body">
	<div class="noticecompany_body_center">
	
		<div>공지사항</div>
		
		<!-- 나중에 검색어 기능 , 페이지 번호 까지 구현해야함  -->
		<div>
			<ul>
			
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				<li>
					<div>문의 제목</div>
					<div>문의 내용</div>
				</li>
				
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