<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
</head>
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
<body>
	<div class="winPopWrapper">
		<div class="titleWrap">
			<h1>musicAll 이용약관</h1>
		</div>
		<c:if test="${not empty terms }">
		<div id="agreement_table" >${terms.term_content}</div>
		</c:if>
	</div>

</body>
</html>