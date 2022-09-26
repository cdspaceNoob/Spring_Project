<%@page import="java.util.List"%>
<%@page import="gntp.lesson.guestbook.vo.ReplyVO"%>
<%@page import="java.util.ArrayList"%>
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
		<script type="text/javascript">
			function goPage(type,frm){
				if(type==0){
					frm.action = "viewUpdateBook.do?seq=${book.seq}"; 
				}else{
					frm.action = "writeReply.do";
				}
				frm.submit();
			}
		</script>			
	<title>Read Book</title>
		
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
		h1{
			text-align: center;
		}
		tr, th, td{
			text-align: center;
			border: 1px solid lightgray;
		}
		
		a{
			text-decoration-line: none;
			color: white;
		}
		
		.reply{
			text-align: left;
		}
		
		.replySeq{
			text-align: right;
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
		
		.text{
			float:left;
		}
		
		.writeBtn{
			background-color: lightblue;
			color: white;
	    	border: solid 1px white;
			border-radius: 5px;
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
</head>
<body>
	<h1>Read Book</h1>
<body>
<form action="listBook.do" method="post" name="frm" >
	<input type="hidden" name="gbSeq" value="${book.seq}">
	<table>
		<tr><td>title :</td><td><input type="text" class="text" name="title" value="${book.title}" readonly="readonly"></td><td></td></tr>
		<tr><td>content :</td><td><input type="text" class="text" name="content" size="80" value="${book.content}" readonly="readonly"></td><td></td></tr>
		<tr><td>readCount :</td><td><input type="text"  class="text" name="readCount" value="${book.readCount}" readonly="readonly"></td><td></td></tr>
		<tr><td>date :</td><td><input type="text" name="date" class="text" value="${book.regDate}" pattern="YYYY-MM-dd" readonly="readonly"></td><td></td></tr>
		<tr><td>userId :</td><td> <input type="text" name="userId" class="text" value="${book.userId}" readonly="readonly"></td><td></td></tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="수정하기" class="writeBtn" onclick="goPage(0,document.frm)">
				<input type="button" value="뒤로가기" class="writeBtn" onclick="javascript:history.back();"> 
				<input type="submit" class="writeBtn" value="리스트로 가기"/>
			</td>
		</tr>
	</table>
<br/>
	
<!-- 댓글 목록 -->
<h3>댓글 목록</h3>
<table>
	<c:if test="${book.replyList!=null}">
		<c:forEach var="vo" items="${book.replyList}">
			<tr><td class="replySeq">${vo.replySeq}</td><td class="reply">${vo.replyContent}</td><td class="reply"><fmt:formatDate value="${vo.replyDate}" pattern="YYYY-MM-dd hh:mm:ss"/></td></tr>
		</c:forEach>
	</c:if>	
</table>

<br/>
	<table>
		<tr><th style="text-align:left">댓글 입력</th></tr>
		<tr><td colspan="3"><input type="text" class="text" name="replyContent" value="" size="200"></td></tr>
		<tr><td colspan="3"><input type="submit" value="댓글쓰기"  class="writeBtn" onclick="goPage(1,document.frm)"></td></tr>
	</table>
</form>
</body>
</html>