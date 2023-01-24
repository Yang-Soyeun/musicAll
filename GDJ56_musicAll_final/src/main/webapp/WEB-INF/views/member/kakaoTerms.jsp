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
    <link rel="stylesheet" href="${path }/resources/css/member/terms.css">
    
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
    </main>


  <div id="__next">
    <div class="memberContainer"></div>
      <div class="contents">
        <div class="contentWrapper termsContent">
          <div class="uCheckbox allAgree"><label><input type="checkbox" id="checkAll"><span class="text">약관 전체 동의</span></label></div>
          <div class="termsBlock">
            <c:if test="${not empty listY }">
            <div class="label">필수 동의 항목</div>

            <c:forEach items="${listY }" var="l" >
            <div class="termsItem">
              <div class="uCheckbox sType"><label><input type="checkbox" class="singleSelector requireSelector"><span
                    class="text"></span></label>
                <div class="checkboxCont"><a href="javascript:window.open('${path}/member/term1.do?term_code=${l.term_code }', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" class="btn btnLink">${l.term_name }</a></div>
              </div>
              </div>
               </c:forEach>
				</c:if>
                </div>
                
	<div class="termsBlock">
		<c:if test="${not empty listN }">
			<div class="label">선택 동의 항목</div>
				<c:forEach items="${listN }" var="li">
					<div class="termsItem">
						<div class="uCheckbox sType"><label><input type="checkbox" class="singleSelector">
							<span class="text"></span></label>
							<div class="checkboxCont"><a href="javascript:window.open('${path}/member/term1.do?term_code=${li.term_code }', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" class="btn btnLink" >${li.term_name }</a></div>
						</div>
					</div>
				</c:forEach>
		</c:if>
	</div>
          <div class="ubtnArea" style="text-align: center;">
            <div class="col"><input type="button" onclick="bt_next();" class="btn btn-danger btn-circle" data-id="nextStep" value="다음단계" ></div>
          </div>
          </div>
        </div>
      </div>
</body>

<script>
	$("#checkAll").on("click",function(){
		if($("#checkAll").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});

	const bt_next = function(){
		
		let c = $("input.requireSelector");//input 클라스에 있는 선택자 c라는 변수에 담기
		
		for(let i=0 ; i<c.length ; i++){//포문돌리고
			
			let m = c[i];//c[i]를 변수에 담아야한다.
			
			if($(m).prop("checked")==false){
				alert("musicAll 이용약관과 개인정보 수집 및 이용에 대한 필수 항목을 모두 동의해주세요.");
				
				return false;//반환하는 이유? 한번만 돌고 끝내기 위해서!
			}
			console.log(c[i]);
		}
		
		location.assign('${path}/member/kakaojoin.do');
	}
	
	$(".singleSelector").on("click",function(){
	//체크박스 갯수는 총 5개이다
	//만약 4개의 체크박스만 체크되어있으면 전체 동의 체크박스는 해제되어야 하며
	//다시 총 5개의 체크박스가 전부 체크되면 전체동의 체크박스는 체크되어야한다.
	//즉 갯수를 중심을 두고 로직을 짜본다!
		
		//체크박스의 갯수를 변수에 담는다.
		let s = $("input.singleSelector").length;
		
		//체크박스 중에서 선택된 애들의 갯수만 가져오기->input.singleSelector:checked 이렇게 작성!!
		let m = $("input.singleSelector:checked").length;
		
		if(s==m){
			$("#checkAll").prop("checked",true);
		} else {
			$("#checkAll").prop("checked",false);
		}
	});
	
	

</script>
