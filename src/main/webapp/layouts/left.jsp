<%@page import="kr.or.ddit.board.model.LboardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="nav nav-sidebar">

<%-- 	<%	 --%>
<!-- // 			if(session.getAttribute("lboardlist") != null){ -->
<!-- // 				List<LboardVo> lbolist = (List<LboardVo>)session.getAttribute("lboardlist");	 -->
<!-- // 			} -->
<%-- 	%> --%>
	
	<li class="active"><a href="${pageContext.request.contextPath }/board/lboard">게시판 생성 <span class="sr-only">(current)</span></a></li>
	<c:forEach items="${lboardlist }" var="lboard">
		<li class="active"><a href="${pageContext.request.contextPath }/board/boardlist?lbo_id='${lboard.lbo_id}'">${lboard.lbo_nm}</a></li>
	</c:forEach>
	
</ul>