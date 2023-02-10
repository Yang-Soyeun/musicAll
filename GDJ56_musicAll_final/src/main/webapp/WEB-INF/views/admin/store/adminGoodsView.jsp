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
  <link rel="icon" href="${path}/resources/images/favicons/logo.png">

	<style>
		.goodsForm {
			
			justify-content: center;
			margin-left: 18%;
			margin-top: 3%;
			margin-bottom: 3%;
			background: #e5e5e5;
			/* height: 1000px; */
			padding: 4%;
			width: 50%;
			border-radius: 1%;
	}
	
		.goodsAdd{
			display: grid;
			background-color: transparent;
		}
		
		.text-label {
			color: #cdcdcd;
			font-weight: bold;
		}
		
		input[type=text] {
			border: none; 
			width: 40%;
			height: 143%;
		}
	</style>

<body>
 <div class="container">
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
      	
      	<!-- 굿즈 등록 폼 -->
      	<div class="main-panel">
      	
      		<div class="goodsForm">
      			<form id="goodsForm">
				
					<div style="display: flex; justify-content: center; margin-bottom: 3%;"><h3>굿즈 수정</h3></div>
					<hr>
					 
					<div class="goodsAdd">
						<h4>상품명</h4>
						<input type="text" value="${goods.gdName }" title="상품명을 작성해 주세요" id="gName"/>
						 
						<br>
						
						<h4>가격</h4>
						<input type="text" value="${goods.gdPrice }" title="ex) 15,000" id="gPrice"/>
						
						<br>
						
						<h4>상세 내용</h4>
						<textarea style="border: none; height: 100px;" id="gContent"><c:out value="${goods.gdContent }"/></textarea>
						
						<br>
						
						<h4>판매처</h4>
						<input type="text" value="${goods.gdCom }" title="ex) 에이치제이컬쳐 주식회사" id="gCom"/>
						
						<br>
						
						<h4>공연/무</h4>
						<select name="m" id="selectM">
							<c:if test="${goods.MCode == 0 }">
								<option value="관련없음">관련없음</option> 
							</c:if>
							<option value="뮤지컬리스트">뮤지컬리스트</option> 
						</select>
						
						<br>
						
						<h4>입고 수량</h4>
						<div class="quantity_selector">
							<input type="number" value="${goods.gdCount }" id="gCount"/>
						</div>
						
						<br>
						
						<h4>상품 태그</h4>
						<label><input type="radio" name="gTag" id="keyring" value="키링" ${goods.gdTag.equals("키링")?"checked":"" }>&nbsp;키링</label>
						<label><input type="radio" name="gTag" id="tumbler" value="텀블러" ${goods.gdTag.equals("텀블러")?"checked":"" }>&nbsp;텀블러</label>
						<label><input type="radio" name="gTag" id="bag" value="가방" ${goods.gdTag.equals("가방")?"checked":"" }>&nbsp;가방</label>
						<label><input type="radio" name="gTag" id="sticker" value="스티커" ${goods.gdTag.equals("스티커")?"checked":"" }>&nbsp;스티커</label>
						<label><input type="radio" name="gTag" id="book" value="책" ${goods.gdTag.equals("책")?"checked":"" }>&nbsp;책</label> 
						<label><input type="radio" name="gTag" id="b" value="브로치/뱃지" ${goods.gdTag.equals("브로치/뱃지")?"checked":"" }>&nbsp;브로치/뱃지</label> 
						<label><input type="radio" name="gTag" id="magnet" value="마그넷" ${goods.gdTag.equals("마그넷")?"checked":"" }>&nbsp;마그넷</label> 
						<label><input type="radio" name="gTag" id="ost" value="ost앨범" ${goods.gdTag.equals("OST앨범")?"checked":"" }>&nbsp;OST앨범</label>
					
						<hr> 
						
						<h4>대표 사진</h4>
						<input type="file" value="" style="border: none;" name="upFile" onchange="readURL(this);"/>
						<c:forEach var="i" items="${img }">
						<c:if test="${i.sumImage.equals('ok') }">
							<img id="preview" style="width:300px; height: 400px;" src="${path }/resources/upload/goods/${i.imName}"/>
						</c:if>
						</c:forEach>
						
						<br>
						
						<h4>상세 사진</h4>
						<input type="file" value="" style="border: none;" name="upFile2" onchange="readURL2(this);" />
						<c:forEach var="i" items="${img }">
						<c:if test="${i.sumImage == null }">
							<img id="preview2" style="width:300px; height: 600px;" src="${path }/resources/upload/goods/${i.imName}"/>
						</c:if>
						</c:forEach>
			        </div>
			        
			        <div style="margin-top:7%; margin-left: 25%;">
			            <button class="btn btn-danger" style="width:200px; font-size:15px; float:left;" type="button" onclick="g_insert()">수정</button>
			            <button class="btn btn-danger" style="width:200px; font-size:15px; float:left;" type="button" onclick="g_delete()">품절</button>
			            <button class="btn btn-secondary" style="width:110px;background-color:lightgray;color:black;font-size:15px; float:left;">취소</button>
			        </div>
		      	</form>
		        
	        </div>
        
		</div>

	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>


	<script>
	
	
	
	//썸네일
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	        document.getElementById('preview').src = e.target.result;
	        };
	    reader.readAsDataURL(input.files[0]);
	    } else {
	        document.getElementById('preview').src = "";
	    }
	}
	
	//상세정보
	function readURL2(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	        document.getElementById('preview2').src = e.target.result;
	        };
	    reader.readAsDataURL(input.files[0]);
	    } else {
	        document.getElementById('preview').src = "";
	    }
	}
	
	//굿즈 등록 데이터 보내기
	const g_insert=()=>{
		
		var gTag = $("input[type=radio]:checked").val();
		
		//대표 사진
		const upFile=$("input[name=upFile]")[0].files[0];
		//상세 사진
		const upFile2=$("input[name=upFile2]")[0].files[0];
		
		/* if($("#selectM").val() == '관련없음') {
			var mCode = '';
		} else {
			var mCode = '27';
		} */
		
		let form = new FormData();
		
		if($("#selectM").val() != '관련없음') {
		
			var mCode = '27';
			form.append("mCode", mCode);
			
		}
		
		
		
		form.append("gdName", $("#gName").val());
		form.append("gdPrice", $("#gPrice").val());
		form.append("gdContent", $("#gContent").val());
		form.append("gdCom", $("#gCom").val());
		form.append("gdCount", $("#gCount").val());
		form.append("gdTag", gTag);
		form.append("upFile", upFile);
		form.append("upFile2", upFile2);
		

		
		console.log($("#gName").val());
		console.log($("#gPrice").val());
		console.log( $("#gContent").val());
		console.log($("#gCom").val());
		console.log($("#gCount").val());
		console.log(gTag);
		console.log(mCode);
		console.log(upFile);
		console.log(upFile2);
		
		for (var key of form.keys()) {

			  console.log(key);

			}

			for (var value of form.values()) {

			  console.log(value);

			}
		
		$.ajax({
			enctype: 'multipart/form-data',
			url: "${path}/adminGoods/updateGoods.do?gdCode=${goods.gdCode}",
			data: form,
			type: 'post',
			dataType: 'json',
			contentType: false,
	        processData: false,
	        cache:false,
	        success:function(data){
					alert("등록 성공");
					location.replace("${pageContext.request.contextPath}/adminGoods/adgMain.do");
				},
		    error:function(e){
				alert("등록 실패");
				
			}
				
			
		});
		
		
		
	}
	</script>
</body>
</html>