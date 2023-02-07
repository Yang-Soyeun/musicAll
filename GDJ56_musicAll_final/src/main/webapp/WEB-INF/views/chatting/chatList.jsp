<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>채팅목록</title>
</head>
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/chat/materialize.min.css"  media="screen,projection"/>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/chat/chat.css"/>


<body>
    <header class="navbar-fixed">
        <nav>
            <div class="nav-wrapper valign-wrapper">
                <span id="spTitle" class="brand-logo center">채팅방</span>
            </div>
        </nav>
    </header>
	<main>
	<!-- 채팅방들 리스트 -->
		<div id="tab-1" class="col s12 tabContents">
			<ul class="collection">
			 	<c:forEach var="l" items="${list }">
				        <li class="collection-item avatar" onclick="bt_preview(${l.getMCode()});" style="line-height:3.5rem;">
				            <img src="${path}/resources/upload/performance/${l.getIName()}" alt="" class="circle">
				            <span class="title">${l.getMTitle() }</span>
		<!-- 		            <p>eee</p>
				            <a href="#!" class="secondary-content">ef</a> -->
				        </li>
				</c:forEach>
	    	</ul>
		</div>
	</main>
</body>

<script>
 const bt_preview=(mCode)=>{
	 //채팅방으로 입장
	location.href = "${path}/chatting/chattingpage.do?roomNo=" + mCode; 
 }
</script>


</html>
