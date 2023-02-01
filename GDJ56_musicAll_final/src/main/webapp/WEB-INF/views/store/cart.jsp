<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<style>
		.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
			vertical-align: inherit;
		}
	
</style>

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
                      <th></th>
                      <th>상품</th>
                      <th class="hidden-xs">가격</th>
                      <th>수량</th>
                      <th>총 금액</th>
                      <th></th>
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
                      <td class="pr-remove">
                      	<button class="btn btn-round btn-g btn-sm" type="submit" style="margin: 2%;">구매하기</button><br>
                      	<button class="btn btn-danger btn-round btn-sm" type="submit" style="margin: 2%;">나중에 구매</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row" >
              <div class="col-sm-3 col-sm-offset-3" style="float:right;">
                <div class="form-group">
                  <button class="btn btn-block btn-round btn-d pull-right" type="submit" style="margin-bottom: 6%;">변경</button>
                </div>
              </div>
            </div>
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">장바구니</h4>
                  <table class="table table-striped table-border checkout-table">
                    <tbody>
                      <tr>
                        <th>개별 금액 :</th>
                        <td>15,000원</td>
                      </tr>
                      <tr>
                        <th>장바구니 상품 개수 :</th>
                        <td>0</td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>총 금액 :</th>
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
    
  </body>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>