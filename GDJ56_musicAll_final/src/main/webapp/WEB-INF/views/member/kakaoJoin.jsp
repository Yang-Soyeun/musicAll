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
							<div class="styleInput"><span class="req">필수입력</span><input id="conInput" type="text" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="아이디"> <span id="conClear" class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none">오류메세지를 노출합니다.</p>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span><input id="conInput" type="text" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="비밀번호"> <span id="conClear" class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none">오류메세지를 노출합니다.</p>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>비밀번호확인</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span><input id="conInput" type="text" name="joinMemId" class="iInput" value="" maxlength="20" placeholder="비밀번호확인"> <span id="conClear" class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none">오류메세지를 노출합니다.</p>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>이름</dt>
						<dd>
							<div class="styleInput"><span class="req">필수입력</span><input id="conInput" type="text" name="joinMemNm" class="iInput" value="${name }" maxlength="20" placeholder="이름"> <span id="conClear" class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none"></p>
							</div>
						</dd>
					</dl>
				</div>
				<div class="memberInfo">
					<dl>
						<dt>이메일</dt>
						<dd>
							<div class="styleInput cols">
								<input type="text" name="joinMemHp" class="iInput" value="" placeholder="이메일">
								<span class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none">오류메세지를 입력합니다.</p>
							</div>
							<div class="buttonBox">
								<button onclick="javascript:certByMpNo()" style="display:block;"><span class="">인증 번호 받기</span></button>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>휴대폰번호</dt>
						<dd>
							<div class="styleInput"><input id="conInput" type="text" name="joinMemNm" class="iInput" value="" maxlength="20" placeholder="휴대폰번호"> <span id="conClear" class="delBtn" style="display: none;"></span>
								<p class="error" style="display: none"></p>
							</div>
						</dd>
					</dl>
				</div>
				<br>
				<p class="joinBtnArea">
					<button type="submit" class="btnRed" onclick="javascript:join('snsJoin'); return false;">가입하기</button>
				</p>
				<!-- 가입 END -->
			</div>
		
		</div>
	</div>
</body>
