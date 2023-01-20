<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style> -->

<link rel="stylesheet" href="${path }/resources/css/member/join.css">

<div class="memberContainer">
	<div class="contents">
		<div class="contentWrapper registContent">
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputId">아이디</label>
							<div class="inputBox">
								<input type="text" id="member_id" class="inputText" placeholder="6~20자 영문, 숫자" tabindex="1" value="" maxlength="20" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputPw">비밀번호</label>
							<div class="inputBox">
								<input type="password" id="password" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" tabindex="2" value="" maxlength="12" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputPwConfirm">비밀번호 확인</label>
							<div class="inputBox">
								<input type="password" id="password_check" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" tabindex="3" value="" maxlength="12" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputName">이름</label>
							<div class="inputBox">
								<input type="text" id="member_name" class="inputText" tabindex="4" value="">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea emailType">
					<div class="col">
						<div class="uInput">
							<label for="inputEmail">이메일</label>
							<div class="inputBox">
								<input type="text" id="email" class="inputText" tabindex="5" value="">
							</div>
						</div>
					</div>
					<div class="col selectCol">
						<div class="uSelectBox">
							<label>
								<select tabindex="6" id="selectemail">
									<option value="direct">직접입력</option>
									<option value="naver.com">@naver.com</option>
									<option value="hanmail.net">@hanmail.net</option>
									<option value="gmail.com">@gmail.com</option>
									<option value="nate.com">@nate.com</option>
									<option value="hotmail.com">@hotmail.com</option>
								</select>
							</label>
						</div>
					</div>
					<div class="col">
						<div class="uBtnArea">
							<button type="button" class="uBtn borderType">인증번호받기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="uErrorText" style="display: block;"></div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputCellphone">휴대폰</label>
							<div class="inputBox">
								<input type="text" id="phone" class="inputText" placeholder="010 1234 5678" tabindex="7" value="">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: none;">점유인증을 하여 휴대폰 번호를 등록해주세요. 등록한 번호는 로그인 이후 변경 가능합니다.</div>
				<div class="accountValiBlock" style="display: none;">
				<div class="accountGuide"></div>
					<p class="blockText">동일 정보로 가입된 계정으로 로그인 하시겠습니까?</p><a href="#" class="btn btnArrow">로그인하기</a>
				</div>
			</div>
			<div class="uBlock" style="display: none;">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputCertifyNum">인증번호</label>
							<div class="inputBox">
								<input type="text" id="inputCertifyNum" class="inputText" tabindex="8" value="">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="uBtnArea">
							<button type="button" class="uBtn borderType">재발송</button>
							<button type="button" class="uBtn borderType">확인</button>
						</div>
					</div>
				</div>
				<div class="certifyTime" style="display: none;">인증유효시간 <span class="time">00:00</span></div>
			</div>
			<div class="ubtnArea row">
				<div class="col text-center">
					<button type="button" class="btn btn-danger btn-circle" onclick="fn_join();">가입완료</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 완료 모달 -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="joinModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="joinModalLabel"><b>회원가입완료</b></h3>
						<h5 class="modal-title" id="joinModalLabel">로그인하시면 더욱 다양한 서비스와 혜택을 제공 받으실 수 있습니다.</h5>
						<!-- <button type="button" class="close" 
						data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>
						</button> -->
					</div>
					<form action="${path }/member/login.do" method="post">
						<div class="modal-footer">
							<button type="submit" class="btn btn-g btn-round"><i class="fa fa-cog fa-spin"></i>로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>

<script>
	
	const fn_join=()=>{
		let d = {
				"member_Id" : $("#member_id").val(),
				"password" : $("#password").val(),
				"name" : $("#member_name").val(),
				"email" : $("#email").val(),
				"phone" : $("#phone").val()
		};
		
		$.ajax({
			url : "${path}/member/joinend.do",
			data : d,
			type : 'POST',
			dataType : "json", 
			success : data=>{
				console.log(data);
				if(data>0){
					$("#joinModal").modal("show");
				}else{
					alert("회원가입에 실패하였습니다. 다시 한번 확인해주세요");
				}
			}
		});
	}
	
	$("#selectemail").on("change",function(){
		const se = $("#selectemail").val();
		if(se!="direct"){
			let email = $("#email").val().split("@")[0];
			$("#email").val(email + "@" + se);
		}
	});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>