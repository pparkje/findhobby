<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="study.spring.findhobby.model.members"%>

<% 
	request.setCharacterEncoding("UTF-8");
	members key_footer= (members) session.getAttribute("key");
	session.setAttribute("key", key_footer);
%>

<div class="footer">
	<div class="footer_center">
		<div class="footer_left">
			<ul class="footer_left_up">
				<li class="gokek_number">0000 - 0000</li>
				<li>상담시간</li>
				<li>0900 ~ 1800</li>
				<li>(주말,공휴일 제외)</li>
				<li>(점심시간 1200 ~ 1300 제외)</li>
			</ul>
			<ul class="footer_left_down">
				<li>상호명 : AhAhIT</li>
				<li>대표이사 : pparkje</li>
				<li>주소 : 경기도 성남시 분당구 판교역로 146번길 20</li>
				<li>지번 : 경기도 성남시 분당수 백현동 541</li>
				<li>이메일 : woguspgh@naver.com</li>
				<li>copyrightⓒ 2022 All rights reserved by pparkje</li>
			</ul>
		</div>
		<div class="footer_right">
			<ul class="footer_right_up">
				<li>
					<a class="banner_icon" href="${pageContext.request.contextPath}/noticecompany.do" >
						회사개요
					</a>
				</li>
				<li>
					<a class="banner_icon" href="${pageContext.request.contextPath}/usefindhobby.do" >
						이용안내
					</a>
				</li>
				<li>
					<a class="banner_icon" href="${pageContext.request.contextPath}/usercenter.do" >
						고객센터
					</a>
				</li>
				<% 
	    		
                    	if(key_footer == null){ 
                %>
				<il class="footer_right_up_last">
					<a class="banner_icon" href="${pageContext.request.contextPath}/login.do" >
						1:1문의
					</a>
				</il>
				<% }else{ 
                    	
                    	session.setAttribute("key", key_footer);
                %>
				<il class="footer_right_up_last">
					<a class="banner_icon" href="${pageContext.request.contextPath}/usercenter_question.do" >
						1:1문의
					</a>
				</il>
				 <% } %>
			</ul>
			<ul class="footer_right_down">
				<il class="footer_right_down_icon_A">
					<a class="banner_icon" href="https://www.facebook.com/" target="_blank">
						<img alt="페이스북" src="${pageContext.request.contextPath}/views/img/facebook.png">
					</a>
				</il>
				<il class="footer_right_down_icon">
					<a class="banner_icon" href="https://www.instagram.com/" target="_blank">
						<img alt="인스타그램" src="${pageContext.request.contextPath}/views/img/ins.png">
					</a>
				</il>
				<il class="footer_right_down_icon">
					<a class="banner_icon" href="https://section.blog.naver.com/BlogHome.nhn?directoryNo=0&currentPage=1&groupId=0" target="_blank" >
						<img alt="네이버블로그" src="${pageContext.request.contextPath}/views/img/blog.png">
					</a>
				</il>
			</ul>
		</div>
	</div>
</div>