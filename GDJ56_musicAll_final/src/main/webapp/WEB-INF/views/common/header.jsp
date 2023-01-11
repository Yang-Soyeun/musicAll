<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Drivin - Driving School Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${path}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${path}/resources/css/style.css" rel="stylesheet">
    
    
        <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/lib/wow/wow.min.js"></script>
    <script src="${path}/resources/lib/easing/easing.min.js"></script>
    <script src="${path}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${path}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
</head>

<body>
		    <!-- Spinner Start -->
		    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		        <div class="spinner-grow text-primary" role="status"></div>
		    </div>
		    <!-- Spinner End -->
		    <!-- Navbar Start -->
		    <nav class="navbar navbar-expand-lg navbar-light sticky-top p-0">
		        <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
		            <h2 class="m-0"><img src="${path}/resources/images/logo-removebg-preview.png" width="50" height="50">MusicAll</h2>
		        </a>
		        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		            <span class="navbar-toggler-icon"></span>
		        </button>
		        <div class="collapse navbar-collapse" id="navbarCollapse">
		            <div class="navbar-nav ms-auto p-4 p-lg-0">
		                <a href="index.html" class="nav-item nav-link active">Home</a>
		                <a href="about.html" class="nav-item nav-link">공연</a>
		                <a href="courses.html" class="nav-item nav-link">예매</a>
		                <a href="contact.html" class="nav-item nav-link">스토어</a>
		                <a href="contact.html" class="nav-item nav-link">1:1 문의</a>
		            </div>
		            <a href="" class="btn py-4 px-lg-3 d-none d-lg-block" style="color: #A50000;">로그인<i class="fa fa-arrow-right ms-3"></i></a>
		        </div>
		    </nav>
	    <!-- Navbar End -->