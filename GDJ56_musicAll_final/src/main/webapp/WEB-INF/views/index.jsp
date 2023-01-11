<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

	<div class="video-1">
		<div class="video-1-1">
			<video class="video-s" muted autoplay loop>
				<source src="${path}/resources/video/main.mp4" type="video/mp4">
			</video>
		</div>
	</div>

<script src="${path}/resources/js/main.js"></script>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>