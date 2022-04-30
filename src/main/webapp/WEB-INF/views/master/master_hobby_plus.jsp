<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="master_header.jsp"%>
<%@ include file="master_sidebar.jsp"%>


<!-- 이곳에 HTML 코딩 진행  -->
<div class="master_hobby_plus_body">
		
		<div class="master_hobby_plus_sub">취미추가</div>
		
		<div class="master_hobby_plus_cont">
			<form action="${pageContext.request.contextPath}/master/master_hobby_plus_ok.do" method="post" enctype="multipart/form-data">
			
				<div class="master_hobby_plus_cont_name">
					<label for="h_name">취미이름</label>
					<input type="text" placeholder="취미이름을 적어주세요."  name="h_name" id="h_name" />
				</div>
				
				<!-- 취미 사진이랑 관련사진은 업로드 처리해야함 -->
				<div class="master_hobby_plus_cont_main_picture">
					<div class="master_hobby_plus_cont_main_picture_sub">메인사진</div>
					<input class="main_upload" value="첨부파일" placeholder="메인첨부파일">
					<label for="h_image_a">업로드</label>
					<input type="file" placeholder="취미사진등록"  name="h_image_a" id="h_image_a" />
				</div>
				
				<div class="master_hobby_plus_cont_sub_picture">	
					<div class="master_hobby_plus_cont_sub_picture_sub">관련사진</div>
					<input class="sub_upload" value="첨부파일" placeholder="관련첨부파일">
					<label for="h_image_b">업로드</label>
					<input type="file" placeholder="관련사진등록"  name="h_image_b" id="h_image_b" multiple/>
				</div>
				
				<div class="master_hobby_plus_cont_option">
					<label for="h_option">분류</label>
					<input type="text" placeholder="취미를 분류해주세요."  name="h_option" id="h_option" />
				</div>
				
				<div class="master_hobby_plus_cont_cont">
					<label for="h_cont">내용</label>
					<textarea class="master_hobby_plus_cont_cont_textarear"  placeholder="취미 소개를 적어주세요." id="h_cont" name="h_cont"></textarea>
				</div>
				
				<div class="master_hobby_plus_cont_cancel">
					<a class="master_hobby_plus_cont_cancel_atag" href="${pageContext.request.contextPath}/master/master_hobby_main.do" >
						취소 
					</a>
				</div>
				
				<div class="master_hobby_plus_cont_submit">
					<button type="submit">취미추가하기</button>
				</div>
			</form>
		</div>
		
</div>
<!-- 이곳에 HTML 코딩 진행  -->    

<script src="${pageContext.request.contextPath}/views/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/views/js/swiper-bundle.min.js"></script>
<script type="text/javascript">

// 1차 시도
/* $("#h_image_a").on('change',function(){
	  var fileName_main = $("#h_image_a").val();
	  $(".main_upload").val(fileName);
}); */

/* $("#h_image_b").on('change',function(){
	  var fileName_main_sub = $("#h_image_b").val();
	  $(".sub_upload").val(fileName);
}); */

// 2차 시도
$(document).ready(function(){ 
  var fileTarget = $('#h_image_a'); 
  fileTarget.on('change', function(){ 
      var cur=$(".master_hobby_plus_cont_main_picture input[type='file']").val();
    $(".main_upload").val(cur);
  }); 
}); 

//2차시도 서브 파일목록
/* $(document).ready(function(){ 
	  var fileTarget = $('#h_image_b'); 
	  fileTarget.on('change', function(){ 
	      var file_input=$(".master_hobby_plus_cont_sub_picture input[type='file']").val();
	      
	      
	    $(".sub_upload").val(file_input);
	  }); 
	});  */

// 3차 시도
/* $(document).ready(function(){ 
	
	var fileTarget = $('#h_image_b'); 
	fileTarget.on('change', function(){ 
		 
		var cur= $(".master_hobby_plus_cont_sub_picture input[type='file']").val();
		// var uploadInput = document.getElementById("h_image_b");
		// var uploadFiles = uploadInput.files;
		var uploadOutput;
			
		for(int i = 0; i < cur.length; i++){
			if(i == 0){
				uploadOutput += cur[i];
			}else {
				uploadOutput += "," + cur[i];
			}
		}
			
		$(".sub_upload").val(uploadOutput);
		
	}); 
	 
});  */

//4차 시도
/* function mulfile(){
	
	var fileInput = document.getElementById("h_image_b");
	var fileOutput;
	
	for(int i = 0; i < fileInput.length; i++){
		fileOutput += fileInput[i].files;
	}
	
	$(".sub_upload").val(fileOutput);
	
}  */

// 5차 시도
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