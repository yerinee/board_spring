<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

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

	
					<h2 class="sub-header">${lboard.lbo_nm }</h2>
					
					<div class="table-responsive">
						
						<table class="table table-striped">		
							<tr>
								<th>게시글 번호</th>
								<th>제목</th>
								<th>작성자 아이디</th>
								<th>작성일시</th>
							</tr>
							
							<c:if test="${bolist.size() ==0 }">
								<tr></tr>
								<tr>
									<td></td>
									<td>작성된 게시글이 없습니다</td>
									<td></td>
									<td></td>
								</tr>
							</c:if>
						
							<c:forEach items="${bolist }" var="bolist">
								<tr>
									<td>${bolist.bo_id }</td>
									
									
									<c:if test="${bolist.bo_status == 0 && bolist.p_seq == null}">
										<td>[삭제된 게시글입니다.]</td>
									</c:if>
																	
									<c:if test="${bolist.bo_status == 0 && bolist.level == 3}">
										<td> 
											<c:forEach var="i" begin="2" end ="${bolist.level }">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											└─[삭제된 답글입니다.]
										</td>
									</c:if>
									
									<c:if test="${bolist.bo_status == 1}">
										<td>
										<c:forEach var="i" begin="2" end ="${bolist.level }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:forEach>
										
										<a href="${cp }/boardServlet?bo_id=${bolist.bo_id }">${bolist.bo_title}</a></td>
									</c:if>
									
									
									<td>${bolist.mem_id }</td>
									
									<td><fmt:formatDate value="${bolist.bo_date }" pattern="yyyy-MM-dd"/></td>
								</tr>		
							
							</c:forEach>		
						</table>
					</div>
					
					<a href="${cp }/boardInsertServlet?lbo_id=${lboard.lbo_id}" class="btn btn-default pull-right">게시글 작성</a>
<%-- 					page : ${page } --%>
<%-- 					pages : ${pages } --%>
<%-- 					pageSize : ${pageSize } --%>
					
						
					<div class="text-center">
						<ul class="pagination">	
							<c:if test="${page > 1 && page <= pages}">
								<li><span><a href="${pageContext.request.contextPath }/BoardlListServlet?page=1&lbo_id=${lboard.lbo_id}"> << </a> </span></li>									
								<li><span><a href="${pageContext.request.contextPath }/BoardlListServlet?page=${page-1}&lbo_id=${lboard.lbo_id}"> < </a></span></li>									
							</c:if>
			
							
							<c:forEach var="i" begin="1" end ="${pages }">
								
								<c:choose>
									<c:when test="${i == page}">										
										
										<li class="active"><span>${i }</span></li>										
									</c:when>
									<c:otherwise>                                                                                                                                                                                                                                                                                                                                   
										<li><a href="${pageContext.request.contextPath }/BoardlListServlet?page=${i}&lbo_id=${lboard.lbo_id}">${i}</a></li>
									</c:otherwise>
									
								</c:choose>
							</c:forEach>
							<c:if test="${page >= 1 && page < pages}">
								<li><span><a href="${pageContext.request.contextPath }/BoardlListServlet?page=${page+1}&lbo_id=${lboard.lbo_id}"> > </a></span></li>									
								<li><span><a href="${pageContext.request.contextPath }/BoardlListServlet?page=${pages}&lbo_id=${lboard.lbo_id}"> >> </a></span></li>									
							</c:if>			

						</ul>
					</div>
				
				</div>
			</div>
		</div>
	</div>	
</div>
</body>
</html>