<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
	<section class="module">
		  <div class="container">
		    <div class="row">
		      <div class="col-sm-6 col-sm-offset-3">
		        <h1 class="module-title font-alt">현재 나의 포인트 
			        <span style="font-style:oblique; color: #A50000;">
			        <fmt:formatNumber value="${mpPoint.mpPoint==null?'0':'mpPoint.mpPoint'}" pattern="###,###"/>p</span>
		        </h1>
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
		            <c:if test="${not empty mypoint }">
		            	<c:forEach var="mp" items="${mypoint }">
				            <tr>
				              <td>
				                <h5 class="product-title font-alt"><c:out value="${mp.mpDate }"/></h5>
				              </td>
				              <td class="">
				                <c:if test="${mp.mpType eq '+'}"><h5 class="fa  fa-plus"></h5></c:if>
				                <c:if test="${mp.mpType eq '-'}"><h5 class="fa  fa-minus"></h5></c:if>
				              </td>
				              <td class="">
				                <h5 class="product-title font-alt"><c:out value="${mp.mpHistory }"/></h5>
				              </td>
				              <td class="">
				                <h5 class="product-title" style="letter-spacing:2px;">
				                	<c:out value="${mp.mpType }"/>
				                	<fmt:formatNumber value="${mp.mpPrice }" pattern="###,###"/>point
				                </h5>
				              </td>
				            </tr>
				    	</c:forEach>
		            </c:if>
		            <c:if test="${empty mypoint }">
		            	<tr>
		            		<td colspan="4">
		            			<h5>포인트 내역이 없습니다</h5>
		            		</td>
		            	</tr>
		            </c:if>
		            
		          </tbody>
		        </table>
		      </div>
		      
		      <!-- 페이지바 -->
		      <center>
			      <div class="col-sm-12">
				      <div class="pagination font-alt">
				      	<a href="#"><i class="fa fa-angle-left"></i></a>
				      	<a class="active" href="#">1</a>
				      	<a href="#">2</a>
				      	<a href="#">3</a>
				      	<a href="#">4</a>
				      	<a href="#"><i class="fa fa-angle-right"></i></a>
				      </div>
			      </div>
		      </center>
		      
		    </div>
		  </div>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>