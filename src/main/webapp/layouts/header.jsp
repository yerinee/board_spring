<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="co
			llapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<%
				MemberVO memberVo = (MemberVO)session.getAttribute("S_MEMBER");
	
			%>
			<a class="navbar-brand" href="main.jsp">대덕인재
<%-- 				<c:if test= "${S_MEMBER != null} "> --%>
<%-- 					[${S_MEMBER.userId}] --%>
<%-- 				</c:if> --%>
				<c:choose>
					<c:when test="${S_MEMBER != null}">[${S_MEMBER.mem_id}]</c:when>							
				</c:choose>
<%-- 			<a class="navbar-brand" href="#">JSP/SPRING [${S_MEMBER.userId}]</a> --%>
			</a>
		
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
				
				<c:if test ="${S_MEMBER != null }">
					<li><a href="${pageContext.request.contextPath }/LogoutServlet">로그아웃</a></li>								
				</c:if>
				<c:if test ="${S_MEMBER == null }">
					<li><a href="${pageContext.request.contextPath}/login.jsp">로그인</a></li>								
				</c:if>

			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
</nav>