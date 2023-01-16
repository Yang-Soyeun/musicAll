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
		        <h1 class="module-title font-alt">현재 나의 포인트 <span style="font-style:oblique; color: #A50000;">13,000p</span></h1>
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-sm-12">
		        <table class="table table-striped table-border checkout-table" style="text-align:center;">
		          <tbody>
		            <tr >
		              <td><b>날짜</b></td>
		              <td><b>상태</b></td>
		              <td><b>분류</b></td>
		              <td><b>내역</b></td>
		            </tr>
		            <tr>
		              <td>
		                <h5 class="product-title font-alt">2022-02-05</h5>
		              </td>
		              <td class="">
		                <h5 class="fa  fa-plus"></h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt">예매 시 적립</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title" style="letter-spacing:2px;">+150point</h5>
		              </td>
		            </tr>
		            <tr>
		              <td>
		                <h5 class="product-title font-alt">2023-01-15</h5>
		              </td>
		              <td class="">
		                <h5 class="fa  fa-minus"></h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt">관람 포인트 사용</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title "style="letter-spacing:2px;">-2,000point</h5>
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