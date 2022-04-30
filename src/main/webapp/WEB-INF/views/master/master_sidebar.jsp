<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_sidebar_body">
		
		<div class="master_sidebar_part_members">
			<a class="icon_A" href="${pageContext.request.contextPath}/master/master_main.do" >
	    		회원관리
	    	</a>
		</div>
		
		<div class="master_sidebar_part_hobby">
			<a class="icon_A" href="${pageContext.request.contextPath}/master/master_hobby_main.do" >
	    		취미관리
	    	</a>
	    </div>
	    
	    <div class="master_sidebar_part_notice">
			<a class="icon_A" href="${pageContext.request.contextPath}/master/master_notice_main.do" >
	    		공지관리
	    	</a>
	    </div>
	    
	    <div class="master_sidebar_part_qna">
			<a class="icon_A" href="${pageContext.request.contextPath}/master/master_qna_main.do" >
	    		문의관리
	    	</a>
	    </div>
		
</div>
<!-- 이곳에 HTML 코딩 진행  -->    
