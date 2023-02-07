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
									<form id="review_form" action="post">
										
										<div>
											<h1>Your Rating:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">submit</button>
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

		
		
	</script>

</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>