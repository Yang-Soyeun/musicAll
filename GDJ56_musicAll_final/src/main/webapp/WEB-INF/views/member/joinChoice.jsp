<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style> -->

<link rel="stylesheet" href="${path }/resources/css/member/joinChoice.css">
<div class="memberContainer">
    </div>
    <div class="contents">
        <div class="contentWrapper joinContent">
            <div class="joinBlock singleBlock" style="margin-top: 100px;">
                <h2 class="title">musicAll 회원가입</h2>
                <p class="text">지금 회원가입 하신 후 musicAll에서 <br>다양한 서비스를 경험해보세요</p>
                <button type="button" class="uBtn point btnJoin" onclick="location.assign('${path}/member/terms.do');" >개인 회원가입</button>
                <div class="snsJoinArea">
                    <div class="listSns">
                        <div class="snsKakao"><a href="javascript:bt_kakao();" class="btnSns snsKakaoBtn"  style="width: 175px;"><span>카카오로 가입</span></a></div>
                    </div>
                    <p class="guideText">SNS계정 회원가입(만 14세 이상 가능)</p>
                </div>
            </div>
          </div>
        </div>
        
        
<script>
	const bt_kakao = function(){
		window.open('${kakaoUrl}', 'kakao_window', 'width=500, height=500, location=no, status=no, scrollbars=yes');
		// location.assign("${path}//member/terms.do");
	}


</script>
