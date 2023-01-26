<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path}/resources/lib/jquery/dist/jquery.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
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
        </ul>
      </nav>  
		
          <div class="col-md-6 " style="margin-left:200px;" >
              <div class="row">
                <div class="col-md-6 mb-4 stretch-card transparent">
                  <div class="card card-tale5"><br><br><br><br>
                	<img src="${path }/resources/images/reservation/매출.png" width="300px"/>
                	
                	<div id="box">
						
						
						<div style="margin-left:3%"><b>Ⅴ&nbsp;총 예매 건수</b></div><br>
						<div id="count" style="text-align:right;"><b>${count }</b></div><br>
						<div style="margin-left:3%"><b>Ⅴ&nbsp;공연 예매 매출</b></div><br>
						<div id="count" style="text-align:right;"><b><fmt:formatNumber value="${dayPrice }" pattern="###,###"/>원</b></div>
					</div>
					
                  </div>
                </div>
               <div class="col-md-6 mb-4 stretch-card transparent">
                  <div class="card card-tale5"><br><br><br><br>
                	<img src="${path }/resources/images/reservation/누적.png" width="300px"/>
                	
                	<div id="box">
						
						
						<div style="margin-left:3%"><b>Ⅴ&nbsp;총 예매 건수</b></div><br>
						<div id="count" style="text-align:right;"><b>${totalCount }</b></div><br>
						<div style="margin-left:3%"><b>Ⅴ&nbsp;공연 예매 매출</b></div><br>
						<div id="count" style="text-align:right;"><b><fmt:formatNumber value="${totalPrice }" pattern="###,###"/>원</b></div>
					</div>
					
                  </div>
                </div>
              </div>
<canvas id="myChart"></canvas>
	

</div>
</body>
<style>
	.card.card-tale5 {
     background: white; 
     color: black; 
}
	#count{
		width:280px;
	}

	#box{
		width:300px;
		border:1px solid gray;
	}
</style>
<script>
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
var ctx=$("#myChart");
var myChart = new Chart(ctx,{
	type:'bar',
	data:{
		labels:["Red","Blue",getToday()],
		datasets:[{
			label : '# of Votes',
			data:[12,19,3]
		}]
		
		
		
	}
	
});

</script>