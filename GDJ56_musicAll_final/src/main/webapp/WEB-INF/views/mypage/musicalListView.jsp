<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">예매 내역</h1>
              </div>
            </div>
            <hr class="divider-w pt-20"><h4 class="font-alt" style="padding-left: 20px;"><c:out value="${rsDetail.M_TITLE }"/></h4>
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <td rowspan="4" class="hidden-xs"><img src="${path}/resources/uploads/perfomance/${rsDetail.I_NAME }" alt="공연포스터"/></td>
                      <td>
                        <h5 class="product-title font-alt">예약번호</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><c:out value="${rsDetail.R_CODE }"/></h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">관람일  |  시간</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><fmt:formatDate value="${rsDetail.R_DATE }" pattern="yyyy-MM-dd"/>  |  <c:out value="${rsDetail.R_TIME }"/>PM</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">티켓수량  |  가격</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><c:out value="${rsDetail.SEATCOUNT }"/>  |  <fmt:formatNumber value="${rsDetail.SEATPRICE }" pattern="###,###"/></h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">좌석</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><c:out value="${rsDetail.R_SEAT }"/></h5>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-12 ">
                <div class="shop-Cart-totalbox">
                  <h6 class="product-title font-alt">결제일시 : 2022-02-05 오후 12:51:28</h6>
                  <table class="table table-striped table-border checkout-table">
                    <tbody>
                      <tr>
                        <th>결제 금액 : </th>
                        <td>15,000원</td>
                      </tr>
                      <tr>
                        <th>포인트 사용 : </th>
                        <td>2,000P</td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>총 결제 금액 : </th>
                        <td style=" text-decoration:line-through; color:rgb(194, 35, 35);">13,000원</td>
                      </tr>
                    </tbody>
                  </table>
                  <h6 class="product-title font-alt" style="color: rgb(194, 35, 35);">취소일시 : 2022-02-05 오후 12:51:28</h6>
                  <button class="btn btn-lg btn-block btn-round btn-d" >예매목록</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>