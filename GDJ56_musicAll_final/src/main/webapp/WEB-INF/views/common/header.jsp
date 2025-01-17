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
    <link rel="icon" href="${path}/resources/images/favicons/logo.png">
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
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="${path }">musicAll</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
         
              <li class="dropdown"><a href="${path }/perfor/performanceList.do" >공연</a></li>
              <li class="dropdown"><a href="${path }/booking/bookinglist.do" >예매</a></li>
              <li class="dropdown"><a href="${path }/goods/goodsMain.do" >스토어</a></li>
              <li class="dropdown"><a class="dropdown-toggle" href="${path }/noticeList.do" data-toggle="dropdown">고객센터</a>
              <ul class="dropdown-menu" role="menu">
                     <li><a href="${path }/noticeList.do"><i class="fa fa-list-ul fa-sm"></i>공지사항</a></li>
                     <li><a href="${path }/question/question.do"><i class="fa fa-pencil-square-o"></i> 1:1문의</a></li>
             </ul>
              </li>
         

              <c:if test="${loginMember==null }">
                 <li class="dropdown"><a href="${path }/member/login.do" >로그인</a></li>
                 <li class="dropdown"><a href="${path }/member/joinchoice.do" >회원가입</a></li>
              </c:if>
              <c:if test="${ (loginMember!=null) && (loginMember.member_Id ne 'admin') }"><!-- 일반회원이 로그인을 하면 -->
                 <li class="dropdown"><a class="dropdown-toggle" href="${path }/mypage/mypageMain.do" data-toggle="dropdown">마이페이지</a>
                   <ul class="dropdown-menu" role="menu">
                     <li><a href="#" data-toggle="modal" data-target="#loginModal"><i class="fa fa-cog"></i> 회원정보 수정</a></li>
                     <li><a href="${path }/mypage/musicalList.do"><i class="fa fa-list-ul fa-sm"></i> 공연예매 정보</a></li>
                     <li><a href="${path }/mypage/likeMusical.do"><i class="fa fa-heart"></i> 관심 공연</a></li>
                     <li><a href="${path }/mypage/pointList.do"><i class="fa fa-database"></i> 포인트</a></li>
                     <li><a href="${path }/mypage/shoppingList.do"><i class="fa fa-gift"></i> 상품 구매내역</a></li>
<%--                      <li><a href="${path }/mypage/myContentList.do?No=${loginMember.member_No}"><i class="fa fa-pencil-square-o"></i> 내가 쓴 글</a></li>
 --%>                     <li><a href="${path }/mypage/myContentList.do"><i class="fa fa-pencil-square-o"></i> 내가 쓴 글</a></li>
                     <!-- 현재 페이지 이동시 멤버no값이 보여진다...안보여지게 수정해야한다.. 차차수정방법 예상은 mypage컨트롤러에서 //내가 쓴 글(내 한줄평 + 1대1문의내역 리스트) 이부분 int No로 넘긴것을 자바에서 session에 담긴값을 사용해야할듯! -->  
                   </ul>
                 </li>
                 <li class="dropdown"><a href="${path }/member/logout.do" >로그아웃</a></li>  
              </c:if>
              <c:if test="${(loginMember!=null) && (loginMember.member_Id eq 'admin') }" ><!-- 관리자가 로그인하면-->
               <li class="dropdown"><a href="${path }/admin/adminMain.do" >관리자페이지</a></li>
               <li class="dropdown"><a href="${path }/member/logout.do" >로그아웃</a></li>  
              </c:if>   
            
            </ul>
          </div>
        </div>
      </nav>
      <!-- 하단 메세지 이미지 (로그인시에만 이미지가 보여야함) -->
      <c:if test="${ (loginMember!=null) && (loginMember.member_Id ne 'admin') }">
         <a class="cs-btn" onclick="click_msg_btn();" id="cs_btn">
            <img src="${path}/resources/images/chatting-icon.png" id="cs_btn_img" width="50" height="50">
         </a>
      </c:if>
      </main>


      <!-- 비밀번호 확인창 -->
      <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
      aria-labelledby="loginModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h3 class="modal-title" id="loginModalLabel"><b>회원정보 수정</b></h3>
                  <h5 class="modal-title" id="loginModalLabel">회원 정보 수정을 위해 비밀번호를 다시 입력해주세요.</h5>
               </div>
               <form action="" method="post">
                  <div class="modal-body">
                     <input type="password" name="password" id="memberPwd" class="form-control"
                        placeholder="비밀번호 입력" required>
                     <input type="hidden" name="member_No" id="member_No" value="${loginMember.member_No }">
                        <small><span id="checkPwd" style="color:red; display:none;">잘못된 비밀번호입니다.</span></small>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-g btn-round"
                         onclick="fn_updateMember();"><i class="fa fa-cog fa-spin"></i>확인</button>
                     <button type="button" class="btn btn-g btn-round"
                     data-dismiss="modal">취소</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      

      
      <script>
         const fn_updateMember=()=>{
            $.get("${path}/mypage/checkPwd.do?member_No="+$("#member_No").val()+"&password="+$("#memberPwd").val()
               ,data=>{
                  if(data==null || data==""){//비밀번호 틀리면
                     $("span#checkPwd").show();
                  }else{//비밀번호 일치하면
                     location.replace("${path }/mypage/updateMember.do?member_No="+data.member_No);
                  }
               });
         }
         
         const click_msg_btn=()=>{
            window.open('${path}/chatting/chatList.do', 'chatList_window', 'width=500, height=500, location=no, status=no, scrollbars=yes');
         }
         
      </script>