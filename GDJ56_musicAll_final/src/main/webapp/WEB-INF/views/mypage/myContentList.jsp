<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<style>
	.reviewImg{height:200px;}
	.reviewCon{text-align:center;}
	.post-entry{height:125px;}
</style>
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
	    
	    <div class="col-sm-6 col-md-3 col-lg-3 reviewCon" >
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/images/performance/matilda.gif" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	          </div>
	          <div class="post-header font-alt">
	            <h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	          </div>
	          <div class="post-entry">
	            <p>너무 재미있게 잘 봤어요~ 추천드려요! 다음에도 꼭 보러갈게요 프랑켄슈타인 최고 재밌어요...</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	      
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/nari1/images/엘리자벳.jfif" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	          </div>
	          <div class="post-header font-alt">
	            <h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	          </div>
	          <div class="post-entry">
	            <p>너무 재미있게 잘 봤어요~</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/nari1/images/캣츠.jfif" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	        </div>
	        <div class="post-header font-alt">
	           	<h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	        </div>
	          <div class="post-entry">
	            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/nari1/images/프랑켄슈타인.jfif" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	          </div>
	          <div class="post-header font-alt">
	           	<h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	          </div>
	          <div class="post-entry">
	            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	  </div>
	  
	  
	  
	  
	  
	  
	  <!-- 1:1문의 -->
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-6 col-sm-offset-3">
	        <h1 class="module-title font-alt">1:1 문의 내역</h1>
	      </div>
	    </div>
	  
        <!-- 검색창 -->
        <form action="${path }/mypage/searchQs.do" class="row" style="margin-bottom:20px;">
          <div class="col-sm-4 mb-sm-20 " style="float: right;">
              <div class="search-box">
                <input class="form-control" type="text" placeholder="Search...">
                <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
              </div>
      		</div>
          <div class="col-sm-2 mb-sm-20 " style="float: right;">
            <select name="keyword" class="form-control">
              <option selected="selected">전체</option>
              <option value="qsTitle">제목</option>
              <option value="qsContent">내용</option>
            </select>
          </div>
        </form>
	    
	    <div class="row">
	      <div class="col-sm-12">
	        <table class="table table-striped table-border checkout-table" style="text-align:center;">
	          <tbody>
	            <tr>
	              <td><b>번호</b></td>
	              <td><b>유형</b></td>
	              <td><b>제목</b></td>
	              <td><b>작성자</b></td>
	              <td><b>답변유무</b></td>
	              <td><b>작성일</b></td>
	            </tr>
	            
	            <c:if test="${not empty myQs }">
	            	<c:forEach var="qs" items="${myQs }">
	            		<tr>
			              <td>
			                <h5 class="product-title font-alt"><c:out value="${qs.qsNo }"/></h5>
			              </td>
			              <td>
			                <h5 class="product-title font-alt"><c:out value="${qs.qsHeadTitle }"/></h5>
			              </td>
			              <td class="">
			                <h5 class="product-title font-alt"><i class="fa fa-lock"></i><c:out value="${qs.qsTitle }"/></h5>
			              </td>
			              <td class="">
			                <h5 class="product-title" style="letter-spacing:2px;"><c:out value="${loginMember.member_Id}"/></h5>
			              </td>
			              <td class="">
			                <h5 class="product-title font-alt"><c:out value="${qs.qsResult }"/></h5>
			              </td>
			              <td class="">
			                <h5 class="product-title font-alt">
			                	<fmt:formatDate value="${qs.qsDate }" type="both" pattern="yyyy-MM-dd (E) hh:mm:ss"/>
			                </h5>
			              </td>
		            	</tr>
		            </c:forEach>
		         </c:if>
		         <c:if test="${empty myQs }">
		         	<tr>
		         		<td colspan="6">1대1 문의 내역이 없습니다.</td>
		         	</tr>
		         </c:if>
		         
		         
	          </tbody>
	        </table>
	      </div>
	      
	      <!-- 페이지바 -->
	      <center>
	      	${pageBarQs }
	      </center>
	      
	      
	    </div>
	  </div>
	</section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>