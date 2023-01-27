<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  <!-- plugins:css -->
  <link rel="stylesheet" href="${path }/resources/css/admin/vendors/feather/feather.css">
  <link rel="stylesheet" href="${path }/resources/css/admin/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path }/resources/css/admin/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${path }/resources/css/admin/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${path }/resources/css/admin/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${path }/resources/js/admin/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path }/resources/css/admin/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path }/resources/images/favicon.png" />

<style>
	.card-body {margin: 8%; margin-bottom: -13%;}
	/* .col-sm-3 {width: 22%;} */
	.col-lg-3 {width: 21%;}
	.col-md-4 {width: 31.33333333%; padding: 3%;  border-radius: 30px; font-size: 1px; text-align: center;
				background-color: #b5b5b51a; margin: 1%;}
	
	.card-body-1 {margin: 8%;}
	.h2 {color: #d73535;}
	.btn {padding: 8px 14px;}
</style>

<body>
  <div class="container">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.html"></a>
		
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
  
        <ul class="navbar-nav navbar-nav-right">
        
          <li class="nav-item nav-profile dropdown">
              <a class="dropdown-item" onclick="location.replace('${path }/member/logout.do')" >
                <i class="ti-power-off text-primary"></i>
               Logout
              </a>
           </li>
        </ul> 
      </div>
          
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </nav>
    </div>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
     
            <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 11 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
              <p class="text-gray mb-0">The total number of sessions</p>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 7 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
              <p class="text-gray mb-0 ">Call Sarah Graves</p>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
               
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
               
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
               
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
               
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">

                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
               
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">공연관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">공연매출</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">굿즈관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic Elements</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">회원관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
             <i class="icon-paper menu-icon"></i>
              <span class="menu-title">1:1 문의</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
               <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
            <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">고객센터</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      	<!-- partial -->
      	<!-- Start Content -->
    <div class="container py-5" >
        <div class="row" >

            <div class="col-lg-3">
                <h1 class="h3 pb-4">태그 검색</h1>
                <!-- <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#"></a></li>
                            <li><a class="text-decoration-none" href="#"></a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                </ul> -->
            </div>

            <div class="col-lg-9">
                <div class="row" >
                    <div class="col-md-4" >
                        <div class="card mb-4 product-wap rounded-0">
                        	<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                   <li><a href="${path }/goods/goodsView.do" class="h3 text-decoration-none">2021 라흐마니노프 가죽 키링</a></li>
                                   
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
	                                
									<div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
		                                   
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
	                                <div class="page-wrapper">
									  <a><button id="addtocart">
										  <span class="cart-item">
										    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
												<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
												<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
										   </span>
									  </button></a>
									</div>
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
      	
      		<button onclick="location.assign('${path}/adminGoods/goodsInsert.do');">굿즈등록</button>
        
        </div>
       
            
          
       

<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script type="text/javascript" src="${path}/resources/js/admin/bootstrap.js"></script> --%>
