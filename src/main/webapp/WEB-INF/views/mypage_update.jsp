<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>


<%
	request.setCharacterEncoding("UTF-8");
	members key_mypage_update = (members) session.getAttribute("key");
	session.setAttribute("key", key_mypage_update);
%>

<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_plus_body">
	<div class="login_plus_center">
	
		<div class="login_plus_sub">
		회원수정
		</div>
		
		<div class="login_plus_cont">
		
			<form action="${pageContext.request.contextPath}/mypage_update_ok.do" method="post">
			
				<input type="hidden" name="id" id="id" value="${output_mypage_update.id}">
			
				<div class="login_member_id">
					<label for="m_id">아이디</label>
					<input type="text" placeholder="아이디"  name="m_id" id="m_id" value="${output_mypage_update.m_id}"/>
				</div>
				
				<div class="login_member_email">
					<label for="m_email">이메일</label>
					<input type="email" placeholder="이메일 주소"  name="m_email" id="m_email" value="${output_mypage_update.m_email}"/>
				</div>
				
				<div class="login_member_nik">
					<label for="m_username">닉네임</label>
					<input type="text" placeholder="닉네임을 입력해주세요"  name="m_username" id="m_username" value="${output_mypage_update.m_username}"/>
				</div>
				
				<div class="login_member_name">
					<label for="m_name">이름</label>
					<input type="text" placeholder="이름을 입력해주세요"  name="m_name" id="m_name" value="${output_mypage_update.m_name}"/>
				</div>
				
				<div class="login_member_phone">
					<label for="m_phone">연락처</label>
					<input type="text" placeholder="연락처를 입력해주세요. ex)01011111111"  name="m_phone" id="m_phone" value="${output_mypage_update.m_phone}"/>
				</div>
				
				<div class="login_member_birthday">
					<label for="m_birthday">생년월일</label>
					<input type="date" name="m_birthday" id="m_birthday" value="${output_mypage_update.m_birthday}"/>
				</div>
				
				<c:set var="gender" value="${output_mypage_update.m_gender}" />
				
				<c:choose>
					<c:when test="${ gender == 'W' }">
				
					<div class="login_member_gender">
						<label for="gender">성별</label>
						<div class="login_member_gender_FM">
							<input type="radio" class="chk_gender" name="gender" value="W" checked="checked"/>&nbsp;여성
				    	 	<input type="radio" class="chk_gender" name="gender" value="M" />&nbsp;남성
						</div>
					</div>
				
					</c:when>
					
					<c:when test="${ gender == 'M' }">
				
					<div class="login_member_gender">
						<label for="gender">성별</label>
						<div class="login_member_gender_FM">
							<input type="radio" class="chk_gender" name="gender" value="W" />&nbsp;여성
				    	 	<input type="radio" class="chk_gender" name="gender" value="M" checked="checked"/>&nbsp;남성
						</div>
					</div>
					
					</c:when>
				
				</c:choose>
				
				<div class="login_member_pw">
					<label for="m_pwA">비밀번호</label>
					<input type="password" placeholder="비밀번호"  name="m_pw" id="m_pw" placeholder="수정을 위해 비밀번호를 입력해주세요."/>
				</div>
				
				<div class="login_member_submit_cancel">
					<a class="banner_icon" href="${pageContext.request.contextPath}/mypage.do" >
						취소 
					</a>
				</div>
				
				<div class="login_member_submit">
					<button type="submit">정보수정 하기</button>
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