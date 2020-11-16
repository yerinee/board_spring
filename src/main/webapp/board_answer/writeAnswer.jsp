<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <title>without bootstrap</title>
    
<%@include file ="/layouts/commonLib.jsp" %>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
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
   	
   	
   
</style>
   
   
    
</head>
<body>
  <%@ include file="/layouts/header.jsp" %>
    <script>
    $(function(){
        
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

    	  var markupStr = $('#summernote').summernote('code');
// 		  console.log(markupStr);
		  $('#summernote').val(markupStr);
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
		  	$('#frm').submit();
		  }
		  
      })
      
	  count =1;
       
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
      
      $('#add').on('click', function(){
          
		if(count <= 5){
    	  count +=1
    	  id = "#file"+count
    	  $(id).prop("type", "file");
		}
      })

      
      
    })  
    </script>
  
<div class="container-fluid">
	<div class="row">

		<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/layouts/left.jsp" %>
		</div>
		<div class="col-sm-9 col-sm-offset-2 col-md-9 col-md-offset-2 main">
  
	   		<form id="frm" action="${cp}/boardAnswerinsert" method="post" enctype="multipart/form-data">
	
				<div class="form-group">
					<label for="bo_title" class="col-sm-2 control-label">게시글 제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="title" name="title" ><br><br>
						<input type="text" name="lbo_id" value="${lbo_id}">게시판번호
						<input type="text" name="p_seq" value="${p_seq}">부모키
						<input type="text" name="gn" value="${gn}">부모키
												
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">게시글 내용</label>
					<div class="col-sm-10">
						<textarea id ="summernote" name="content"></textarea><br><br>
					</div>
				</div>
				<br><br>
					
				<div class="form-group">
					<label for="file" class="col-sm-2 control-label">첨부파일</label>
					<div id ="file" class="col-sm-10">
					<input type="button" id="add" value="+">
						<input type="file" id="file1" name="file1" >
						<input type="hidden" id="file2" name="file2" >											
						<input type="hidden" id="file3" name="file3" >											
						<input type="hidden" id="file4" name="file4" >											
						<input type="hidden" id="file5" name="file5" >											
					</div>
				</div>
				
				
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type ="button" id = "insertbtn"  value="등록하기"> 
					</div>
				</div>	    
	    
		    
		    
	  		 </form>	 
		</div>
	</div>
</div>
</body>
</html>