<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/nari2/assets/css/main.css" />
<style>
    #wrapper h2{color: white;}
</style>
    <!-- Wrapper -->
	<div class="is-preload" id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1 style="margin-top:70px;"> </h1>
					<p style="font-size:17px;">홍나리님, 환영합니다.</p>
				</header>
				<section class="tiles">
					<article class="style1">
						<span class="image">
							<img src="${path}/resources/nari2/images/회원정보수정.jpeg"
							 alt="" />
						</span>
						<a href="generic.html">
							<h2>회원정보수정</h2>
						</a>
					</article>
					<article class="style6">
						<span class="image">
							<img src="${path}/resources/nari2/images/공연정보2.jpeg" alt="" />
						</span>
						<a href="${path }/mypage/musicalList.do">
							<h2>공연예매정보</h2>
						</a>
					</article>
					<article class="style4">
						<span class="image">
							<img src="${path}/resources/nari2/images/관심공연.jpeg" alt="" />
						</span>
						<a href="${path }/mypage/likeMusical.do">
							<h2>관심공연</h2>
						</a>
					</article>
					<article class="style4">
						<span class="image">
							<img src="${path}/resources/nari2/images/포인트.webp" alt="" />
						</span>
						<a href="${path }/mypage/pointList.do">
							<h2>포인트</h2>
						</a>
					</article>
					<article class="style5">
						<span class="image">
							<img src="${path}/resources/nari2/images/구매내역.jpeg" alt="" />
						</span>
						<a href="${path }/mypage/shoppingList.do">
							<h2>상품구매내역</h2>
						</a>
					</article>
					<article class="style1">
						<span class="image">
							<img src="${path}/resources/nari2/images/나의글모음.webp" alt="" />
						</span>
						<a href="${path }/mypage/myContentList.do">
							<h2>내가 쓴 글</h2>
						</a>
					</article>
				</section>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>