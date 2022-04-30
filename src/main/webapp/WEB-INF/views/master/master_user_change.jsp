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
		회원수정
		</div>
		
		<div class="master_user_plus_cont">
		
			<form action="${pageContext.request.contextPath}/master/master_update_ok.do" method="post">
			
				<input type="hidden" name="id" id="id" value="${output_master_update.id}">
			
				<div class="master_member_id">
					<label for="m_id">아이디</label>
					<input type="text" placeholder="아이디"  name="m_id" id="m_id" value="${output_master_update.m_id}"/>
				</div>
				
				<div class="master_member_email">
					<label for="m_email">이메일</label>
					<input type="email" placeholder="이메일 주소"  name="m_email" id="m_email" value="${output_master_update.m_email}"/>
				</div>
				
				<div class="master_member_nik">
					<label for="m_username">닉네임</label>
					<input type="text" placeholder="닉네임을 입력해주세요"  name="m_username" id="m_username" value="${output_master_update.m_username}"/>
				</div>
				
				<div class="master_member_name">
					<label for="m_name">이름</label>
					<input type="text" placeholder="이름을 입력해주세요"  name="m_name" id="m_name" value="${output_master_update.m_name}"/>
				</div>
				
				<div class="master_member_phone">
					<label for="m_phone">연락처</label>
					<input type="text" placeholder="연락처를 입력해주세요. ex)01011111111"  name="m_phone" id="m_phone" value="${output_master_update.m_phone}"/>
				</div>
				
				<div class="master_member_birthday">
					<label for="m_birthday">생년월일</label>
					<input type="date" name="m_birthday" id="m_birthday" value="${output_master_update.m_birthday}"/>
				</div>
				
				<c:set var="gender" value="${output_master_update.m_gender}" />
				
				<c:choose>
					<c:when test="${ gender == 'W' }">
				
					<div class="master_member_gender">
						<label for="gender">성별</label>
						<div class="master_member_gender_FM">
							<input type="radio" class="chk_gender" name="gender" value="W" checked="checked"/>&nbsp;여성
				    	 	<input type="radio" class="chk_gender" name="gender" value="M" />&nbsp;남성
						</div>
					</div>
				
					</c:when>
					
					<c:when test="${ gender == 'M' }">
				
					<div class="master_member_gender">
						<label for="gender">성별</label>
						<div class="master_member_gender_FM">
							<input type="radio" class="chk_gender" name="gender" value="W" />&nbsp;여성
				    	 	<input type="radio" class="chk_gender" name="gender" value="M" checked="checked"/>&nbsp;남성
						</div>
					</div>
					
					</c:when>
				
				</c:choose>
				
				<div class="master_member_submit_cancel">
					<a class="master_member_submit_cancel_atag" href="${pageContext.request.contextPath}/master/master_main.do" >
						취소 
					</a>
				</div>
				
				<div class="master_member_submit">
					<button type="submit">정보수정 하기</button>
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