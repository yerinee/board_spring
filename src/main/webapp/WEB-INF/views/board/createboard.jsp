<%@page import="kr.or.ddit.board.model.LboardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <script src = "js/jquery-3.5.1.min.js"></script> -->


<script type="text/javascript">

	$(function(){
		lbo_status = "";
		lbo_id  ="";
		lbo_nm = "";
		
		$('#stats select').on('change', function(){
		
			lbo_status =  $(this).val()
		})
		$('#name input').on('change', function(){

			lbo_nm = $(this).val()

		})
			
		$('#edit input').on('click', function(){
				lbo_id = $(this).data("lbo_id")
				
// 				$('#lb_status').val(lbo_status)
// 				$('#lb_id').val(lbo_id)
// 				$('#lb_nm').val(lbo_nm)
				
				
					
// 				console.log("lbo_id= " + $('#lb_status').val())
// 				console.log("lbo_status= " + $('#lb_id').val())
// 				console.log("lbo_nm= " + $('#lb_nm').val())
				
// 				$('#frm').submit();
					

					var uri ="/updateLboardServlet?lbo_id=" + lbo_id +"&lbo_status=" + lbo_status +"&lbo_nm="+lbo_nm;		
					var enc = encodeURI(uri);
// 					console.log(enc); 
					document.location = enc;
		})

				
				
	// 			var lbo_status = $('#status2 option:selected').val()
	// 			console.log("lbo_status2= " + lbo_status)
	//  				
	})
		


</script>

</head>
<body>
<%@ include file="/layouts/header.jsp" %>

<div class="container-fluid">
	<div class="row">
			
		<div class="col-sm-3 col-md-2 sidebar">
			<%@ include file="/layouts/left.jsp" %>	
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					
			
			<div class="row">
				<div class="col-sm-8 blog-main">
					<h2 class="sub-header">게시판 생성</h2>
					
					<div class="table-responsive">
						<form method ="post" action="${cp}/insertLboardServlet">
							<table class="table table-striped">					
								<tr>
									<td><strong>게시판이름</strong></td>
									<td><input type="text" name="lbo_nm" value="" required></td>
									<td>
										<select id="status1" name ="lbo_status" required>	
											<option value ="">선택</option>
											<option value="0" >미사용</option>	
											<option value="1">사용</option>	
										</select>
									</td>
									<td><input type="submit" value ="생성"></td>
								</tr>
								</table>
							</form>	
							<br><br>
							<h2 class="sub-header">게시판 목록</h2>
							<c:forEach items="${lbolist }" var="lboard">
								<form method ="post" action="${cp}/updateLboardServlet">
									<table class="table table-striped">
											<tr >
												<td><strong>게시판이름</strong></td>
												<td><input type="text" name = "nm" value="${lboard.lbo_nm }">
													<input name ="id" type="hidden" value="${lboard.lbo_id }">
		<!-- 										<input id ="lb_nm" type="hidden" value=""> -->
		<!-- 										<input id ="lb_status" type="hidden" value=""></td> -->
												<td>											
													<select name ="status">													
														<c:choose>
															<c:when test="${lboard.lbo_status == '0'}">
																<option value="0" selected>미사용</option>	
																<option value="1">사용</option>	
															</c:when>
															<c:when test="${lboard.lbo_status == '1'}">
																<option value="1" selected>사용</option>	
																<option value="0">미사용</option>	
															</c:when>													
														</c:choose>
													</select>
												</td>
												<td id ="edit"><input data-lbo_id="${lboard.lbo_id }" type="submit" value ="수정"></td>
											</tr>
									</table>
								</form>	
							</c:forEach>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>