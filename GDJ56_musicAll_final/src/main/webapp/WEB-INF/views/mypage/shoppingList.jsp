<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">상품 구매내역</h1>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table" style="text-align:center;">
                  <tbody>
                    <tr >
                      <td><b>주문번호</b></td>
                      <td><b>상품명</b></td>
                      <td><b>수량</b></td>
                      <td><b>가격</b></td>
                      <td><b>결제일</b></td>
                      <td><b>환불/취소</b></td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">122</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">하이 키링</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">1</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">15,000</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">2023-01-15</h5>
                      </td>
                      <td class="">
                        <button class="btn btn-danger btn-circle">환불</button>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">122</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">하이 키링</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">1</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">15,000</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">2023-01-15</h5>
                      </td>
                      <td class="">
                        <button class="btn btn-g btn-circle" disabled>불가</button>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5 class="product-title font-alt">122</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">하이 키링</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">1</h5>
                      </td>
                      <td class="">
                        <h5 class="product-title font-alt">15,000</h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">2023-01-15</h5>
                      </td>
                      <td class="">
                        <button class="btn btn-d btn-circle">완료</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </section>
        </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>