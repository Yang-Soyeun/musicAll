<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>채팅목록</title>
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<body>
<div class="talkTool">
	<!-- Title 채팅 -->
	<header class= "top-header">
		<div class="header__column">
			<span class="header__text">채팅</span>
		</div>
	</header>
	
	<!-- 채팅방들 리스트 -->
	<main class="chats">
	 
	 <ul class="chats__list">
	 	<c:forEach var="l" items="${list }">
			<li class="chats__chat" id="room1">
				<div class="chat__content">
					<div class="chat__preview" onclick="bt_preview(${l.getMCode()});">
						<h3 class="chat__user">${l.getMTitle() }</h3>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	</main>
</div>
</body>

<script>
 const bt_preview=(mCode)=>{
	 //채팅방으로 입장
	location.href = "${pageContext.request.contextPath }/chatting/chattingpage.do?roomNo=" + mCode; 
 }
	

</script>


</html>
