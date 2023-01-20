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