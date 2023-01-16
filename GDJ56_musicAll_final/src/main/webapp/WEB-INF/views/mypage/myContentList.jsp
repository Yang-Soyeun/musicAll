<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
	<section class="module">
		  <div class="container" style="margin-bottom:60px;">
		    <div class="row">
		      <div class="col-sm-6 col-sm-offset-3">
		        <h1 class="module-title font-alt">내가 쓴 리뷰</h1>
		      </div>
		    </div>
		  
	        <!-- 검색창 -->
            <form class="row" style="margin-bottom:20px;">
              <div class="col-sm-4 mb-sm-20 " style="float: right;">
                  <div class="search-box">
                    <input class="form-control" type="text" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
          		</div>
              <div class="col-sm-2 mb-sm-20 " style="float: right;">
                <select class="form-control">
                  <option selected="selected">전체</option>
                  <option>제목</option>
                  <option>내용</option>
                </select>
              </div>
            </form>
		    
		    <div class="row">
		      <div class="col-sm-12">
		        <table class="table table-striped table-border checkout-table" style="text-align:center;">
		          <tbody>
		            <tr>
		              <td><b>번호</b></td>
		              <td><b>제목</b></td>
		              <td><b>작성자</b></td>
		              <td><b>날짜</b></td>
		            </tr>
		            <tr>
		              <td>
		                <h5 class="product-title font-alt">1</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt"><i class="fa fa-lock"></i>회원정보는 어디서 바꾸나요?(1)</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title" style="letter-spacing:2px;">gdj**</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt">2023-01-15</h5>
		              </td>
		            </tr>
		          </tbody>
		        </table>
		      </div>
		    </div>
		  </div>
		  <div class="container">
		    <div class="row">
		      <div class="col-sm-6 col-sm-offset-3">
		        <h1 class="module-title font-alt">1:1 문의 내역</h1>
		      </div>
		    </div>
		  
	        <!-- 검색창 -->
            <form class="row" style="margin-bottom:20px;">
              <div class="col-sm-4 mb-sm-20 " style="float: right;">
                  <div class="search-box">
                    <input class="form-control" type="text" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
          		</div>
              <div class="col-sm-2 mb-sm-20 " style="float: right;">
                <select class="form-control">
                  <option selected="selected">전체</option>
                  <option>제목</option>
                  <option>내용</option>
                </select>
              </div>
            </form>
		    
		    <div class="row">
		      <div class="col-sm-12">
		        <table class="table table-striped table-border checkout-table" style="text-align:center;">
		          <tbody>
		            <tr>
		              <td><b>번호</b></td>
		              <td><b>제목</b></td>
		              <td><b>작성자</b></td>
		              <td><b>날짜</b></td>
		            </tr>
		            <tr>
		              <td>
		                <h5 class="product-title font-alt">1</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt"><i class="fa fa-lock"></i>회원정보는 어디서 바꾸나요?(1)</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title" style="letter-spacing:2px;">gdj**</h5>
		              </td>
		              <td class="">
		                <h5 class="product-title font-alt">2023-01-15</h5>
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