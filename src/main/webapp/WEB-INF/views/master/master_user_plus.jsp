<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>

<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_user_plus_body">
	
		<div class="master_main_sub">
		회원추가
		</div>
		
		<div class="master_user_plus_cont">
		
			<form action="${pageContext.request.contextPath}/master/master_user_plus_ok.do" method="post">
			
				<div class="master_member_id">
					<label for="m_id">아이디</label>
					<input type="text" placeholder="아이디"  name="m_id" id="m_id" />
				</div>
				
				<div class="master_member_pw">
					<label for="m_pwA">비밀번호</label>
					<input type="password" placeholder="비밀번호"  name="m_pwA" id="m_pwA" />
				</div>
				
				<div class="master_member_pw_plus">	
					<label for="m_pwB">비밀번호 확인</label>
					<input type="password" placeholder="비밀번호 확인"  name="m_pwB" id="m_pwB" />
				</div>
				
				<div class="master_member_email">
					<label for="m_email">이메일</label>
					<input type="email" placeholder="이메일 주소"  name="m_email" id="m_email" />
				</div>
				
				<div class="master_member_nik">
					<label for="m_username">닉네임</label>
					<input type="text" placeholder="닉네임을 입력해주세요"  name="m_username" id="m_username" />
				</div>
				
				<div class="master_member_name">
					<label for="m_name">이름</label>
					<input type="text" placeholder="이름을 입력해주세요"  name="m_name" id="m_name" />
				</div>
				
				<div class="master_member_phone">
					<label for="m_phone">연락처</label>
					<input type="text" placeholder="연락처를 입력해주세요. ex)01011111111"  name="m_phone" id="m_phone" />
				</div>
				
				<div class="master_member_birthday">
					<label for="m_birthday">생년월일</label>
					<input type="date" name="m_birthday" id="m_birthday" />
				</div>
				
				<div class="master_member_gender">
					<label for="gender">성별</label>
					<div class="master_member_gender_FM">
						<input type="radio" class="chk_gender" name="gender" value="W" checked="checked"/>&nbsp;여성
			    	 	<input type="radio" class="chk_gender" name="gender" value="M" />&nbsp;남성
					</div>
				</div>
				
				<div class="master_member_submit_cancel">
					<a class="master_member_submit_cancel_atag" href="${pageContext.request.contextPath}/master/master_main.do" >
						취소 
					</a>
				</div>
				
				<div class="master_member_submit">
					<button type="submit">회원추가하기</button>
				</div>
				
			</form>
			
		</div>
		

</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>