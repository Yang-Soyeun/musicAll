<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 /비밀번호 찾기</title>
<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="${path }/resources/css/member/findId.css">
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
    <link href="${path}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
</head>

<style>

#timeline {
  position: absolute;
  top: 12px;
  right: 10px;
  z-index: 2;
  display: inline-block;
  line-height: 11px;
  font-size: 11px;
  color: #ef3e42;
}

#renumber{
	padding-right: 10px;
    font-size: 13px;
    color: #707070;
    text-align:center;
    
}
</style>

<body>

<input type="hidden" id="gbn" value="${gbn}"/>

<div id="searchWrap">
	<div class="contentsWrap">
		<div class="searchTab">
			<ul>
				<li class="current" id="idsearchWrapli">
					<a href="javascript:chagePage('idsearchWrap');">아이디 찾기</a>
				</li>
				<li class="" id="pwsearchWrapli">
					<a href="javascript:chagePage('pwsearchWrap');">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<div id="idsearchWrap">
			<div class="searchType">
					<div class="typeList current">
						<div class="inputEnter">
							<div class="inputBox">
								<div class="styleInput">
									<input name="memNm" id="name" type="text" class="iInput" placeholder="이름">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput">
									<input name="memEmail1" id="email" type="text" class="iInput" placeholder="이메일">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
							</div>
							<p class="error" style="display:none;" id="errormsg"></p>
							<div class="btnArea">
								<input type="button" onclick="bt_findid();" class="btnRed" value="확인">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="pwsearchWrap" style="display:none">
			<p style="color:#707070;">본인확인 후 비밀번호를 다시 설정할 수 있습니다</p>
			<div class="searchType">
					<div class="typeList current">
						<div class="inputEnter">
							<div class="inputBox">
								<div class="styleInput">
									<input name="memNm" id="memberid" type="text" class="iInput" placeholder="아이디">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput">
									<input name="memNm" id="name1" type="text" class="iInput" placeholder="이름">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div class="styleInput">
									<input name="memEmail1" id="email1" type="text" class="iInput" placeholder="이메일">
									<span id="conClear" class="delBtn" style="display: none;"></span>
								</div>
								<div id="message" style="color:red;"></div>
								<div class="styleInput" id="confNum">
									<input id="certSeq2" type="text" class="iInput" inputmode="numeric" placeholder="인증번호 6자리" style="display: none;"> 
									<span class="time" id="timeline"></span>
									<input type="hidden" id="hidenum">
								</div>
							</div>
							<div class="btnArea" style="">
								<input type="button" onclick="bt_findpw();" class="btnRed" id="number" style="display: block;" value="인증번호 전송">
								<input type="button" onclick="bt_findEndpw();" class="btnRed" id="find" value="비밀번호 찾기" style="display:none;">
							</div>
							<p class="numResend">
								<a href="javascript:bt_findpw();" id="renumber" style="display:none;">인증번호 재전송</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="idsearchWrap" id="repassword" style="display:none;">
					<div class="pwResetBox">
						<h4>비밀번호 재설정</h4>
						<span class="notiText">비밀번호 재설정을 위한 본인 확인이 완료되었습니다.
							<br>새로운 비밀번호를 등록 후 사용해주세요.</span>
						<div class="resetEnter">
							<dl>
								<dt>아이디</dt>
								<dd id="repwid"></dd>
							</dl>
						<div class="styleInput">
							<input id="conInput" name="pwd" tabindex="1" type="password" class="iInput" placeholder="새 비밀번호">
						</div>
							<div id="repwdMsg" style="display: block; color:red;" ></div>
						<div class="styleInput">
							<input id="conInput2" name="pwd_confirm" tabindex="2" type="password" class="iInput" placeholder="새 비밀번호 확인">
						</div>
							<div id="errormsgRw" style="color:red;"></div>
							<p class="iconInfo" style="display: block; color:#aaa;">비밀번호는 8~12자 이내로 영문(대,소문자), 숫자, 특수문자 3가지 조합 중 2가지 이상을 조합하셔서 만드시면 됩니다.</p>
						</div>
						<div class="btnArea">
							<input type="button" onclick="javascript:updateMemPwd(); return false;" class="btnRed" value="변경">
							<input type="hidden" id="hidepw">
							
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
				<h3 class="modal-title" id="joinModalLabel"><b>아이디 찾기</b></h3>
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
//클릭시 탭 이동
	$(function(){
		init();
	});

	const init=()=> {
		let gbn = $("#gbn").val();
		if(gbn == "id") {
			chagePage('idsearchWrap');
		}else{
			chagePage('pwsearchWrap');
		}
	}

//팝업창 닫기
	const closepop=()=>{
		window.close();
	}
	
