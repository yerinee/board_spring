<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Jsp</title>

<%@include file ="/layouts/commonLib.jsp" %>

<script>
$(document).ready(function(){


// 	$('#editbtn').on('click', function(){
// 		a = $('#userId').text()
// 		console.log(a);		
// 		//document.location="/memberUpdate?userid=${memberVo.userid}"
// 	})

// 	$('#profileDownBtn').on('click', function(){
// 		document.location="/profileDownload?userid=${memberVo.userid}"
// 	})
	$('#re_con').keyup(function (e){
	    var content = $(this).val();

	    $('#counter').html("('+content.length+' / 최대 500자)");    //글자수 실시간 카운팅
	  
		$('#count').html(content.length);
		
	    if (content.length > 500){
	        alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#counter').html("(200 / 최대 500자)");
	    }
	});

	$('#delbtn1').on('click', function(){
		if(confirm("정말 삭제하시겠습니까??") == true){

			document.location="${cp}/board/delboard?bo_id=${boardvo.bo_id}&lbo_id=${boardvo.lbo_id}"
		}	
	})

	
});

</script>

<style>
	input[type=search]{
		border: none; 
		background: transparent;
		height : auto;
	}
	input[type=text]{
		display: inline-block;
	}
	#re_con{
		resize :none;
		width: 600px;
		height: 70px;
	}
	
	.reply_con{
		width: 600px;
		height: 70px;
      	resize: none;
      	
      	padding: 1.1em; /* prevents text jump on Enter keypress */
      	padding-bottom: 0.2em;
      	line-height: 1.6;
	}
	
/* 	#sebumenu{ */
/* 		float: right; */
/* 		padding-right: 20%; */
/* 	} */

	#delbtn1,#editbtn,#replybtn,#replybtn2 {
		background:	#C0C0C0	;
	}
	
	
	
</style>
</head>

<body>
<%@ include file="/layouts/header.jsp" %>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/layouts/left.jsp" %>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form class="form-horizontal" role="form">
<!-- 					<div class="form-group"> -->
<!-- 						<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label> -->
<!-- 						<div class="col-sm-10"> -->
<!-- 							<input type="text" class="form-control" id="userId" name="userId" -->
<!-- 								placeholder="사용자 아이디"> -->
<!-- 						</div> -->
<!-- 					</div> -->
				<!-- 1. 파일 업로드 경로를 이클립스내에 만든다.  -->
					<div class="form-group">
						<hr>
						<label for="bo_title" class="col-sm-2 control-label">제목</label>
						<div class="col-sm-10">
<%-- 							<img src="${cp }/profile/${memberVo.filename}"/> --%>
							<label id ="bo_title" class="control-label">${boardvo.bo_title }</label>
<%-- 							<label id ="userId" class="control-label">${boardvo.bo_title }</label> --%>
							
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">작성자 이름</label>
						<div class="col-sm-10">
							<label class="control-label">${boardvo.mem_id }</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="bo_con" class="col-sm-2 control-label">글내용</label>
						<div class="col-sm-10">
							<c:if test="${boardvo.bo_con == '<p><br></p>'}">
								[ 내용이 없습니다. ]
							</c:if>
							<label id ="bo_con" class="control-label">${boardvo.bo_con }</label>
							
						</div>
					</div>

					
					<div class="form-group">
						<label for="file" class="col-sm-2 control-label">첨부파일</label>
						<div class="col-sm-10">
<%-- 							<c:forEach var="i" begin="1" end="${filelist.size()}" step="1" varStatus = "file"> --%>
<%-- <%-- 							<input id ="profileDownBtn" type="button" class="btn btn-default" value ="다운로드 ${memberVo.realfilename }"/> --%> 
<%-- 								<input id ="file${i }"  type="button" class="btn btn-default" value="${file.file_nm}" disabled><br><br> --%>
<%-- 							</c:forEach> --%>
							<c:if test="${filelist.size() == 0}">
								[ 첨부파일이 없습니다. ]
							</c:if>

							<c:forEach items="${filelist }" var="files" begin ="0" varStatus="vs" end="${filelist.size() }" step="1" >
<%-- 								<input id ="profileDownBtn" type="button" class="btn btn-default" value ="다운로드 ${memberVo.realfilename }"/> --%>
							
								<a href="${cp }/board/fileDown?file_id=${files.file_id}"><input id ="files${vs.index}"  type="button" class="btn btn-default" name="${files.file_id}" value="${files.file_nm} 다운로드" ></a><br><br>
							</c:forEach>
							
						
						</div>
					</div>
					
					<br>
					<div class="form-group">
						<label for="btn" class="col-sm-2 control-label"></label>
						<div id = "sebumenu">
							<c:if test= "${boardvo.mem_id == S_MEMBER.mem_id}">
								<a href = "${cp}/board/updateBoardview?bo_id=${boardvo.bo_id}"><input id ="editbtn" type="button" class="btn btn-default" value ="수정"/></a>
								<input id ="delbtn1" type="button" class="btn btn-default" value ="삭제"/>							
<%-- 								<a href = "${cp}/boardDeleteServlet?bo_id=${boardvo.bo_id}&lbo_id=${boardvo.lbo_id}"><input id ="delbtn" type="button" class="btn btn-default" value ="삭제"/></a>								 --%>
							</c:if>
							<a href = "${cp}/board/answerview?bo_id=${boardvo.bo_id}&lbo_id=${boardvo.lbo_id}&gn=${boardvo.gn}"><input id ="replybtn" type="button" class="btn btn-default" value ="답글"/></a>
						</div>
					</div>

					
					
				
				</form>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form class="form-horizontal" role="form" id ="frm" method="post" action="${cp }/board/insertreply">	
					<div class="form-group">
					<hr>
						<label for="pass" class="col-sm-2 control-label">댓글</label>
						<div class="col-sm-8">					
							<input type="hidden" name="bo_id" value="${boardvo.bo_id}">
							<c:forEach items="${replylist }" var="replylist">
								<c:if test= "${replylist.re_status == 1}">								
	 								<textarea disabled class ="reply_con" >${replylist.re_con}</textarea>
	 								[ ${replylist.mem_id } / <fmt:formatDate value="${replylist.re_date }" pattern="yyyy-MM-dd HH:mm"/> ] 	
	 								
	 								<c:if test= "${boardvo.mem_id == S_MEMBER.mem_id && replylist.re_status == 1}">								
										<a href = "${cp}/board/delreply?re_id=${replylist.re_id}&bo_id=${replylist.bo_id}"><input id ="delbtn2" type="button" class="btn btn-default" value ="삭제"/></a>								
									</c:if>							
								</c:if>		 														
								<c:if test= "${replylist.re_status == 0}">								
									<textarea disabled class ="reply_con"> [삭제된 댓글입니다.]	</textarea>	<br>						
								</c:if>		 														
	 							
							</c:forEach>
<!--  							<input type="text" name = "re_con" class="form-control" value=""><input type = "submit" class="btn btn-default" value = "댓글저장"><br> -->
							<br>
 							<textarea name = "re_con" id ="re_con"  ></textarea>&nbsp;<input id="replybtn2" type = "submit" class="btn btn-default" value = "댓글작성"><br>
 							<span id="count"> 0</span> &nbsp;자 / 500 자 
 							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
