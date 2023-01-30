<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link href="${path}/resources/nari1/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${path}/resources/nari1/styles/categories_styles.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<style>
/* 	div.super_container>div{position: relative;} */
/*  	div.super_container div{position: relative;}  */
</style>

<div class="super_container">
	<!-- Main Content -->
	<div class="container">
		<!-- Products -->
		<div class="products_iso">
			<div class="row">
				<div class="col">
	
					<!-- Product Sorting -->
					
					<div class="product_sorting_container product_sorting_container_top">
						<ul class="product_sorting">
							<li>
								<span>Show</span>
								<span class="num_sorting_text">4</span>
								<i class="fa fa-angle-down"></i>
								<ul class="sorting_num">
									<li class="num_sorting_btn"><span>4</span></li>
									<li class="num_sorting_btn"><span>8</span></li>
									<li class="num_sorting_btn"><span>12</span></li>
								</ul>
							</li>
						</ul>
						<div class="pages d-flex flex-row align-items-center">
							<div class="page_current">
								<span>1</span>
								<ul class="page_selection">
									<c:if test="${mCount eq 0 }">
										<li><a href="#">0</a></li>
									</c:if>
									<c:if test="${mCount ne 0 }">
										<c:forEach var="i" begin="1" end="${mCount }" step="1">
											<li><a href="#">${i }</a></li>										
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<div class="page_total"><span>of</span><c:out value="${mCount }"/></div>
							<div id="next_page" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
						</div>
					</div>
	
					<!-- Product Grid -->
					<div id="product-grid" class="product-grid">
						<c:if test="${empty mLike }">
							<div class="product-item men" style="width:100%;cursor: initial;">
								<div class="product_image" style="text-align:center; margin:0 auto; align-items:center;">
									<img src="${path }/resources/images/performance/noLike2.JPG" alt="" style="height:230px;width:25%;">
									<h5 style="color:lightslategray;font-weight: bolder;font-size:14px;">현재 상영중인 공연 중 보고싶은 공연을 "찜"해보세요</h5>
									<button class="btn btn-danger btn-round" type="button" style="margin-top:20px;font-size:14px;"
										onclick="location.assign('${path }/perfor/performanceList.do');">
										<i class="fa fa-thumbs-o-up" style="font-size:16px;"></i> 관심공연 등록하러 가기 
									</button>
								</div>
							</div>
						</c:if>
						<!-- Product 1 -->
						<c:if test="${not empty mLike }">
							<c:forEach var="m" items="${mLike }">
								<div class="product-item men">
									<div class="product discount product_filter">
										<div class="product_image">
											<img src="${path }/resources/images/performance/matilda.gif" alt="">
										</div>
<%-- 										<div class="favorite active" onclick="fn_deleteMlike(${m.get('LM_CODE') },${loginMember.member_No });"></div> --%>
										<div id="heart" class="favorite active" onclick="fn_deleteMlike(${m.get('LM_CODE') },1);"></div>
			
										<div class="product_info">
											<h6 class="product_name"><c:out value="${m.get('M_TITLE') }"/></h6>
										</div>
									</div>
									
									<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
								</div>
							</c:forEach>
						</c:if>
						
						<script>
							function fn_deleteMlike(lmCode,member_No){
								
								console.log($(".product-item"));
								$.get("${path}/mypage/deleteMlike.do?lmCode="+lmCode+"&member_No="+member_No
										,data=>{
											console.log(data);
											if(data!= null){
												location.replace("${path}/mypage/likeMusical.do?No="+member_No);
											}
											
// 											ajax!!!
// 											if(data != null){
												
// 												$(".product-grid").empty();//자식들 지우기
												
// 												for(i=0;i<data.length;i++){
// 													var div1=$("<div>").attr('class','product-item men')[0];
// 													var div2=$("<div>").attr('class','product discount product_filter')[0];
// 													var div3=$("<div>").attr('class','product_image')[0];
// 													var img=$("<img>").attr('src','${path}/resources/images/performance/matilda.gif')[0];
													
// // 													var div4=$("<div>").attr('class','favorite active')[0];
// 													var div4=$("<div class='favorite active' onclick='fn_deleteMlike("+data[i].LM_CODE+","+data[i].MEMBER_NO+");'></div>")[0];
													
// 													var div5=$("<div>").attr('class','product_info')[0];
// 													var h6=$("<h6 class='product_name'>"+data[i].M_TITLE+"</h6>")[0];
// 													var div6=$("<div>").attr('class','red_button add_to_cart_button')[0];
// 													var a=$("<a href='#'>공연정보 보러가기</a>")[0];
												
												
// 													div3.append(img);
// 													div5.append(h6);
// 													div2.append(div3);
// 													div2.append(div4);
// 													div2.append(div5);
// 													div1.append(div2);
// 													div1.append(div6);//div생성
												
													
// 													$(".product-grid").append(div1);											
// 												}
												
												
												
// 											}
										})		
								
							}
						</script>
						
<!-- 						Product 2 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/엘리자벳.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">엘리자벳</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 3 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/드라큘라.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">드라큘라</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 4 -->
<!-- 						<div class="product-item accessories"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/캣츠.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">캣츠</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 5 -->
<!-- 						<div class="product-item women men"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/시카고.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">시카고</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 6 -->
<!-- 						<div class="product-item accessories"> -->
<!-- 							<div class="product discount product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/레베카.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">레베카</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 7 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 8 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 9 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 10 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
						
<!-- 						Product 11 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
	
<!-- 						Product 12 -->
<!-- 						<div class="product-item women"> -->
<!-- 							<div class="product product_filter"> -->
<!-- 								<div class="product_image"> -->
<%-- 									<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt=""> --%>
<!-- 								</div> -->
<!-- 								<div class="favorite active"></div> -->
<!-- 								<div class="product_info"> -->
<!-- 									<h6 class="product_name">백만송이의사랑</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div> -->
<!-- 						</div> -->
					</div>
	
					
					<!-- Product Sorting -->
					<div class="product_sorting_container product_sorting_container_bottom clearfix">
						
						<span class="showing_results">Showing 1–<c:out value="${mCount }"/> of 12 results</span>
						<div class="pages d-flex flex-row align-items-center">
							<div class="page_current">
								<span>1</span>
								<ul class="page_selection">
									<c:if test="${mCount eq 0 }">
										<li><a href="#">0</a></li>
									</c:if>
									<c:if test="${mCount ne 0 }">
										<c:forEach var="i" begin="1" end="${mCount }" step="1">
											<li><a href="#">${i }</a></li>										
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<div class="page_total"><span>of</span><c:out value="${mCount }"/></div>
							<div id="next_page_1" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
						</div>

					</div>
	
				</div>
			</div>
		</div>
<%-- 		<center> --%>
<%-- 			${pageBar }	 --%>
<%-- 		</center> --%>
	</div>
</div>


<%-- <script src="${path}/resources/nari1/js/jquery-3.2.1.min.js"></script> --%>
<%-- <script src="${path}/resources/nari1/styles/bootstrap4/popper.js"></script> --%>
<%-- <script src="${path}/resources/nari1/styles/bootstrap4/bootstrap.min.js"></script> --%>
<%-- <script src="${path}/resources/nari1/plugins/Isotope/isotope.pkgd.min.js"></script> --%>
<script src="${path}/resources/nari1/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<%-- <script src="${path}/resources/nari1/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script> --%>
<script src="${path}/resources/nari1/js/categories_custom.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>