//탭이동(아이디찾기)
	const chagePage=(id)=>{
		if('idsearchWrap'==id){
			$("#idsearchWrap").show();
			$("#idsearchWrapli").addClass("current");
			$("#pwsearchWrap").hide();
			$("#pwsearchWrapli").removeClass("current");

		}else{
			$("#pwsearchWrap").show();
			$("#pwsearchWrapli").addClass("current");
			$("#idsearchWrap").hide();
			$("#idsearchWrapli").removeClass("current");
			
		}
	}
	
	
	//아이디찾기 구현
	const bt_findid=()=>{
		let d ={
				"name":$("#name").val(),
				"email":$("#email").val()
		};
		//아이디찾기 빈칸일경우 유효성검사
		//변수선언
		const mn = $("#name").val();
		const me = $("#email").val();
		if(mn=="" || mn==null){
			$("#errormsg").show();
			$("#errormsg").html("이름을 입력해주세요");
		}else if (me=="" || me==null){
			$("#errormsg").show();
			$("#errormsg").html("이메일을 입력해주세요");
		}else{
			$.ajax({
				url:"${path}/member/findidEnd.do",
				data:d,
				type:'POST',
				success:data=>{
					console.log(data);
					if(data==""){
						$("#errormsg").show();
						$("#errormsg").html("입력하신 이름, 이메일과 일치하는 ID가 없습니다.");
					}else{
						$("#findModalLabel").html("당신의 아이디는 " + data + "입니다.");
						$("#joinModal").modal("show");
						
					}
				}
			});
		}
	}
	
	let AuthTimer;
	//비밀번호 찾기 구현
	const bt_findpw=()=>{
		
		let m ={
				"member_Id" : $("#memberid").val(),
				"name" : $("#name1").val(),
				"email" : $("#email1").val()
		};
		//아이디찾기 빈칸일경우 유효성검사
		//변수선언
		$.ajax({
			url:"${path}/member/findpwEnd.do",
			data:m,
			type:'POST',
			dataType:'json',
			success:data=>{
				console.log(data);
				if(data=="false"){
					$("#message").html("입력하신 정보와 일치하는 회원이 없습니다.재시도해주세요.");
				}else{
					$("#message").html("");
					alert("입력하신 이메일로 인증번호가 발송 되었습니다.");
					$("#certSeq2").show();
					$("#confNum").show();
					$("#renumber").show();
					$("#find").show();
					$("#number").hide();
					
				//인증번호 시간타이머 사용법
				  AuthTimer = new timer();
				  AuthTimer.fnStop();
				  AuthTimer.comSecond = 60;
				  AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
				  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
				  AuthTimer.domId = document.getElementById("timeline");
				  
				  //보낸 인증번호와 내가 입력한 인증번호가 일치한지여부
				  //->보낸인증번호를 input hidden에 저장하기 그런다음 비교 가능
				 $("#hidenum").val(data.number); //히든에 data값=인증번호를 넣어 줫음
				 $("#repwid").html(data.member_id);//제이슨으로 넘긴 아이디값 넣어주기
				}
			}
		});
	}
	
	//비밀번호 정규식
	const repwCheck = function(id){
		let pw = $("#"+id).val();
		let pwRule = /^(?=.*[a-zA-Z가-힣ㄱ-ㅎ])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;//비밀번호정규식	
	   	console.log(pw);
		let result = pwRule.test(pw.trim());//정규식 결과
	   	console.log(result);
	   	return result;
	}
	
	//비밀번호 확인 유효성
	$("#conInput").on("keyup",function(){
		let pw = repwCheck("conInput");
		console.log(pw);
		if(pw==false){
			$("#repwdMsg").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else {
			$("#repwdMsg").html("")
		}
	});
	
	//비밀번호 확인 유효성 이벤트
	$("#conInput2").on("keyup",function(){
		let pw2 = repwCheck("conInput2");
		if(pw2==false){
			$("#errormsgRw").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else{
			let repw1 = $("#conInput").val();
			let repw2 = $("#conInput2").val();
			
			if(repw1 == repw2){
				$("#errormsgRw").html("비밀번호가 일치합니다.");
				
			}else{
				$("#errormsgRw").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
			}
		}
	});
	
	
	//비밀번호 찾기 버튼을 클릭시 비번 재설정
	const bt_findEndpw=()=>{
		let one = $("#certSeq2").val();//입력한 인증번호
		let two = $("#hidenum").val();//보내진 인증번호
		if(one==two){
			AuthTimer.fnStop();//타이머가 확인 눌렀을 경우 끊어져야함!
			$("#repassword").show();
			$("#pwsearchWrap").hide();
		}
	}
	
	//비밀번호 재설정 완료
	const updateMemPwd=()=>{
		let p1 = $("#conInput").val();//새로운비번
		let p2 = $("#conInput2").val();//확인비번
		
		let d = {
				"newPw" : p1,
				"repwid" : $("#repwid").html() 
		};
		
		let p3 = repwCheck("conInput");
		let p4 = repwCheck("conInput2");
		
		if(p1==p2 && p3 && p4){
			//새로운 비번과 확인비번이 같으면 hidden에 넣어주기->DB에 넘기기 위해서
			$.ajax({
				url:"${path}/member/repassword.do",
				data:d,
				type:'post',
				success:data=>{
					if(data>0){
						alert("비밀번호 재설정이 완료되었습니다. 다시 로그인 해주세요");
						closepop();
					}
				}
			});
		}else{
			$("#conInput2").focus();
		}
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
	            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.")
	        }
	    }
	    ,fnStop : function(){
	        clearInterval(this.timer);
	    }
	}
	
	
</script>

</body>
</html>