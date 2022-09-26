<%@page import="java.util.Date"%>
<%@page import="gntp.lesson.guestbook.util.DateTimeService"%>
<%@page import="gntp.lesson.guestbook.vo.GuestbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guestbook list</title>
<script>
	const del = document.getElementByClassName("deleteBtn");
	function deleteBtn(flag){
		alert("삭제하시겠습니까");
		if(flag==true){
			del.style.display = 'block';
		}else{
			del.style.display = 'none';
		}
	}

</script>
<style>
	body{
		background-color: #F0F8FF;
	}
	
	@font-face {
	  font-family: neon;
	  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
	}
	
	h1{
		text-align: center;
		font-family: neon;
		color: #426DFB;
		line-height: 9vw;
		text-shadow: 0 0 3vw #2356FF;
	}
	
	h1 {
		  animation: h1 2s linear infinite;
		  -moz-animation: h1 2s linear infinite;
		  -webkit-animation: h1 2s linear infinite;
		  -o-animation: h1 2s linear infinite;
		}
		
	@keyframes h1 {
	  0%,
	  100% {
	    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
	    color: #28D7FE;
	  }
	  50% {
	    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
	    color: #146C80;
	  }
	}
		
	tr, th, td{
		text-align: center;
		border: 1px solid lightgray;
	}
	
	a{
		text-decoration-line: none;
	}
	
	a:hover{
		text-shadow: 0 0 1vw #2356FF;
	}
	
	table{
	 border: 1px #a39485 solid;
	 font-size: .9em;
	 box-shadow: 0 2px 5px rgba(0,0,0,.25);
	 width: 100%;
	 border-collapse: collapse;
	 border-radius: 5px;
	 overflow: hidden;
	}
	
	.deleteBtn{
		background-color: lightblue;
		color: white;
    	border: solid 1px white;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.writeBtn{
		background-color: lightblue;
		color: white;
    	border: solid 1px white;
		margin-top: 50px;
		border-radius: 5px;
		margin-left: 92%;
		height: 45px;
		width: 100px;
		cursor: pointer;
	}
	
	button:hover{
		background-color: cornflowerblue;
		color: white;
		border-color: blue;
	}
</style>
</head>
<body>
<%--
<% ArrayList<GuestbookVO> list = (ArrayList<GuestbookVO>)request.getAttribute("list");%>
--%>
<h1>Guestbook List</h1>
<hr>
<table>
<tr><th>순번</th><th>사용자 ID</th><th>제목</th><th>내용</th><th>작성일</th><th>조회 수</th><th></th></tr>
<%--<%for(GuestbookVO book : list){%>--%>
<c:forEach var="book" items="${list}" >
	<tr>
		<td>${book.seq}</td>
		<td>${book.userId}</td>
		<td><a href="${contextPath}/guestbook/readBook.do?seq=${book.seq}&token=on">${book.title}</a></td>
		<td>${book.content}</td>
		<td>${book.regDate }</td>
		<td>${book.readCount}</td>
		<td><a href="${contextPath}/guestbook/deleteBook.do?seq=${book.seq}"><button class="deleteBtn" onclick="deleteBtn(true)">삭제</button></a></td>
	</tr>
<%--<% }%>--%>
</c:forEach>
</table>

<a href="${contextPath}/guestbook/writeBook.do"><button class="writeBtn">방명록 작성</button></a>
</body>
</html>