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
             
       	<!-- 검색창!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="container">
		 <div class="row">
		     <div class="col-sm-6 col-sm-offset-3">
		       <h1 class="module-title font-alt">공연 예매정보</h1>
		     </div>
		 </div>
		 
		 <div class="row">
		   <div class="col-sm-12">
		     <table class="table table-striped table-border checkout-table" style="text-align:center;">
		       <tbody>
		         <tr >
		           <td><b>예매번호</b></td>
		           <td><b>공연번호</b></td>
		           <td><b>공연명</b></td>
		           <td><b>예매일</b></td>
		           <td><b>공연일</b></td>
		           <td><b>환불/취소</b></td>
		           <td><b>리뷰</b></td>
		         </tr>
		         
		         <c:if test="${not empty reservationList }">
		         	<c:forEach var= "r" items="${reservationList}">
				         <tr>
				           <td>
				             <a href="${path }/mypage/musicalListView.do" >
				             	<h5 style="color:#6e1515;font-weight:800;" class="product-title font-alt"><c:out value="${r.get('R_CODE') }"/></h5>
				             </a>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><c:out value="${r.get('M_CODE') }"/></h5>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><c:out value="${r.get('M_TITLE') }"/></h5>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><fmt:formatDate value="${r.get('P_DATE') }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></h5>
				           </td>
				           <td>
				             <h5 class="product-title font-alt"><fmt:formatDate value="${r.get('R_DATE') }" type="both" pattern="yyyy-MM-dd hh:mm"/></h5>
				           </td>
				           <td class="">
				             <button class="btn btn-danger btn-circle">환불</button>
				           </td>
				           <td>
				             <h5 class="product-title font-alt">
				             	관람 후 작성 가능
				             </h5>
				           </td>
				         </tr>
		         	</c:forEach>
		         </c:if>
		         
		         <c:if test="${empty reservationList }">
		         	<tr>
		         		<td colspan="7">공연 예매 내역이 없습니다.</td>
		         	</tr>
		         </c:if>
		         
		         <tr>
		           <td>
		             <h5 class="product-title font-alt">122</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">302</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">뮤지컬 신나</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">2023-01-15</h5>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">2023-01-22</h5>
		           </td>
		           <td class="">
		             <button class="btn btn-g btn-circle" disabled>불가</button>
		           </td>
		           <td>
		             <button class="btn btn-warning btn-circle">리뷰 작성</button>
		           </td>
		         </tr>
		         <tr>
		           <td>
		             <h5 class="product-title font-alt">122</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">302</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">뮤지컬 신나</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">2023-01-15</h5>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">2023-01-22</h5>
		           </td>
		           <td class="">
		             <button class="btn btn-d btn-circle">완료</button>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">관람 후 작성 가능</h5>
		           </td>
		         </tr>
		         
		       </tbody>
		     </table>
		   </div>
		 </div>
		 <center>
		 	${pageBar }
		 </center>
		</div>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>