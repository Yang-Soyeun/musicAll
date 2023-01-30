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
<td><input name="Title" type="text" class="txt w565" value="${qt.qsTitle }" maxlength="200" id="qsTitle" ></td>
</tr>

<tr>
<th>
	<img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask3.gif" alt="유형">
</th>
<td>
	
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="예매문의" <c:if test="${qt.qsHeadTitle eq '예매문의'}">checked</c:if> > 예매문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="공연문의" <c:if test="${qt.qsHeadTitle eq '공연문의'}">checked</c:if>> 공연문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="취소/환불/발권" <c:if test="${qt.qsHeadTitle eq '취소/환불/발권'}">checked</c:if>> 취소/환불/발권</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="포인트문의" <c:if test="${qt.qsHeadTitle eq '포인트문의'}">checked</c:if>> 포인트문의</span>
	<span class="radiocheck" style="display:"><input name="qsHeadTitle" type="radio" value="기타" <c:if test="${qt.qsHeadTitle eq '기타'}">checked</c:if>> 기타</span>
	
</td>
</tr>

<tr>
	<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask9.gif" alt="답변현황"></th>
	<td>${qt.qsResult }</td>
</tr>

<tr>
	<th><img src="//ticketimage.interpark.com/TicketImage/Customer/txt_ask5.gif" alt="내용" ></th>
<td>
	<textarea name="Contents" class="w565" style="width: 565px; height: 320px;" id="qsContent" >${qt.qsContent }</textarea>
</td>
</tr>
</tbody></table>

<div class="ASKbtn" id="divWriteForm" style="display:block; margin-left: 33%;" >
	<span><input type="button" onclick="javascript:CheckWriteForm();" value="수정" class="btn btn-danger btn-circle"></span>
	<span><input type="button" onclick="javascript:DeleteForm();" value="삭제" class="btn btn-danger btn-circle"></span>
	<span><input type="button" onclick="location.assign('${path}/mypage/myContentList.do');" value="목록" class="btn btn-danger btn-circle"></span>
</div>

</body>

<script>
	const CheckWriteForm = function(){
		let a = $("#qsTitle").val();
		let b = $('input[name=qsHeadTitle]:checked').val();
		let c = $("#qsContent").val();
		
		if(a!=null && b!=null && c!=null){
			let c = confirm("글을 수정하시겠습니까?");
			
			let d = {
					"qsNo" : '${qt.qsNo}',
					"qsTitle" : $("#qsTitle").val(),
					"qsHeadTitle" : $('input[name=qsHeadTitle]:checked').val(),
					"qsContent" : $("#qsContent").val()
			};
			
			if(c==true){
				$.ajax({
					url:"${path}/question/updateQ.do",
					data:d,
					dataType:'json',
					type:'post',
					success:data=>{
						console.log(data);
						if(data>0){
							alert("수정이 완료되었습니다.");
							location.href ="${path}/mypage/myContentList.do" ; 
						}
					}			
				});
			}
			
		}else{
			alert("값을 입력해주세요");
		}
	}
	
	const DeleteForm=()=>{
		
		let d = {
				"qsNo" : '${qt.qsNo}'
		}
		
		let delConfirm = confirm("문의를 삭제하시겠습니까?");
		if(delConfirm){
			$.ajax({
				url : '${path}/question/deleteQ.do',
				data : {"qsNo" : '${qt.qsNo}'},
				type : 'post',
				success : data=>{
					if(data>0){
						alert("글 삭제가 완료되었습니다.");
						location.href ="${path}/mypage/myContentList.do";
					}
				}
			});
		}
	}
		

</script>