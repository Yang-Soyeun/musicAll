<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/member/question.css">

<body>
<h4 style="margin-top: 100px; margin-left:30%;">
	<img src="${path }/resources/images/question.png" alt="1:1문의하기 - 고객님이 문의하신 질문과 답변 내용을 확인하실 수 있습니다.">
</h4>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 30%;">
<colgroup>
<col width="160px">
<col>
</colgroup>
<tbody><tr>
<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask2.gif" alt="제목"></th>
<td><input name="Title" type="text" class="txt w565" value="" maxlength="200"></td>
</tr>

<tr>
<th>
	<img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask3.gif" alt="유형">
</th>
<td>

	<span class="radiocheck" style="display:"><input name="RQKind" type="radio" value="QK001"> 예매문의</span>
	<span class="radiocheck" style="display:"><input name="RQKind" type="radio" value="QK002"> 공연문의</span>
	<span class="radiocheck" style="display:"><input name="RQKind" type="radio" value="QK003"> 취소/환불/발권</span>
	<span class="radiocheck" style="display:"><input name="RQKind" type="radio" value="QK004"> 포인트문의</span>
	<span class="radiocheck" style="display:"><input name="RQKind" type="radio" value="QK009"> 기타</span>
	
</td>
</tr>
<tr>
	<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask5.gif" alt="내용"></th>
<td>
	<textarea name="Contents" class="w565" style="width: 565px; height: 320px;"></textarea>
</td>
</tr>
</tbody></table>

<div class="ASKbtn" id="divWriteForm" style="display:block; margin-left: 33%;" >
		<span><input type="button" onclick="javascript:CheckWriteForm()" value="등록" class="btn btn-danger btn-circle"></span>
		<span><input type="button" onclick="#" value="취소" class="btn btn-danger btn-circle"></span>
</div>


</body>