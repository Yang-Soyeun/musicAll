<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메세지</title>
</head>
<body>

	<script>
		alert("${msg}");
		<c:if test="${ not empty loc}">
			opener.location.href='${path}${loc}';
		</c:if>
		window.close();
	</script>
</body>
</html>