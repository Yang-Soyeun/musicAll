<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
     
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">장바구니</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs"></th>
                      <th>상품</th>
                      <th class="hidden-xs">가격</th>
                      <th>수량</th>
                      <th>총 금액</th>
                      <th>나중에 구매</th>
                    </tr>
                    <tr>
                      <td class="hidden-xs"><a href="#"><img src="${path }/resources/images/store/goods.jpg" alt="Accessories Pack"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">2021 라흐마니노프 가죽 키링</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">15,000원</h5>
                      </td>
                      <td>
                        <input class="form-control" type="number" name="" value="1" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">15,000원</h5>
                      </td>
                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                    <tr>
                      <td class="hidden-xs"><a href="#"><img src="${path }/resources/images/store/goods.jpg" alt="Men’s Casual Pack"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">2021 라흐마니노프 가죽 키링</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">15,000원</h5>
                      </td>
                      <td>
                        <input class="form-control" type="number" name="" value="1" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">15,000원</h5>
                      </td>
                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-3">
                <div class="form-group">
                  <input class="form-control" type="text" id="" name="" placeholder="Coupon code"/>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="form-group">
                  <button class="btn btn-round btn-g" type="submit">Apply</button>
                </div>
              </div>
              <div class="col-sm-3 col-sm-offset-3">
                <div class="form-group">
                  <button class="btn btn-block btn-round btn-d pull-right" type="submit">변경</button>
                </div>
              </div>
            </div>
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">Cart Totals</h4>
                  <table class="table table-striped table-border checkout-table">
                    <tbody>
                      <tr>
                        <th>Cart Subtotal :</th>
                        <td>15,000원</td>
                      </tr>
                      <tr>
                        <th>Shipping Total :</th>
                        <td>0</td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>Total :</th>
                        <td>30,000원</td>
                      </tr>
                    </tbody>
                  </table>
                  <button class="btn btn-lg btn-block btn-round btn-d" type="submit" onclick="location.assign('${path }/goods/goodsPay.do')">구매하기</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        

        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>