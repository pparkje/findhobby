<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="noticecompany_body">
	<div class="noticecompany_body_center">
	
		<form action="${pageContext.request.contextPath}/upload_ok.do" enctype="multipart/form-data" method="POST">
		
			<div>
				<label for="subject">제목</label>
				<input type="text" name="subject" id="subject" /> 
			</div>
			
			<div>
				<label for="photo">사진</label>
				<input type="file" name="photo" id="photo" />
			</div>
			
			<button type="submit">업로드</button>
		
		</form>
		
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