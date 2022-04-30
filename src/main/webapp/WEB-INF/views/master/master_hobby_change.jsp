<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_hobby_plus_body">
		
		<div class="master_hobby_plus_sub">취미수정</div>
		
		<div class="master_hobby_plus_sub_imfor">취미수정시 업로드는 보안상의 이유로 다시 선택해 주시기 바랍니다.</div>
		
		<div class="master_hobby_plus_cont">
			<form action="${pageContext.request.contextPath}/master/master_hobby_update_ok.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="id" id="id" value="${master_hobby_update.id}">
			
				<div class="master_hobby_plus_cont_name">
					<label for="h_name">취미이름</label>
					<input type="text" placeholder="취미이름을 적어주세요."  name="h_name" id="h_name" value="${master_hobby_update.h_name}" />
				</div>
				
				<!-- 취미 사진이랑 관련사진은 업로드 처리해야함 -->
				<div class="master_hobby_plus_cont_main_picture_change">
					<div class="master_hobby_plus_cont_main_picture_sub_change">메인사진</div>
					<input class="main_upload" value="메인첨부파일" placeholder="메인첨부파일">
					<label for="h_image_a">업로드</label>
					<input type="file" placeholder="취미사진등록"  name="h_image_a" id="h_image_a"   />
				</div>
				
				<div class="master_hobby_plus_cont_main_picture_imfor">기존 메인사진 이름 : ${master_hobby_update.h_image_a}</div>
				
				<div class="master_hobby_plus_cont_sub_picture_change">	
					<div class="master_hobby_plus_cont_sub_picture_sub_change">관련사진</div>
					<input class="sub_upload" value="관련첨부파일" placeholder="관련첨부파일">
					<label for="h_image_b">업로드</label>
					<input type="file" placeholder="관련사진등록"   name="h_image_b" id="h_image_b"  multiple/>
				</div>
				
				<div class="master_hobby_plus_cont_sub_picture_imfor">기존 관련사진 이름 : ${master_hobby_update.h_image_b}</div>
				
				<div class="master_hobby_plus_cont_option">
					<label for="h_option">분류</label>
					<input type="text" placeholder="취미를 분류해주세요."  name="h_option" id="h_option" value="${master_hobby_update.h_option}"/>
				</div>
				
				<div class="master_hobby_plus_cont_cont">
					<label for="h_cont">내용</label>
					<textarea class="master_hobby_plus_cont_cont_textarear"  placeholder="취미 소개를 적어주세요." id="h_cont" name="h_cont" >${master_hobby_update.h_cont}</textarea>
				</div>
				
				<div class="master_hobby_plus_cont_cancel">
					<a class="master_hobby_plus_cont_cancel_atag" href="${pageContext.request.contextPath}/master/master_hobby_main.do" >
						취소 
					</a>
				</div>
				
				<div class="master_hobby_plus_cont_submit">
					<button type="submit">취미수정하기</button>
				</div>
			</form>
		</div>
		
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){ 
	  var fileTarget = $('#h_image_a'); 
	  fileTarget.on('change', function(){ 
	      var cur=$(".master_hobby_plus_cont_main_picture_change input[type='file']").val();
	    $(".main_upload").val(cur);
	  }); 
	}); 
	
$(document).ready(function(){ 
	  var fileTarget = $('#h_image_b'); 
	  fileTarget.on('change', function(){ 
		  
		  var file_input = document.getElementById('h_image_b').files;
		  
		  console.log(file_input);
		  
	      var file_output;
	      
	      for(var i = 0; i < file_input.length; i++){
	    	  if( i == 0 ){
	    		  file_output += document.getElementById('h_image_b').files[i].name;
	    	  }else {
	    		  file_output += ", " + document.getElementById('h_image_b').files[i].name;
	    	  }
	    	  
	      }
	      
	    $(".sub_upload").val(file_output);
	  }); 
	}); 

	
</script>
</body>

</html>