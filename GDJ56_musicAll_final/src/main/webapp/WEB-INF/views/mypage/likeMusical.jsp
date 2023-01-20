<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<link href="${path}/resources/nari1/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<%-- <link rel="stylesheet" type="text/css" href="${path}/resources/nari1/styles/bootstrap4/bootstrap.min.css"> --%>
<link rel="stylesheet" type="text/css" href="${path}/resources/nari1/styles/categories_styles.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>

<div class="super_container">

	

				<!-- Main Content -->

				<div class=" container">

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
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
											</ul>
										</div>
										<div class="page_total"><span>of</span> 3</div>
										<div id="next_page" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
									</div>

								</div>

								<!-- Product Grid -->

								<div class="product-grid">

									<!-- Product 1 -->

									<div class="product-item men">
										<div class="product discount product_filter">
											<div class="product_image">
												<img src="${path }/resources/images/performance/matilda.gif" alt="">
											</div>
											<div class="favorite active"></div>

											<div class="product_info">
												<h6 class="product_name">프랑켄슈타인</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 2 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/엘리자벳.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">엘리자벳</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 3 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/드라큘라.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">드라큘라</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 4 -->

									<div class="product-item accessories">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/캣츠.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">캣츠</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 5 -->

									<div class="product-item women men">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/시카고.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">시카고</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 6 -->

									<div class="product-item accessories">
										<div class="product discount product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/레베카.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">레베카</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 7 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 8 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 9 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 10 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>
									<!-- Product 11 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>

									<!-- Product 12 -->

									<div class="product-item women">
										<div class="product product_filter">
											<div class="product_image">
												<img src="${path}/resources/nari1/images/백만송이의사랑.jfif" alt="">
											</div>
											<div class="favorite active"></div>
											<div class="product_info">
												<h6 class="product_name">백만송이의사랑</h6>
											</div>
										</div>
										<div class="red_button add_to_cart_button"><a href="#">공연정보 보러가기</a></div>
									</div>
								</div>

								<!-- Product Sorting -->

								<div class="product_sorting_container product_sorting_container_bottom clearfix">
									
									<span class="showing_results">Showing 1–3 of 12 results</span>
									<div class="pages d-flex flex-row align-items-center">
										<div class="page_current">
											<span>1</span>
											<ul class="page_selection">
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
											</ul>
										</div>
										<div class="page_total"><span>of</span> 3</div>
										<div id="next_page_1" class="page_next"><a href="#"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<script src="${path}/resources/nari1/js/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/nari1/styles/bootstrap4/popper.js"></script>
<script src="${path}/resources/nari1/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${path}/resources/nari1/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${path}/resources/nari1/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${path}/resources/nari1/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${path}/resources/nari1/js/categories_custom.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>