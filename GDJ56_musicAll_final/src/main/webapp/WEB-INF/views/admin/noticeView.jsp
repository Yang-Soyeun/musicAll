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
	        <h1 class="module-title font-alt">공지 사항</h1>
	      </div>
	    </div>
	    <hr class="divider-w pt-20"><h4 class="font-alt" style="padding-left: 20px;"><c:out value="${rvDetail.M_TITLE }"/></h4>
	    <div class="row">
	      <div class="col-sm-12">
	        <table class="table table-striped table-border checkout-table">
	          <tbody>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">제목</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value=""/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">카테고리</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><fmt:formatDate value="${rvDetail.R_DATE }" pattern="yyyy-MM-dd"/>  |  <c:out value="${rvDetail.R_TIME }"/>PM</h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">작성일</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${rvDetail.SEATCOUNT }"/>  |  <fmt:formatNumber value="${rvDetail.SEATPRICE }" pattern="###,###"/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">내용</h5>
	              </td>
	              <td class="hidden-xs">
	               	<textarea width="500px" height="500px">ㅎㅇ</textarea>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	    </div>
	    <hr class="divider-w">

	  </div>
	</section>
</div>

<script>
	$(()=>{
		if($("h6").text().includes("취소")){//환불 한 내역이 있으면
			$("#totalPrice").attr('style','color:rgb(194, 35, 35); text-decoration:line-through;');//결제금액 색 변경
		}else{//없으면
			
		}
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>