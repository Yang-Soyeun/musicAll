<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>musicAll</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="${path}/resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${path}/resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${path}/resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${path}/resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${path}/resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${path}/resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${path}/resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${path}/resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${path}/resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${path}/resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicons/favicon-16x16.png">
    <!-- <link rel="manifest" href="/manifest.json"> -->
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${path}/resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="${path}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${path}/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${path}/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${path}/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${path}/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${path}/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${path}/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${path}/resources/css/colors/default.css" rel="stylesheet">
    <link rel="stylesheet" href="${path }/resources/css/member/kakaoJoin.css">
    
   <script src="${path}/resources/lib/jquery/dist/jquery.js"></script>
    <script src="${path}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/lib/wow/dist/wow.js"></script>
    <script src="${path}/resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${path}/resources/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${path}/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${path}/resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${path}/resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="${path}/resources/lib/smoothscroll.js"></script>
    <script src="${path}/resources/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${path}/resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${path}/resources/js/plugins.js"></script>
    <script src="${path}/resources/js/main.js"></script>
    
    
</head>

<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<div class="pageWrapper" style="display: block;">
		<div class="contentsWrap">
			<div class="snsjoin">
			<!-- 가입 START --> 
				<div class="joinInfo">
					<p class="kakao">계정으로 인증되었습니다.</p>
					<span class="sTxt">SNS회원은 만 14세 이상만 가입 가능합니다.</span>
				</div>
				<div class="snsJoinInput">
					
					<dl>
						<dt>아이디</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span>
								<input id="member_id" type="text" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="아이디"> 
							</div>
						</dd>
					</dl>
					<div id="iderror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
					<dl>
						<dt>비밀번호</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span>
								<input id="password1" type="password" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="비밀번호"> 
							</div>
						</dd>
					</dl>
					<div id="pwerror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
					<dl>
						<dt>비밀번호확인</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span>
								<input id="passwordCheck" type="password" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="비밀번호확인"> 
							</div>
						</dd>
					</dl>
					<div id="pwcheckerror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
					<dl>
						<dt>이름</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span>
								<input id="member_name" type="text" name="joinMemNm" class="iInput" value="${name }" maxlength="20" placeholder="이름"> 
							</div>
						</dd>
					</dl>
					<div id="nameerror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
					<dl>
						<dt>이메일</dt>
						<dd>
							<div class="styleInput cols">
								<input id="email" type="text" name="joinMemHp" class="iInput" value="${email }" placeholder="이메일" readonly="readonly">
							</div>
						</dd>
					</dl>
					<div id="emailerror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
					<dl>
						<dt>휴대폰번호</dt>
						<dd>
							<div class="styleInput">
								<input id="phone" type="text" name="joinMemNm" class="iInput" value="" maxlength="20" placeholder="휴대폰번호"> 
							</div>
						</dd>
					</dl>
					<div id="pherror" class="error" style="display: block; color:red; font-size:10px;"></div>
					
				<br>
				<p class="joinBtnArea">
					<button type="button" class="btnRed" onclick="javascript:join(); return false;">가입하기</button>
				</p>
				<!-- 가입 END -->
			</div>
		
		</div>
	</div>
	</div>
</body>

<div class="modal fade" id="kajoinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" aria-hidden="true">
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
			<div class="modal-footer">
				<button type="button" class="btn btn-g btn-round" onclick="javascript:joinFinish();"><i class="fa fa-cog fa-spin"></i>로그인</button>
			</div>
		</div>
	</div>
</div>





