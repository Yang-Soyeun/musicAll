<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

	<section class="home-section home-full-height bg-dark-30" id="home" data-background="${path}/resources/images/section-5.jpg">

    
	<section id="home" data-background="${path}/resources/images/section-5.jpg" style="overflow: hidden; height: 100vh;">

		<!-- <div class="video-player" data-property="{videoURL:'https://www.youtube.com/watch?v=bNucJgetMjE', containment:'.home-section', startAt:18, mute:false, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div> -->
		<div>
			<video src="${path }/resources/video/main.mp4" muted autoplay loop></video>
		</div>
	</section>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

