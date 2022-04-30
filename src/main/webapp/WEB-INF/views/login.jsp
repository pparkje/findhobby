<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="login_body">
	<div class="login_body_center">
	
		<c:set var="check_qna" value="${qna}" />	
	
		<c:choose>
		
			<c:when test="${check_qna == 'qna'}">
			
				<form method="post" action="${pageContext.request.contextPath}/qna_login_ok.do">
		
					<div class="login_title">로그인</div>
					
					<div class="login_id">
						<label for="m_id">아이디</label>
						<input type="text" placeholder="아이디를 입력해주세요." name="m_id" id="m_id"  />
					</div>
					
					<div class="login_password">
						<label for="m_pw">비밀번호</label>
						<input type="password" placeholder="비밀번호를 입력해주세요." name="m_pw" id="m_pw"  />
					</div>
					
					<div class="login_new_member">
						<a class="login_user_plus" href="${pageContext.request.contextPath}/login_user_plus.do" >
						회원가입
						</a>
					</div>
					
					<div class="login_IDPW_find">
						<a class="login_user_IDPW" href="${pageContext.request.contextPath}/login_user_IDPW.do" >
						ID / PW 찾기
						</a>
					</div>
					
					<div class="login_submit">
						<button type="submit">login</button>
					</div>
			
				</form>
	
			</c:when>
	
			<c:otherwise>
	
			<form method="post" action="${pageContext.request.contextPath}/login_ok.do">
			
				<div class="login_title">로그인</div>
				
				<div class="login_id">
					<label for="m_id">아이디</label>
					<input type="text" placeholder="아이디를 입력해주세요." name="m_id" id="m_id"  />
				</div>
				
				<div class="login_password">
					<label for="m_pw">비밀번호</label>
					<input type="password" placeholder="비밀번호를 입력해주세요." name="m_pw" id="m_pw"  />
				</div>
				
				<div class="login_new_member">
					<a class="login_user_plus" href="${pageContext.request.contextPath}/login_user_plus.do" >
					회원가입
					</a>
				</div>
				
				<div class="login_IDPW_find">
					<a class="login_user_IDPW" href="${pageContext.request.contextPath}/login_user_IDPW.do" >
					ID / PW 찾기
					</a>
				</div>
				
				<div class="login_submit">
					<button type="submit">login</button>
				</div>
				
			</form>
		
		
			</c:otherwise>	
		
		</c:choose>
		
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