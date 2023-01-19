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
					<p style="font-size:17px;">${loginMember.name }님, 환영합니다.</p>
				</header>
				<section class="tiles">
					<article class="style1">
						<span class="image">
							<img src="${path}/resources/nari2/images/회원정보수정.jpeg"
							 alt="" />
						</span>
						<a href="#" data-toggle="modal" data-target="#loginModal">
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
						<a href="${path }/mypage/pointList.do?No=${loginMember.member_No}">
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
						<a href="${path }/mypage/myContentList.do?No=${loginMember.member_No}">
							<h2>내가 쓴 글</h2>
						</a>
					</article>
				</section>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 확인창 -->
      <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="loginModalLabel"><b>회원정보 수정</b></h3>
						<h5 class="modal-title" id="loginModalLabel">회원 정보 수정을 위해 비밀번호를 다시 입력해주세요.</h5>
						<!-- <button type="button" class="close" 
						data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>
						</button> -->
					</div>
					<form action="" method="post">
						<div class="modal-body">
							<input type="password" name="userPwd" class="form-control"
								placeholder="비밀번호 입력" required>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-g btn-round"><i class="fa fa-cog fa-spin"></i>확인</button>
							<button type="button" class="btn btn-g btn-round"
							data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>