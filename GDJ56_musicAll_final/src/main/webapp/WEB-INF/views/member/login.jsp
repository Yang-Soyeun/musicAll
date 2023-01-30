<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- 나의 스타일 추가 -->
    <link rel="stylesheet" href="${path }/resources/css/member/login.css">

  </head>
  <body class="text-center">
    
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container" style="margin-top: 250px">
      <!--  login 폼 영역을 : loginBox -->
      <div id="loginBox">
      
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle">musicAll Login</div>
        <!-- 아이디, 비번, 버튼 박스 -->
	        <div id="inputBox">
	          <div class="input-form-box"><span class="h6">아이디 </span><input type="text" id="memberId" class="form-control"></div>
	          <div class="input-form-box"><span class="h6">비밀번호 </span><input type="password" id="password" class="form-control"></div>
	          <div id="login_result" style="color:red;"></div>
	          <div class="button-login-box" >
	            <input id="tryEnter" type="button" class="btn btn-danger btn-circle" style="width:100%" value="로그인" onclick="fn_loginresult();">
	          </div>
	        </div>
	        <div class="snsLoginWrap">
                <a href="javascript:bt_kakao();" class="openid kakao" >
                	<img src="${path }/resources/images/kakao_login_medium_narrow.png">
                </a>
                <p class="caution">개인정보 보호를 위해 공용 PC에서 사용 후 SNS 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
            </div>
            <hr style="border-color:black;"/>
            <div class="findInfoWrap">
                <a href="javascript:window.open('${path}/member/findId.do?gbn=id', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" >아이디찾기</a>
                |
                <a href="javascript:window.open('${path}/member/findId.do?gbn=pw', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" >비밀번호찾기</a>
                |
                <a href="javascript:location.assign('${path}/member/joinchoice.do');" >회원가입</a>
            </div>
      </div>
    </div>
 	
 	<script>
	const bt_kakao = function(){
		window.open('${kakaoJoinUrl}', 'kakao_window', 'width=500, height=500, location=no, status=no, scrollbars=yes');
		// location.assign("${path}//member/terms.do");
	}
 	
 	$("#password, #memberId").on("keyup",function(e){
 		if(e.keyCode == '13'){
 			$("#tryEnter").click();
 		}
 	});
 	
 	const fn_loginresult=()=>{
			let d = {
					"memberId" : $("#memberId").val(),
					"memberPw" : $("#password").val()
			};
			let id = $("#memberId").val();
			let pw = $("#password").val();
			if(id==null || id=="" ){
				$("#login_result").html("아이디를 입력해주세요");
			}else if(pw==null || pw==""){
				$("#login_result").html("비밀번호를 입력해주세요");
			}else{
 			$.ajax({
 				url:"${path}/member/loginEnd.do",
 				data:d,
 				dataType:"json",
 				type:'POST',
 				success:data=>{
 					console.log(data);
 					if(data==false){
 						$("#login_result").html("아이디 또는 비밀번호를 잘못 입력하셨습니다.");	
 					}else{
 						location.assign("${path}/");
 					}
 				}
 				
 			});
			}
		}
 	
 	
 	
 	</script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
  </body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>