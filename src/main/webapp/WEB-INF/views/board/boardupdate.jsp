<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <title>without bootstrap</title>
    
<%@include file ="/layouts/commonLib.jsp" %>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   <style>
   	h2, label {
   	
   		display: inline-block;
   		font-weight: bold;
   	}
   	#title{
   		display: inline-block;
   	}
 	#insertbtn{
 		
 		float: right;
 		width: 100px;
 		height: 40px;
 	
 	
 	}
 
	input[type=search]{
		display : inline-block;
		border: none; 
		background: transparent;
	}

   	
   
</style>
   
   
    
</head>
<body>
  <%@ include file="/layouts/header.jsp" %>
    <script>
    $(function(){

		if(${filelist.size() } >= 5){
			 $('#add').hide()
		}else{
			 $('#add').show()
		}

      
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]

		
      
      })
		
      $('#insertbtn').on('click', function(){

    	  
// 		  console.log(markupStr);
// 		  $('#summernote').val(markupStr);
		  console.log( $('#summernote').val());

		  var title =$('input[name=title]').val();
		  var content = $('#content').val();
		  
		  if(title == ""){
			  alert("제목을 입력해주세요.")
		  }		  
		  else if(content == "<p><br></p>"){
			  alert("내용을 입력해주세요.")
		  }
		  else if(title !=  "" && content != "<p><br></p>"){
// 		  	$('#frm').submit();
		  }
		  
      })
      
	 
       
//       $("#file" + count).on('change',function(){
// //           var file =$('input[type=file]').name();

// 		  id = "#file"+count
//           var fileValue = $(id).val().split("\\");
//           var fileName = fileValue[fileValue.length-1]; // 파일명
		  
//           console.log(fileName)
//           console.log(id)
//           if(fileName != "" ){
// 			console.log("변경")
// // 			count +=1
// // 			id = "#file"+count
// // 			 $("#file").append('<input type="file" id= '+id+' name="file" ><br>	')
// // 			console.log($(id).val())
//           }
//           if(fileName == null || fileName.indexOf(".") == -1){
//         	  console.log("변경안됨1")
//           }
//       })
      
      count =0;
      $(document).on("click", "#add", function(){
          
		if(count <= 5 - $('input[type=seach]').length){
    	  count +=1
    	  id = "#file"+count
    	  $(id).prop("type", "file");
    	  
		}

// 		alert( $('input[type=file]').length )

	    if($('input[type=search]').length + $('input[type=file]').length >= 6){
			 $('#add').hide()
   		}else{
   			 $('#add').show()
   		}
   		
      })

      
      $(document).on("click", "#del", function(){
//     	    alert('클릭됨');
			var id = $(this).prev().attr('name')
			$('#delfile').append(id + ",");
			
    	    $(this).prev().remove();
    	    $(this).next().remove();
    	    $(this).remove();
    	    
    	    if($('input[type=seach]').length >= 5){
      			 $('#add').hide()
      		}else{
      			 $('#add').show()
      		}
       	    
      });

      $('#insertbtn').on('click', function(){
		  var a = $('#delfile').text();
    	  $('#delfile').val(a);
    	  
    	  $('#frm').submit();
      })
      
      
    })  
    </script>
  
<div class="container-fluid">
	<div class="row">

		<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/layouts/left.jsp" %>
		</div>
		<div class="col-sm-9 col-sm-offset-2 col-md-9 col-md-offset-2 main">
  
	   		<form id="frm" action="${cp}/board/updateBoard" method="post" enctype="multipart/form-data">
	
				<div class="form-group">
					<label for="bo_title" class="col-sm-2 control-label">게시글 제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="title" name="bo_title" value="${boardvo.bo_title}"><br><br>
						<input type="hidden" name="lbo_id" value="${boardvo.lbo_id}">
						<input type="hidden" name="bo_id" value="${boardvo.bo_id}">
												
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">게시글 내용</label>
					<div class="col-sm-10">
						<textarea id ="summernote" name="bo_con"> ${boardvo.bo_con}</textarea><br><br>
					</div>
				</div>
				<br><br>
					
				<div class="form-group">
					<label for="file" class="col-sm-2 control-label">첨부파일</label>
					<div id ="file" class="col-sm-10">
					<input type="button" id="add" value="+"><br><br>
						<c:forEach items="${filelist }" var="files" begin ="0" varStatus="vs" end="${filelist.size() }" step="1">
							<input type="search" name="${files.file_id}" value="${files.file_nm}" disabled >
							<input type="button" id="del" value="x"> <br>
						</c:forEach>
						<input type="hidden" id="file1" name="file" >
						<input type="hidden" id="file2" name="file" >											
						<input type="hidden" id="file3" name="file" >											
						<input type="hidden" id="file4" name="file" >											
						<input type="hidden" id="file5" name="file" >		
						<input type="hidden" id="delfile" name="delfile" value="">									
						
					</div>
				</div>
				
				
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type ="button" id = "insertbtn"  value="수정완료"> 
					</div>
				</div>	    
	    
		    
		    
	  		 </form>	 
		</div>
	</div>
</div>
</body>
</html>