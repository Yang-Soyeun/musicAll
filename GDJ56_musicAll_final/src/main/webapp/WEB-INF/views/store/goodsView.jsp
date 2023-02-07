<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	<link href="${path }/resources/css/store/cart.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	

<link href="${path }/resources/css/store/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/plugins/OwlCarousel2-2.2.1/animate.css">

<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/single_styles.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/single_responsive.css">

<script src="${path }/resources/js/store/single_custom.js"></script>

<style>
	#addtocart, #buy {border: none; background-color: transparent; color: white;}
	.btn {padding: 8px 14px;}
	.addtocart{background-color: transparent; border: none; color: white;}
	.d-flex {display: flex!important;}
	.justify-content-center {justify-content: center!important;}
	.tab_container {margin-left: 10%; margin-right: -14%;}
	#review_form input[type=radio] {display: none;}

</style>
	
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->



<!-- Start Content -->
	<div class="container py-5" style="margin: 8%; margin-left: 14%; width: 70%;">      
   		<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="${path }">Home</a></li>
						<li><a href="${path }/goods/goodsMain.do"><i class="fa fa-angle-right" aria-hidden="true"></i>굿즈 스토어</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>상세 페이지</a></li>
					</ul>
					
					<div id="cart" class="cart" data-totalitems="0" style="float: right; margin-top: -1%; margin-left: 70%;">
					  	<button type="button" class="btn btn-secondary" onclick="location.assign('${path }/goods/goodsCart.do?memberNo=${loginMember.member_No }')">
			                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
							  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
							</svg>
			       		</button>
					</div>
				</div>
				
			</div>
		</div>
		
	
			<c:if test="${not empty img }">
       			<c:forEach var="i" items="${img }">
       				<c:if test="${i.sumImage.equals('ok') }">
						<div class="row">
							<div class="col-lg-7">
								<div class="single_product_pics">
									<div class="row">
										<div class="col-lg-9 image_col order-lg-2 order-1">
											<div class="single_product_image">
												<div class="single_product_image_background" style="background-image:url(${path }/resources/upload/goods/${i.imName})"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-5">
								<div class="product_details">
									<div class="product_details_title">
										<h2><c:out value="${goods.gdName }"/></h2>
										<p><c:out value="${goods.gdCom }"/></p>
									</div>
									<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
										<span class="ti-truck"></span><span>현장 수령</span>
									</div>
									<div class="original_price"><fmt:formatNumber value="${goods.gdPrice }" pattern="#,###" />원</div>
									<div class="product_price"><fmt:formatNumber value="${goods.gdPrice }" pattern="#,###" />원</div>
									<ul class="star_rating">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</ul>
									<div class="product_color">
										<span>예상 적립 포인트:</span>
										<ul>
											<li><fmt:parseNumber value="${goods.gdPrice*0.1 }" pattern="0" integerOnly="true" />P(10%)</li>
										</ul>
									</div>
									<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
										<span>수량: &nbsp;&nbsp;</span>
										<div class="quantity_selector">
											<span class="minus"><i class="fa fa-minus" aria-hidden="true"></i></span>
											<span id="quantity_value">1</span>
											<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
										</div>
										
										<div class="red_button add_to_cart_button">
											<button id="buy" onclick="buyPage()">구매</button>
										</div>
										
										<div class="red_button add_to_cart_button">
											
											<button class="addtocart">add to cart</button>
										</div>
										<!-- <div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div> -->
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>제품 상세</span></li>
							<!-- <li class="tab" data-active-tab="tab_2"><span>Additional Information</span></li> -->
							<li class="tab" data-active-tab="tab_3"><span>상품 후기</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">

					<!-- Tab 상세정보 -->

					<div id="tab_1" class="tab_container active">
						<div class="row">
							<div class="col-lg-5 desc_col">
								<div class="tab_title">
									<h4>Description</h4>
								</div>
							</div>
							
						</div>
						<div class="col-lg-5 offset-lg-2 desc_col" style="width: 82%; display: flex; justify-content: center;">
							<c:if test="${not empty img }">
				       			<c:forEach var="i" items="${img }">
				       				<c:if test="${i.sumImage == null }">
				       					<img src="${path }/resources/upload/goods/${i.imName}">
				       				</c:if>
				       			</c:forEach>
				       		</c:if>
						</div>
					</div>

					
					<!-- Tab 리뷰 -->

					<div id="tab_3" class="tab_container">
						<div class="row">

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews (2)</h4>
								</div>

								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>

								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>

							<!-- Add Review -->

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" name="review_form" method="post" onsubmit="return false;" action="${path }/goods/addReview.do?memberNo=${loginMember.member_No }">
										<div>
										<input type="hidden" name="gdCode" value="${goods.gdCode }">
										</div>
										<div>
											<h1 style="margin-left: 5px;">My rating :</h1><br>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true" id="r1"><input type="radio" name="rating" value="1" id="rate1"></i></li>
												<li><i class="fa fa-star" aria-hidden="true" id="r2"><input type="radio"  name="rating" value="2" id="rate2"></i></li>
												<li><i class="fa fa-star" aria-hidden="true" id="r3"><input type="radio"  name="rating" value="3" id="rate3"></i></li>
												<li><i class="fa fa-star" aria-hidden="true" id="r4"> <input type="radio"  name="rating" value="4" id="rate4"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true" id="r5"><input type="radio" name="rating" value="5" id="rate5"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="review"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" onclick="addReview();" class="red_button review_submit_btn trans_300">등록</button>
										</div>
									</form>
								</div>

							</div>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
   		
   	</div>
   	
   	<!-- script -->
   	<script>
		var $js = jQuery.noConflict();
			
		//장바구니 개수 출력
		var cart = $('#cart');
		var cartTotal = cart.attr('data-totalitems', '${total}');

		//장바구니 클릭 이벤트
	  $('.addtocart').on('click',function(){
		 
		//로그인 x  
		<c:if test="${loginMember==null }">
			alert("로그인 후 이용해주세요.");
		</c:if>
	    
		//로그인 o
		<c:if test="${loginMember!=null }">
		    //var button = $(this);
		    var newCartTotal = ${total} + 1;

		    //장바구니 담기 기능
		    var ctCount = $('#quantity_value').text();
		 
		    $.ajax({
		    	url: "${path}/goods/addCart.do",
		    	data: {"ctCount" : ctCount, "gdCode" : ${goods.gdCode }, "member_no" : ${loginMember.member_No }},
		    	type: "post",
		    	dataType: "json",
		        success: data=>{
		        	
		        	console.log(data);
		        	
		        	if(data=='1') {
		        		
		        		//장바구니에 추가 성공시 애니메이션
		        		//button.addClass('sendtocart');
					    
					    setTimeout(function(){
					      //button.removeClass('sendtocart');
					      //장바구니 개수 변경
					      cart.addClass('shake').attr('data-totalitems', newCartTotal);
					      setTimeout(function(){
					        cart.removeClass('shake');
					        setTimeout(function(){
					        	//성공시
					        	alert("장바구니에 추가하였습니다.");
					        },200)
					      },500)
					    },1000);
		        	} 
				},
				error: function(){
					alert("이미 추가된 상품입니다.");
				}
			});
	    
	    </c:if>
	    
	  });
			
		
		//구매 페이지로 넘기기
		const buyPage=()=>{
			
			var gdCount = $("#quantity_value").text();
			
			//console.log($("#quantity_value").text());
			console.log(gdCount);
			
			$.ajax({
				url: "${path }/goods/goodsPay.do",
				data: {"gdCount" : gdCount, "gdCode" : ${goods.gdCode }, "member_no" : ${loginMember.member_No }},
				type: "post",
				success: function(data) {
					//alert("넘기기 성공")
					location.assign('${path }/goods/goodsPay.do?gdCode='+${goods.gdCode }+'&member_no='+${loginMember.member_No }+'&gdCount='+gdCount);
				},
				error: function(){
					alert("에러")
				}
			});

			
		}
		
		
		
		//별점
		$('i').on('click',function(){
			
			if($(this).attr('id') == 'r1') {
				
				$("input#rate1").attr("checked", "checked");
				
			} else if($(this).attr('id') == 'r2') {
				
				$("input#rate2").attr("checked", "checked");
				
			} else if($(this).attr('id') == 'r2') {
				
				$("input#rate3").attr("checked", "checked");
				
			} else if($(this).attr('id') == 'r4') {
				
				$("input#rate4").attr("checked", "checked");
				
			} else if($(this).attr('id') == 'r5') {
				
				$("input#rate5").attr("checked", "checked");
				
			} 
			
			
			
		});
		
		<c:forEach var='m' items="${mygoods}">
				console.log(${m.gdCode });
			</c:forEach>
			
		//상품평
        const addReview=()=>{
        	
        	var memberNo='${loginMember.member_No}';
        	var my = 0;
        	
        	<c:forEach var='m' items="${mygoods}">
	        	if(${m.gdCode } != ${goods.gdCode }){
					my = 1;
	    		}
        	</c:forEach>	

        	if(memberNo=null){
        		
        		alert("로그인한 회원만 작성가능합니다.");
        		location.assign("${path}/member/login.do");
        		
        	}else{
        		
        		<c:forEach var='m' items="${mygoods}">
        			
        		
        			if(my=1){
        				
        				alert("상품을 구매한 회원만 작성가능합니다.");
	        			return false;
        			
	        		}
        			
        		</c:forEach>	
	        		
	        		
        			
        	}

        }
		
		
	</script>

</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>