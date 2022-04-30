<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="noticecompany_body">
	<div class="noticecompany_body_center">
	
		<div>1:1 문의 수정</div>
		
		
		<div>
			<form action="${sujung}" method="post">
				<div>제목</div>
				<div class="sujung_name_AA">
		        	<input type="text" name="m_name" placeholder="문의 제목을 입력하세요."  value="${output.m_name}"/>
		        </div>
		        <div>질문내용</div>
				<div class="sujung_name_AA">
		        	<input type="text" name="m_name" placeholder="문의 내용을 입력하세요."  value="${output.m_name}"/>
		        </div>
		        <div class="sujung_clearA">
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