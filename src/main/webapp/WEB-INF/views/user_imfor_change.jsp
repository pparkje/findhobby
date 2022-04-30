<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="noticecompany_body">
	<div class="noticecompany_body_center">
	
		<!-- 나중에 정보 미리 들어와 있어야함  -->
		<div>개인정보수정</div>
		
		<div>
			<form action="${pageContext.request.contextPath}/pjh/members/members_add_ok.do" method="post">
				<div class="id_members_login">
					<label for="m_id">아이디</label>
					<input type="text" placeholder="아이디"  name="m_id" id="m_id" />
				</div>
				<div class="id_members_login">
					<label for="m_pwA">비밀번호</label>
					<input type="password" placeholder="비밀번호"  name="m_pwA" id="m_pwA" />
				</div>
				<div class="id_members_login">	
					<label for="m_pwB">비밀번호 확인</label>
					<input type="password" placeholder="비밀번호 확인"   name="m_pwB" id="m_pwB" />
				</div>
				<div class="id_members_login">
					<label for="m_email">이메일</label>
					<input type="email" placeholder="이메일 주소"  name="m_email" id="m_email" />
				</div>
				<div class="id_members_login">
					<label for="m_username">닉네임</label>
					<input type="text" placeholder="닉네임을 입력해주세요"  name="m_username" id="m_username" />
				</div>
				<div class="id_members_login">
					<label for="m_name">이름</label>
					<input type="text" placeholder="이름을 입력해주세요"  name="m_name" id="m_name" />
				</div>
				<div class="id_members_login">
					<label for="m_phone">연락처</label>
					<input type="text" placeholder="연락처를 입력해주세요."  name="m_phone" id="m_phone" />
				</div>
				<div class="id_members_m_birthday">
					<label for="m_birthday">생년월일</label>
					<input type="date" name="m_birthday" id="m_birthday" />
				</div>
				<div class="id_members_gender">
					<label for="gender">성별</label>
					<input type="radio" class="chk_gender" name="gender" value="F" />&nbsp;여성
		    	 	<input type="radio" class="chk_gender" name="gender" value="M" />&nbsp;남성
				</div>
				<div class="id_members_login_submit">
					<a class="banner_icon" href="${pageContext.request.contextPath}/main.do" >
						취소 
					</a>
				</div>
				<div class="id_members_login_submit">
					<button type="submit">수정완료</button>
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