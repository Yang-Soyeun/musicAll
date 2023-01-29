<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>


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
								<input type="text" id="member_id" class="inputText" placeholder="6~20자 영문, 숫자" 
								tabindex="1" value="${mem.member_Id }" maxlength="20" readonly>
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
								<input type="password" id="password" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" 
								tabindex="2" value="" maxlength="12" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;" id="pwMsg"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputPwConfirm">비밀번호 확인</label>
							<div class="inputBox">
								<input type="password" id="password_check" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" 
								tabindex="3" value="" maxlength="12" required="required">
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block; color:#dc941b;" id="pwMsg2"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputName">이름</label>
							<div class="inputBox">
								<input type="text" id="member_name" class="inputText" tabindex="4" value="${mem.name }">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="uBlock">
				<div class="uInputArea emailType">
					<div class="col">
						<div class="uInput">
							<label for="inputEmail">이메일</label>
							<div class="inputBox">
								<input type="text" id="email" class="inputText" tabindex="5" value="${mem.email }">
							</div>
						</div>
					</div>
					<div class="col selectCol">
						<div class="uSelectBox">
							<label>
								<select tabindex="6" id="selectemail">
									<option value="direct">직접입력</option>
									<option value="naver.com" ${mem.email.split('@')[1].contains('naver')?'selected':'' }>@naver.com</option>
									<option value="hanmail.net" ${mem.email.split('@')[1].contains('hanmail')?'selected':'' }>@hanmail.net</option>
									<option value="gmail.com" ${mem.email.split('@')[1].contains('gmail')?'selected':'' }>@gmail.com</option>
									<option value="nate.com" ${mem.email.split('@')[1].contains('nate')?'selected':'' }>@nate.com</option>
									<option value="hotmail.com" ${mem.email.split('@')[1].contains('hotmail')?'selected':'' }>@hotmail.com</option>
								</select>
							</label>
						</div>
					</div>
					<div class="col">
						<div class="uBtnArea">
							<input type="button" class="uBtn borderType" value="인증번호받기" onclick="bt_email()"/>
						</div>
					</div>
				</div>
			</div>
			<div class="uErrorText" style="display: block; color : #dc941b;" id="emailMsg"></div>
			
			<div class="uBlock" style="display: none;" id="checknum">
				<div class="uInputArea">
				<div class="col">
					<div class="uInput">
						<label for="inputCertifyNum">인증번호</label>
						<div class="inputBox">
							<input type="text" id="inputCertifyNum" class="inputText" value="" tabindex="8" placeholder="인증번호 6자리">
							<input type="hidden" id="hideconfirmNum">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="uBtnArea">
						<input type="button" class="uBtn borderType" value="재발송" id="reSend" onclick="bt_email()"/>
						<input type="button" class="uBtn borderType" value="확인" id="checkNum2" >
						<button type="button" class="uBtn borderType" style="display:none;" id="ok">인증완료</button>
					</div>
				</div>
				</div>
					<div class="certifyTime" style="display: block;" id="timeSecond">인증유효시간 <span class="time" id="timeline"></span>
				</div>
			</div>
			
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputCellphone">휴대폰</label>
							<div class="inputBox">
								<input type="text" id="phone" class="inputText" placeholder="010 1234 5678" tabindex="7" value="${mem.phone }" maxlength="13">
							</div>
						</div>
					</div>
				</div>
				<div id="errorPh" style="display: block; color : #dc941b;"></div>
			</div>
			
			<div class="ubtnArea row">
				<div class="col text-center" style="min-height: auto;">    
					<button type="button" class="btn btn-danger btn-circle" onclick="fn_update();">변경하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 회원정보 수정 완료 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="joinModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="joinModalLabel"><b>회원정보수정 완료 </b><i class="icon-happy" style="color:seagreen;"></i></h3>
						<h5 class="modal-title" id="joinModalLabel">다시 로그인해주세요.</h5>
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

	let idValid = false;
	let pwValid = false;
	let emailValid = false;

	//회원가입 ajax통신
	const fn_update=()=>{
		
		if(pwValid == false){
			alert("비밀번호를 확인해주세요");
			return false;			
		}
		if($("#member_name").val() == null || $("#member_name").val() == ""){
			alert("이름을 확인해주세요");
			return false;			
		}
		if(emailValid == false){
			alert("이메일 입력 후 인증해주세요");
			return false;			
		}
		if(phoneCheck() == false){
			alert("전화번호를 확인해주세요");
			return false;			
		}

		let d = {
				"member_Id" : $("#member_id").val(),
				"password" : $("#password").val(),
				"name" : $("#member_name").val(),
				"email" : $("#email").val(),
				"phone" : $("#phone").val()
		};
		
		$.ajax({
			url : "${path}/mypage/updateMemberEnd.do",
			data : d,
			type : 'POST',
			dataType : "json", 
			success : data=>{
// 				console.log(data);
				if(data>0){
					$("#updateModal").modal("show");
				}else{
					alert("회원정보 수정에 실패하였습니다. 다시 시도해주세요");
				}
			}
		});
	}
	
	//이메일 종류
	$("#selectemail").on("change",function(){
		emailValid = false;
		const se = $("#selectemail").val();
		if(se!="direct"){
			let email = $("#email").val().split("@")[0];
			$("#email").val(email + "@" + se);
		}
	});
	
	
	//비밀번호 정규식
	const pwCheck = function(id){
		let pw = $("#"+id).val();
		console.log(pw);
		let pwRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;//비밀번호정규식	
	   	
		let result = pwRule.test(pw.trim());//정규식 결과
	   	
	   	return result;
	}
	
	//비밀번호 유효성 이벤트
	$("#password").on("keyup",function(){
		pwValid = false;
		let pw1 = pwCheck("password");//반환값 담아
		if(pw1==false){
			$("#pwMsg").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else{
			$("#pwMsg").html("");
		}
	});
	
	//비밀번호 확인 유효성 이벤트
	$("#password_check").on("keyup",function(){
		let pw2 = pwCheck("password_check");
		if(pw2==false){
			pwValid = false;
			$("#pwMsg2").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else{
			let pwcheck1 = $("#password").val();
			let pwcheck2 = $("#password_check").val();
			
			if(pwcheck1==pwcheck2){
				pwValid = true;
				$("#pwMsg2").html("비밀번호가 일치합니다.");
			}else{
				pwValid = false;
				$("#pwMsg2").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			}
		}
	});
	
	//비밀번호,비밀번호 확인 일치여부
	$("#password_check, #password").on("focusout",function(){
		
		let pwcheck1 = $("#password").val();
		let pwcheck2 = $("#password_check").val();
		
		if(pwcheck1==pwcheck2 && pwCheck("password_check") && pwCheck("password")){
			pwValid = true;
			$("#pwMsg2").html("");
		}else{
			pwValid = false;
			$("#pwMsg2").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
		}
	}); 
	
	//이메일유효성 검사
	//이메일 정규식
	const emailCheck = function(){
		let email = $("#email").val();
		let emailRule = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;//이메일 정규식
	   	
		let result = emailRule.test(email.trim());//정규식 결과
	   	
	   	return result;
	}
// 	타이머 변수
	let AuthTimer = null;
	
	//이메일 인증
	const bt_email=()=>{
		emailValid = false;
		let email = emailCheck();
		let writeE = $("#email").val();
		
		if(email==false){
			$("#emailMsg").html("이메일 주소 양식에 맞게 작성해주세요.");
		}else{
			$.ajax({
				url:"${path}/member/cofirmEmail.do",
				data:{email : $("#email").val()},
				dataType:'json',
				type:'post',
				success:data=>{
					if(data!=null){
					//인증번호 시간타이머 사용법
						AuthTimer = new timer();	
						AuthTimer.fnStop();
						AuthTimer.comSecond = 60;
						AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
						AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
						AuthTimer.domId = document.getElementById("timeline");
					//인증번호 담기
						$("#hideconfirmNum").val(data.number);
					
						$("#emailMsg").html("");
						$("#checknum").show();
					
						alert("입력하신 이메일로 인증번호가 발송 되었습니다.");
					}
				}
			}); 
		}
	}
	
	//인증번호 확인 여부
	$("#checkNum2").on("click",function(){
		let d = $("#hideconfirmNum").val();
		let f = $("#inputCertifyNum").val();
		
		if(d==f){
			emailValid = true;
			alert("인증이 완료되었습니다.");
			$("#ok").show();
			$("#checkNum2").hide();
			$("#reSend").hide();
			AuthTimer.fnStop();
			$("#timeSecond").hide();
			$("#timline").hide();
		}else{
			emailValid = false;
			alert("올바르지 않은 인증번호 입니다.");
		}
	});
	
	//휴대폰 정규식
	$("#phone").on("keyup",function(){
 		$(this).val( $(this).val().replace(/[^0-9]/g, "")
				.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
				.replace("--", "-") );
	});

// 	휴대폰 유효성 검사
	const phoneCheck = function(){
		let phone = $("#phone").val();
		let phoneRule = /(^02|^0505|^1[0-9]{3}|^0[0-9]{2})-([0-9]+)-([0-9]{4})$/;//휴대폰정규식	
		let result = phoneRule.test(phone.trim());//정규식 결과
		return result;
		
	}
	
	//인증번호 타이머
	function timer(){
		
	}
	
	timer.prototype={
		comSecond : ""
		, fnCallback : function(){}
	    , timer : ""
	    , domId : ""
	    , fnTimer : function(){
	    	
	        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
	        this.comSecond--;					// 1초씩 감소
	        console.log(m);
	        this.domId.innerText = m;
	        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
	        	clearInterval(this.timer);		// 타이머 해제
	            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
	        }
	    }
	    ,fnStop : function(){
	        clearInterval(this.timer);
	    }
	}
	
	
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>