<script>

	let idValid = false;
	let pwValid = false;
	let nameValid = false;
	
	//이름 정규식
	const du_name = function(){
		 
		 let name1 = $("#member_name").val();
		 var nameRule =  /^[가-힣a-zA-Z]+$/; 
		 
		 let result = nameRule.test(name1.trim());//정규식 결과
		 return result;
	}

	const fn_du_name = function(){
		 let name2 = du_name();
		 if(name2==false){
			 nameValid = false;
			 $("#nameerror").html("한글 또는 영문만 입력해주세요")
		 }else{
			 nameValid = true;
			 $("#nameerror").html("");
		 }
	}

	//이름 유효성검사
	fn_du_name();

	const joinFinish =()=>{
		opener.location.href='${path}/member/login.do'; 
		window.close();
	}

	//회원가입 insert
	const join=()=>{
		
		if(idValid == false){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(pwValid == false){
			alert("비밀번호를 확인해주세요");
			return false;
		}
		if($("#member_name").val() == null || $("#member_name").val() == ""){
			alert("이름을 확인해주세요");
			return false;
		}
		if(phoneCheck() == false){
			alert("전화번호를 확인해주세요");
			return false;
		} 
		
		let d = {
				"member_Id" : $("#member_id").val(),
				"password" : $("#password1").val(),
				"name" : $("#member_name").val(),
				"email" : $("#email").val(),
				"phone" : $("#phone").val()
		};
		
		$.ajax({
			url : "${path}/member/joinend.do",
			data : d,
			dataType : 'json',
			type : 'post',
			success : data =>{
				if(data>0){
					$("#kajoinModal").modal("show");
				}else {
					alert("회원가입에 실패하였습니다. 다시 한번 확인해주세요");
				}
			}
		});
	}
	
	//아이디 정규식
	const du_id = function(){
		let id = $("#member_id").val();
		let idRule = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,20}$/;//아이디 검사 정규식	
	   	let result = idRule.test(id.trim());//정규식 결과
	   	
	   	return result;
	}
	
	//아이디 유효성 이벤트
	$("#member_id").on("keyup",function(){
		let id2 = du_id();
		
		if(id2==false){
			idValid = false;
			$("#iderror").html("영문으로 시작하는 6~20자 영문(소문자), 숫자만 사용 가능합니다.");
		}else{
			idValid = true;
			$("#iderror").html("");
		}
	});
	
 	//아이디 중복확인
	$("#member_id").on("focusout",function(){
		let id1 = $("#member_id").val();
		
		if(du_id()){
			$.ajax({
				url : "${path}/member/idduplicate.do",
				data : {"member_id" : id1},
				type : 'post',
				success : data=>{
					console.log(data);
					if(data == "null"){
						idValid = true;
						$("#iderror").html("사용 가능한 아이디입니다.");
					}else {
						idValid = false;
						$("#iderror").html("이미 사용 중이거나 탈퇴한 아이디입니다.");
					}
				}
			});
		}
	});
	
	
	
	//비밀번호 정규식
	const du_pw = function(id){
		let pw = $("#"+id).val();
		let pwRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;//비밀번호정규식	
	   	
		let result = pwRule.test(pw.trim());//정규식 결과
	   	
	   	return result;
	}
	
	//비밀번호 유효성 이벤트
	$("#password1").on("keyup",function(){
		pwValid = false;
		
		let pw2 = du_pw("password1");
		
		if(pw2==false){
			$("#pwerror").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else {
			$("#pwerror").html("");
		}
	});
	
	 //비밀번호 확인 유효성 이벤트
	$("#passwordCheck").on("keyup",function(){
		let pw3 = du_pw("passwordCheck");
		if(pw3==false){
			pwValid = false;
			$("#pwcheckerror").html("8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.");
		}else{
			let pwcheck1 = $("#password1").val();
			let pwcheck2 = $("#passwordCheck").val();
			
			if(pwcheck1==pwcheck2){
				pwValid = true;
				$("#pwcheckerror").html("비밀번호가 일치합니다.");
			}else{
				pwValid = false;
				$("#pwcheckerror").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			}
		}
	}); 
	 
	 //비밀번호 비밀번호 확인 유효성 
	 $("#passwordCheck, #password1").on("focusout",function(){
		
		let pwcheck1 = $("#password1").val();
		let pwcheck2 = $("#passwordCheck").val();
		
		if(pwcheck1==pwcheck2 && du_pw("passwordCheck") && du_pw("password1")){
			pwValid = true;
			$("#pwcheckerror").html("");
		}else{
			pwValid = false;
			$("#pwcheckerror").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
		}
	}); 
	
	 //이름 유효성
	 $("#member_name").on("keyup", function(){
		 fn_du_name();
	 });
	 
	 //휴대폰 정규식
	 $("#phone").on("keyup",function(){
 		$(this).val( $(this).val().replace(/[^0-9]/g, "")
				.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
				.replace("--", "-") );
	});
	 
	 //휴대폰 유효성 검사
	const phoneCheck = function(){
		 let phone1 = $("#phone").val();
		 let phoneRule = /(^02|^0505|^1[0-9]{3}|^0[0-9]{2})-([0-9]+)-([0-9]{4})$/;
		 let result = phoneRule.test(phone1.trim());
		 
		 return result;
	 }


</script>
