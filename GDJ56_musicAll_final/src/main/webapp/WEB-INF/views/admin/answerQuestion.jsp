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
<td><input name="Title" type="text" class="txt w565" value="${qt.qsTitle }" maxlength="200" id="qsTitle" readonly="readonly" ></td>
</tr>

<tr>
<th>
	<img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask3.gif" alt="유형">
</th>
<td>
	
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="예매문의" disabled="disabled" <c:if test="${qt.qsHeadTitle eq '예매문의'}">checked</c:if> > 예매문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="공연문의" disabled="disabled" <c:if test="${qt.qsHeadTitle eq '공연문의'}">checked</c:if>> 공연문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="취소/환불/발권" disabled="disabled" <c:if test="${qt.qsHeadTitle eq '취소/환불/발권'}">checked</c:if>> 취소/환불/발권</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="포인트문의" disabled="disabled" <c:if test="${qt.qsHeadTitle eq '포인트문의'}">checked</c:if>> 포인트문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="기타" disabled="disabled" <c:if test="${qt.qsHeadTitle eq '기타'}">checked</c:if>> 기타</span>
강
</td>
</tr>

<tr>
	<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask9.gif" alt="답변현황"></th>
	<td>${qt.qsResult }</td>
</tr>

<tr>
	<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask5.gif" alt="내용" ></th>
<td>
	<textarea name="Contents" class="w565" style="width: 565px; height: 320px;" id="qsContent" readonly="readonly" >${qt.qsContent }</textarea>
</td>
</tr>

<tr>
	<th>답변</th>
	<td>
		<textarea name="Contents" class="w565" style="width : 565px; height: 100px;" id="comment">${cm.qcAnswer }</textarea>
	</td>
</tr>


</tbody></table>

<div class="ASKbtn" id="divWriteForm" style="display:block; margin-left: 33%;" >
<c:if test="${ empty cm.qcAnswer }">
	<span><input type="button" onclick="bt_comment();" value="확인" class="btn btn-danger btn-circle"></span>
</c:if>
<c:if test="${not empty cm.qcAnswer }">
	<span><input type="button" onclick="bt_recomment();" value="수정" class="btn btn-danger btn-circle"></span>
</c:if>
</div>


</body>

<script>

//댓글입력 구현
	const bt_comment =()=>{
		
		let c = window.confirm("입력하시겠습니까?");
		
		let d = {
				qsNo : "${qt.qsNo}",
				qcAnswer : $("#comment").val()
		};
		
		if(c==true){
			//컨펌창이 true이면..(확인시 에이작스 통신)
			$.ajax({
				url : '${path}/adminq/comment.do', 
				data : d,
				dataType : 'json',
				type : 'post',
				success : data =>{
					if(data>0){
						alert("답변입력성공");
						location.replace("${path}/adminq/answerQ.do?qsNo=${qt.qsNo}");
					}else{
						alert("답변입력실패");
					}
				}
					
			});
		}
	}
	
	//답변 수정하기
	const bt_recomment=()=>{
		
		let d = {
				qcNo : "${cm.qcNo}",
				qcAnswer : $("#comment").val()
		};
		
		$.ajax({
			url : '${path}/adminq/updateComment.do',
			data : d,
			type : 'post',
			success : data=>{
				
				if(data>0){
					alert("답변수정완료!");
					location.replace("${path}/adminq/answerQ.do?qsNo=${qt.qsNo}");
				}else{
					alert("답변수정실패!");
				}
			}
		});
		
	}

		

</script>