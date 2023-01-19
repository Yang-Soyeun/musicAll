<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<style>
	.card-body {margin: 8%; margin-bottom: -13%;}
	/* .col-sm-3 {width: 22%;} */
	.col-lg-3 {width: 21%;}
	.col-md-4 {width: 31.33333333%; padding: 3%;  border-radius: 30px; font-size: 1px; text-align: center;
				background-color: #b5b5b51a; margin: 1%;}
	
	.card-body-1 {margin: 8%;}
	.h2 {color: #d73535;}
	
	*,*:before,*:after {
		  box-sizing:border-box;
		}
		
	.page-wrapper {
	  min-height:100%;
	  display:flex;
	  align-items:center;
	  justify-content:center;
	  button {
	    padding:20px;
	    border:none;
	    background:lighten(#292d48,65);
	    position:relative;
	    outline:none;
	    border-radius:5px;
	    color:#292d48;
	    font-size:18px;
	    .cart-item {
	      position:absolute;
	      height:24px;
	      width:24px;
	      top:-10px;
	      right:-10px;
	      &:before {
	        content:'1';
	        display:block;
	        line-height:24px;
	        height:24px;
	        width:24px;
	        font-size:12px;
	        font-weight:600;
	        background:#2bd156;
	        color:white;
	        border-radius:20px;
	        text-align:center;
	      }
	    }
	    &.sendtocart {
	      .cart-item {
	        display:block;
	        animation: xAxis 1s forwards cubic-bezier(1.000,0.440,0.840,0.165);
	        &:before {
	          animation: yAxis 1s alternate forwards cubic-bezier(0.165, 0.840, 0.440, 1.000);
	        }
	      }
	    }
	  }
	}

.cart {
  
  top:20px;
  right:20px;
  width:50px;
  height:50px;
  
  align-items:center;
  justify-content:center;
  border-radius:5px;
  i {
    font-size:25px;
    color:white;
  }
  &:before {
    content:attr(data-totalitems);
    font-size:12px;
    font-weight:600;
    position:absolute;
    top:-12px;
    right:-12px;
    background:#2bd156;
    line-height:24px;
    padding:0 5px;
    height:24px;
    min-width:24px;
    color:white;
    text-align:center;
    border-radius:24px;
  }
  &.shake {
    animation: shakeCart .4s ease-in-out forwards;
  }
}

@keyframes xAxis {
  100% {
    transform: translateX(calc(50vw - 105px));
  }
}

@keyframes yAxis {
  100% {
    transform: translateY(calc(-50vh + 75px));
  }
}

@keyframes shakeCart {
  25% {
    transform:translateX(6px)
  }
  50% {
    transform:translateX(-4px);
  }
  75% {
    transform:translateX(2px);
  }
  100% {
    transform:translateX(0);
  }
}
</style>
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->



<!-- Start Content -->
    <div class="container py-5" style="margin: 8%; margin-left: 14%; width: 70%;">
        <div class="row" style="width: 106%; margin-left: -6%;">

            <div class="col-lg-3">
                <h1 class="h3 pb-4">카테고리</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Gender
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Men</a></li>
                            <li><a class="text-decoration-none" href="#">Women</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Sale
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Product
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h5 text-dark text-decoration-none mr-3" href="#">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h5 text-dark text-decoration-none mr-3" href="#">낮은 가격순 ↓</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h5 text-dark text-decoration-none" href="#">높은 가격순 ↑</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex">
                            <select class="form-control">
                                <option>바로 가기</option>
                                <option>장바구니</option>
                                <option>구매내역</option>
                            </select>
                        </div>
                        
                    </div>
                </div>
               <div id="cart" class="cart" data-totalitems="0">
						  <button type="button" class="btn btn-secondary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>
              </button>
						</div>
                
                <div class="row" >
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <!-- <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li> -->
		                                   <!-- <a class="" href="shop-single.html"> -->
		                                      <!-- <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg> -->
												<div class="page-wrapper">
												  <button id="addtocart">
												    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
												    <span class="cart-item"></span>
												  </button>
												</div>
		                                   <!-- </a> -->
	                               <!--       </li>
	                                </ul> -->
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    
                   <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                   <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="shop-single.html" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
                                </ul>
                            </div>
                            <div class="card rounded-0" >
                               <img src="${path }/resources/images/store/goods.jpg" id="countimg1" style="width: 250px;height: 300px;">
                            </div>
                            
                            <div class="card-body">
                            
                            	<div class="card-body-1">
                                	<a href="shop-single.html" class="h2 text-decoration-none">15,000원</a>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="h5 text-decoration-none">#라흐마니노프</li>
	                                    
	                                </ul>
                                </div>
                                
                                <div class="card-body-1">
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	 									<li>
		                                   <a class="" href="shop-single.html">
		                                      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
													<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
													<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
												</svg>
		                                   </a>
	                                     </li>
	                                </ul>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    
                <div div="row">
                    <ul class="pagination pagination-lg justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>
                        </li>
                    </ul>
                    <a href="#" class="btn btn-sm btn-danger btn-lg-square back-to-top" style="float: right; margin-top: 2%;"><i class="bi bi-arrow-up"></i></a>
                </div>
            </div>

        </div>
        
    </div>
    </div>
    <!-- End Content -->

<!-- 스크립트 -->
	<script>
			$(document).ready(function(){
			  $('#addtocart').on('click',function(){
			    
			    var button = $(this);
			    var cart = $('#cart');
			    var cartTotal = cart.attr('data-totalitems');
			    var newCartTotal = parseInt(cartTotal) + 1;
			    
			    button.addClass('sendtocart');
			    setTimeout(function(){
			      button.removeClass('sendtocart');
			      cart.addClass('shake').attr('data-totalitems', newCartTotal);
			      setTimeout(function(){
			        cart.removeClass('shake');
			      },500)
			    },1000)
			  })
			});
	</script>


    


    <!-- Back to Top -->
    


    <!-- JavaScript Libraries -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script> -->

    <!-- Template Javascript -->
    <!-- <script src="js/main.js"></script> -->
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>