<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="GoodsPage"/>
</jsp:include>
<link href="${path}/resources/css/reservation/selectSeat.css" rel="stylesheet">
<script>
	alert("${msg}");
</script>
 
 
 <link rel="stylesheet" type="text/css" href="${path }/resources/css/store/single_styles.css">

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
            <div class="col">

            <!-- Breadcrumbs -->

            <div class="breadcrumbs d-flex flex-row align-items-center">
               <ul>
                  <li><a href="${path }">Home</a></li>
                  <li><a href="${path }/goods/goodsMain.do"><i class="fa fa-angle-right" aria-hidden="true"></i>굿즈 스토어</a></li>
                  <li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>결제 완료</a></li>
               </ul>
               
            </div>
            
         </div>
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">결제 상세 내용을 확인해 주세요</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            
            <!-- 장바구니 리스트 출력 -->
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th colspan="2">상품 정보</th>
                      <th>수량</th>
					  <th class="hidden-xs">상품 금액</th>
                      <th></th>
                    </tr>
                    
                    <tr>
                      <td class="hidden-xs" style="border-right: none; max-width: 25px;">
	                      <c:if test="${not empty img }">
	                      <c:forEach var="i" items="${img }">
	                         <c:if test="${i.gdCode == goods.gdCode }">
	                               <a href="#"><img src="${path }/resources/upload/goods/${i.imName}" style="border-radius: 13%;"/></a>
	                            </c:if>
	                         </c:forEach>
	                      </c:if>
                      </td>
                      <td style="border-left: none; max-width: 104px;">
                        <h5 class="product-title font-alt"><c:out value="${goods.gdName }"/></h5>
                      </td>
                      <td>
                        <h5 class="product-title font-alt"><c:out value="${info[3] }개"/></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${info[4] }" pattern="#,###" />원</h5>
                      </td>
           
                      <td class="pr-remove" style="max-width: 59px;">
                         <button class="btn btn-danger btn-round" type="submit" style="margin: 2%;">환불</button>
                      </td>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>
 
 
 		<div class="row" >
              
        </div>
         </div>
         
        </section>
        

        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
 
   </body>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>