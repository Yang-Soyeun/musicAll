<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="${path }/resources/css/member/findId.css">
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
    <link href="${path}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>

<div id="searchWrap">
	<div class="contentsWrap">
		<div class="searchTab">
			<ul>
				<li class="">
					<a href="javascript:egsIncorp.sendEventEgs( 'id_search', 'tap_find_id' ); javascript:changeTab('/member/findId.do?_method=initialPopUp');">아이디 찾기</a>
				</li>
				<li class="current">
					<a href="javascript:egsIncorp.sendEventEgs( 'id_search', 'tap_find_pw' ); javascript:changeTab('/member/findPw.do?_method=initialPopUp');">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<div class="idsearchWrap">
			<div class="searchType">
					<div class="typeList current">
						<div class="title">
							<p>등록된 비밀번호로 찾기</p>
						</div>
						<div class="inputEnter">
							<div class="inputBox">
								<div class="styleInput">
									<input name="memNm" id="memberid" type="text" class="iInput" placeholder="아이디">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput">
									<input name="memNm" id="name" type="text" class="iInput" placeholder="이름">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput">
									<input name="memEmail1" id="email" type="text" class="iInput" placeholder="이메일">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput" id="confNum">
									<span class="time"></span>
									<input id="certSeq2" type="text" class="iInput" inputmode="numeric" placeholder="인증번호 8자리" style="display: none;"> 
								</div>
							</div>
							<p class="error" style="display:none;" id="errormsg"></p>
							<div class="btnArea">
								<input type="button" onclick="bt_findpw();" class="btnRed" value="확인">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="joinModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="joinModalLabel"><b>비밀번호 찾기</b></h3>
				<h5 class="modal-title" id="findModalLabel"></h5>
				<!-- <button type="button" class="close" 
				data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button> -->
			</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-g btn-round" onclick="closepop();" value="확인"/>
				</div>
		</div>
	</div>
</div>

<script>
//팝업창 닫기
	const closepop=()=>{
		window.close();
	}
	
	//아이디찾기 구현
	const bt_findpw=()=>{
		let m ={
				"member_Id" : $("#memberid").val(),
				"name" : $("#name").val(),
				"email" : $("#email").val()
		};
		//아이디찾기 빈칸일경우 유효성검사
		//변수선언
		
		$.ajax({
			url:"${path}/member/findpwEnd.do",
			data:m,
			type:'POST',
			success:data=>{
				/* console.log(data);
				if(data==""){
					$("#errormsg").show();
					$("#errormsg").html("입력하신 이름, 이메일과 일치하는 ID가 없습니다.");
				}else{
					$("#findModalLabel").html("당신의 아이디는 " + data + "입니다.");
					$("#joinModal").modal("show");
				} */
			}
		});
	}
</script>

</body>
</html>