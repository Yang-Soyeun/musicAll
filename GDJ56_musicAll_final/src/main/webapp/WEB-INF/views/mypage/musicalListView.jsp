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
	    <hr class="divider-w pt-20"><h4 class="font-alt" style="padding-left: 20px;"><c:out value="${rvDetail.M_TITLE }"/></h4>
	    <div class="row">
	      <div class="col-sm-12">
	        <table class="table table-striped table-border checkout-table">
	          <tbody>
	            <tr>
	              <td style="max-width: 50px;" rowspan="4" class="hidden-xs"><img src="${path}/resources/upload/performance/${rvDetail.I_NAME }" alt="공연포스터"/></td>
	              <td>
	                <h5 class="product-title font-alt">예매번호</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${rvDetail.R_CODE }"/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">관람일  |  시간</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><fmt:formatDate value="${rvDetail.R_DATE }" pattern="yyyy-MM-dd"/>  |  <c:out value="${rvDetail.R_TIME }"/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">티켓수량  |  가격</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${rvDetail.SEATCOUNT }"/>  |  <fmt:formatNumber value="${rvDetail.SEATPRICE }" pattern="###,###"/>원</h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">예매좌석</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${rvDetail.R_SEAT }"/></h5>
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
	          <h6 class="product-title font-alt">결제일시 : <fmt:formatDate value="${rsDetail.P_DATE }" pattern="yyyy-MM-dd hh:mm:ss"/></h6>
	          <table class="table table-striped table-border checkout-table">
	            <tbody>
	              <tr>
	                <th style="max-width: 50px;">결제 금액 : </th>
	                <td><fmt:formatNumber value="${rsDetail.SEATPRICE }" pattern="###,###"/>원</td>
	              </tr>
	              <tr>
	                <th style="max-width: 50px;">포인트 사용 : </th>
	                <td><fmt:formatNumber value="${rsDetail.PAYPOINT }" pattern="###,###"/>P</td>
	              </tr>
	              <tr class="shop-Cart-totalprice">
	                <th style="max-width: 50px;">총 결제 금액 : </th>
	                 <td id="totalPrice" >
	                 	<fmt:formatNumber value="${rsDetail.P_PRICE }" pattern="###,###"/>원
	                 </td>
	              </tr>
	            </tbody>
	          </table>
	       		<c:if test="${rsDetail.containsKey('RF_DATE') }">
		           <h6 class="product-title font-alt" style="color: rgb(194, 35, 35);">
		           	취소일시 : <fmt:formatDate value="${rsDetail.RF_DATE }" pattern="yyyy-MM-dd hh:mm:ss"/>
		           </h6>
	    		</c:if>
	          <button class="btn btn-lg btn-block btn-round btn-d" 
	          	onclick="location.assign('${path }/mypage/musicalList.do?No=${loginMember.member_No}');">예매목록</button>
	        </div>
	      </div>
	    </div>
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