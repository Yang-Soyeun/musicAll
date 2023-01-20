<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	            <c:if test="${not empty myShopping }">
	            	<c:forEach var="shop" items="${myShopping }">
	              <tr>
	                <td>
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('SB_CODE') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('G_NAME') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('SB_COUNT') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><fmt:formatNumber value="${shop.get('G_PRICE') }" pattern="###,###"/></h5>
	                </td>
	                <td>
	                  <h5 class="product-title font-alt">
	                  	<fmt:formatDate value="${shop.get('P_DATE') }" type="both" pattern="yyyy-MM-dd (E) hh:mm:ss"/>
	                  </h5>
	                </td>
	                <td class="">
	                  <button class="btn btn-danger btn-circle">환불</button>
	                </td>
	              </tr>
	      	</c:forEach>
	            </c:if>
	            <c:if test="${empty myShopping }">
	            	<tr>
	            		<td colspan="6">구매내역이 없습니다.</td>
	            	</tr>
	            </c:if>
	          </tbody>
	        </table>
	      </div>
			  <center>
			  	${pageBar }
			  </center>
	  
	    </div>
	  </div>
	</section>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>