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
	                <h5 class="product-title font-alt"><c:out value="${notices.noticeTitle }"/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">카테고리</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${notices.noticeCategory }"/> </h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">작성일</h5>
	              </td>
	              <td class="hidden-xs">
	                <h5 class="product-title font-alt"><c:out value="${notices.noticeDate }"/></h5>
	              </td>
	            </tr>
	            <tr>
	              <td>
	                <h5 class="product-title font-alt">내용</h5>
	              </td>
	              <td class="hidden-xs">
	               	<div style="width: 999px;height: 700px;resize: none;">${notices.noticeContent }<br><br><br><br><br>
	               	<c:if test="${not empty img }">
	               		<img width="500px;" height="500px;" src="${path }/resources/upload/notice/${img.imName }" >
	               	</c:if>
	               	</div>
	              </td> 
	            </tr>
	
	          </tbody>
	               
	        </table>
	      </div>
	    </div>
	 

	  </div>
	  <c:if test="${loginMember!=null&&loginMember.member_Id.equals('admin') }">
	  <div class="ASKbtn" id="divWriteForm" style="display:block; margin-left: 43%;" >
			<span><input type="button"  value="수정" onclick="location.assign('${path}/notice/updatenotice.do?noticeNo=${notices.noticeNo }')" class="btn btn-danger btn-circle"></span>
			<span><input type="button"  value="삭제" class="btn btn-danger btn-circle" onclick="location.assign('${path}/notice/deletenotice.do?noticeNo=${notices.noticeNo }')"></span>	
			<span><input type="button" onclick="location.assign('${path}/notice/noticeList.do');" value="목록" class="btn btn-danger btn-circle"></span>
	 </c:if>
	</div>
	<c:if test="${loginMember!=null&&loginMember.member_Id ne 'admin' }">
	  <div class="ASKbtn" id="divWriteForm" style="display:block; margin-left: 48%;" >	
			<span><input type="button" onclick="location.assign('${path}/noticeList.do');" value="목록" class="btn btn-danger btn-circle"></span>
	 </c:if>
	</div>
	</section>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
