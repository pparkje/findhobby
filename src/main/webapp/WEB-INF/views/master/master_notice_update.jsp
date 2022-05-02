<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_hobby_plus_body">
		
		<div class="master_hobby_plus_sub">공지수정</div>
		
		<div class="master_notice_plus_cont">
			<form action="${pageContext.request.contextPath}/master/master_notice_update_ok.do" method="post" >
			
				<input type="hidden" name="id" id="id" value="${output_notice_update.id}">
			
				<div class="master_notice_plus_cont_sub">
					<label for="n_subject">공지제목</label>
					<textarea class="master_notice_plus_cont_sub_textarea"  placeholder="공지 제목을 적어주세요." id="n_subject" name="n_subject">${output_notice_update.n_subject}</textarea>
				</div>
				
				<div class="master_notice_plus_cont_cont">
					<label for="n_cont">공지내용</label>
					<textarea class="master_notice_plus_cont_cont_textarea"  placeholder="공지 내용을 적어주세요." id="n_cont" name="n_cont">${output_notice_update.n_cont}</textarea>
				</div>
			
				<div class="master_notice_plus_cont_name">
					<label for="n_admin">공지 작성자</label>
					<input type="text" value="${output_notice_update.n_admin}" name="n_admin" id="n_admin" />
				</div>
				
				<div class="master_notice_plus_cont_cancel">
					<a class="master_notice_plus_cont_cancel_atag" href="${pageContext.request.contextPath}/master/master_notice_main.do" >
						취소 
					</a>
				</div>
				
				<div class="master_notice_plus_cont_submit">
					<button type="submit">공지수정하기</button>
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