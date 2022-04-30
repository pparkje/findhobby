<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.findhobby.model.members"%>

<%
	request.setCharacterEncoding("UTF-8");
	members key_main = (members) session.getAttribute("key");
    session.setAttribute("key", key_main);
%>

<!-- 검색 처리 , 관심페이지 , 취미찾기페이지로 이동 -->



<!-- 이곳에 HTML 코딩 진행  -->
<div class="body_body">
	<div class="body_center">
	
		<!-- 배너 ( 모든 취미 페이지로 이동 , 인기 취미로 이동 , 취미찾기페이지로 이동)-->
		
		<div class="swiper-container">
			<ul class="swiper-wrapper">
				<li class="swiper-slide">
					<a class="banner_icon" href="${pageContext.request.contextPath}/allhobby.do" >
						<img class="banner_img1" src="${pageContext.request.contextPath}/views/img/banner1_mk1.png" />
					</a>
				</li>
				<li class="swiper-slide">
					<a class="banner_icon" href="${pageContext.request.contextPath}/popularity_hobby.do" >
						<img class="banner_img2" src="${pageContext.request.contextPath}/views/img/banner1_mk2.png" />
					</a>
				</li>
				<li class="swiper-slide">
					<a class="banner_icon" href="${pageContext.request.contextPath}/hobby_test.do" >
						<img class="banner_img3" src="${pageContext.request.contextPath}/views/img/banner1_mk3.png" />
					</a>
				</li>
			</ul>
			
			<!-- 페이징 버튼 처리 상황에 따라 추가 삭제가능--> 
			<div class="swiper-pagination"></div> 
			<!-- 방향 버튼 상황에 따라 추가 삭제가능 --> 
			<div class="swiper-button-prev"></div> 
			<div class="swiper-button-next"></div>
		</div>
		
		<!-- 추천 키워드  -->
		<div class="best_keyword">
			<div class="best_keyword_sub">
				<a class="best_keyword_sub_favkeyword" href="${pageContext.request.contextPath}/popularity_hobby.do" >
				인기 키워드
				</a>
			</div>
			
			<!-- 검색어 키워드 들어가게 검색 페이지로 -->
			<div class="best_keyword_cont">
				<ul class="best_keyword_cont_sub">
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="영화">
							<div class="main_findhobyy_submit">
								<button type="submit">영화</button>
							</div>
						</form>
					</li>
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="IT">
							<div class="main_findhobyy_submit">
								<button type="submit">IT</button>
							</div>
						</form>
					</li>
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="운동">
							<div class="main_findhobyy_submit">
								<button type="submit">운동</button>
							</div>
						</form>
					</li>
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="빙상스포츠">
							<div class="main_findhobyy_submit">
								<button type="submit">빙상스포츠</button>
							</div>
						</form>
					</li>
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="실내스포츠">
							<div class="main_findhobyy_submit">
								<button type="submit">실내스포츠</button>
							</div>
						</form>
					</li>
					<li>
						<form method="post" action="${pageContext.request.contextPath}/findhobby.do">
							<input type="hidden" name="search_text" id="search_text" value="제작">
							<div class="main_findhobyy_submit">
								<button type="submit">제작</button>
							</div>
						</form>
					</li>
				</ul>
			</div>
			
		</div>
		
		<!-- 취미 추천 파트1  -->
		<div class="hob_chu">
			<div class="hob_chu_sub">
				추천취미 1
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
				
					<c:forEach var="i" begin="1" end="6" step="1" varStatus="status">
						
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
					
				</ul>
			</div>
		</div>
		
		<!-- 취미 추천 파트2  -->
		<div class="hob_chu">
			<div class="hob_chu_sub">
				추천취미 2
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
					<c:forEach var="i" begin="7" end="12" step="1" varStatus="status">
						
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 취미 추천 파트3  -->
		<div class="hob_chu">
			<div class="hob_chu_sub">
				추천취미 3
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
					<c:forEach var="i" begin="13" end="18" step="1" varStatus="status">
							
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<!-- more -->
		<div class="more_A">
			<a href="javascript:void(0);" class="more_click">more</a>
		</div>
		<!-- *********************************************************************************  -->
		
		<!-- 취미 추천 파트4  -->
		<div class="hob_chu_none_A">
			<div class="hob_chu_sub">
				추천취미 4
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
					<c:forEach var="i" begin="19" end="24" step="1" varStatus="status">
							
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 취미 추천 파트5  -->
		<div class="hob_chu_none_B">
			<div class="hob_chu_sub">
				추천취미 5
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
					<c:forEach var="i" begin="25" end="30" step="1" varStatus="status">
							
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 취미 추천 파트6  -->
		<div class="hob_chu_none_C">
			<div class="hob_chu_sub">
				추천취미 6
			</div>
			<div class="hob_chu_cont">
				<ul class="hob_chu_cont_A">
					<c:forEach var="i" begin="31" end="36" step="1" varStatus="status">
							
						<c:url value="/hobby_detail.do" var="hobby_detail_URL">
							<c:param name="id" value="${i}" />
						</c:url>
					
						<li class="hob_chu_list">
							<a class="hob_chu_tag" href="${hobby_detail_URL}" >
								<img class="hob_chu_img" src="${pageContext.request.contextPath}/views/img/${output_hobby_list[status.index-1].h_image_a}" />
								<div class="hob_chu_list_sub">${output_hobby_list[status.index-1].h_name}</div>
							</a>
						</li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
		
		
		
		
	</div>
</div>
<!-- 이곳에 HTML 코딩 진행  -->    
<!-- footer부분 -->
<%@ include file="footer.jsp"%>


<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/plugins/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/plugins/lightbox/css/lightbox.min.js"></script>


<script type="text/javascript">
	const slide = new Swiper('.swiper-container',{
		slidesPerView : 1,
		spaceBetween : 30,
		debugger: true,
		loop : true,
		loopAdditionalSlides : 1,
		pagination : true,
		
		// 자동 슬라이드 설정 , 비 활성화 시 false
		autoplay : {  
			  delay : 3000,   // 시간 설정
			  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
		},
	
		//페이징 
		pagination: { 
			//페이지 기능 
			el: '.swiper-pagination', 
			//클릭 가능여부 
			clickable: true, 
		},
		//방향표 
		navigation: { 
			//다음페이지 설정 
			nextEl: '.swiper-button-next', 
			//이전페이지 설정 
			prevEl: '.swiper-button-prev', 
		}
	})
	$(function() {
		$('.more_click').click(function() {
		
			var cl1 = document.querySelector('.hob_chu_none_A');
			var cl2 = document.querySelector('.hob_chu_none_B');
			var cl3 = document.querySelector('.hob_chu_none_C');
			var cl4 = document.querySelector('.more_A');
			
			cl1.style.display = "block";
			cl2.style.display = "block";
			cl3.style.display = "block";
			cl4.style.display = "none";

		});
	});
</script>
</body>

</html>