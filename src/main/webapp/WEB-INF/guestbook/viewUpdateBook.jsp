<%@page import="java.util.Date"%>
<%@page import="gntp.lesson.guestbook.util.DateTimeService"%>
<%@page import="gntp.lesson.guestbook.vo.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
	
	body{
		background-color: #F0F8FF;
	}

	h1{
		text-align: center;
	}
	tr, th, td{
		text-align: center;
		border: 1px solid lightgray;
	}
	
	a{
		text-decoration-line: none;
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
	
	input{
		float:left;
	}
	
	.writeBtn{
		background-color: lightblue;
		color: white;
    	border: solid 1px white;
		border-radius: 5px;
		margin-left: 92%;
		height: 45px;
		cursor: pointer;
		width: 100px;
	}
	
	.writeBtn:hover{
		background-color: cornflowerblue;
		color: white;
		border-color: blue;
	}
</style>
<title>View Update Book</title>
</head>
<body>
<h1>Update Book</h1>
<body>

<form action="${contextPath}/guestbook/updateBook.do" method="post">
<%  GuestbookVO book = (GuestbookVO)request.getAttribute("book"); %>
<input type="hidden" name="seq" value="${book.seq}">
<table>
	<tr><th>Title </th><td><input type="text" name="title" value="${book.title}"></td><td></td></tr>
	<tr><th>Content </th><td><input type="text" name="content" size="80" value="${book.content}"></td><td></td></tr>
	<tr><th>ReadCount </th><td><input type="text" name="readCount" value="${book.readCount}" readonly="readonly"></td><td></td></tr>
	<tr><th>Date </th><td><input type="text" name="date" value="${book.regDate}" readonly="readonly"></td><td></td></tr>
	<tr><th>UserId </th><td> <input type="text" name="userId" value="${book.userId }" readonly="readonly"></td><td></td></tr>
	<tr><td colspan="3"><input type="submit" class="writeBtn" value="글 수정"></td></tr>
</table>	
</form>
</body>
</html>