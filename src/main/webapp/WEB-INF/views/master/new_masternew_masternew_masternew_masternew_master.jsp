<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="body_body">
	<div class="body_center">
		
		<div>회원관리</div>
		
		<div>
			<a>
				추가하기
			</a>
		</div>
		
		<div>
			<ul>
				<li>구분</li>
				<li>ID</li>
				<li>이메일</li>
				<li>닉네임</li>
				<li>이름</li>
				<li>연락처</li>
				<li>성별</li>
				<li>생년월일</li>
				<li>
					수정하기버튼부분
				</li>
			</ul>
		</div>
		
		<!-- 나중에 리스트 처리해야함 -->
		<div>
			<ul>
				<li>구분</li>
				<li>ID</li>
				<li>이메일</li>
				<li>닉네임</li>
				<li>이름</li>
				<li>연락처</li>
				<li>성별</li>
				<li>생년월일</li>
				<li>
					<a>
						수정하기버튼부분
					</a>
				</li>
			</ul>
		</div>
		
		<div>페이지번호 부분</div>
		
	</div>
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>