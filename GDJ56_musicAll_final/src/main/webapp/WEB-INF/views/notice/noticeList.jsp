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
              <h1 class="module-title font-alt">공지사항
                
              </h1>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <table class="table table-striped table-border checkout-table" style="text-align:center;">
                <tbody>
                  <tr >
                    <td><b>번호</b></td>
                    <td><b>제목</b></td>
                    <td><b>작성자</b></td>
                    <td><b>작성일</b></td>
                  </tr>
                  <c:if test="${not empty notices }">
                     <c:forEach var="n" items="${notices }">
                        <tr>
                          <td style="max-width:80px;">
                             <h5 class="product-title font-alt"><c:out value="${n.noticeNo }"/></h5>
                          </td>
                          <td style="cursor:pointer" onclick="location.assign('${path}/notice/noticeView.do?noticeNo=${n.noticeNo }')">
	                  		  <h5 class="product-title font-alt"><c:out value="${n.noticeTitle }"/></h5>
	                	  </td>
                           <td>
	                  <h5 class="product-title font-alt"><c:out value="admin"/></h5>
	                </td>
                          <td>
	                  <h5 class="product-title font-alt"><c:out value="${n.noticeDate }"/></h5>
	                </td>
                        </tr>
                   </c:forEach>
                  </c:if>
                  <c:if test="${empty notices }">
                     <tr>
                        <td colspan="4">
                           <h5>공지가 없습니다</h5>
                        </td>
                     </tr>
                  </c:if>
                  
                </tbody>
              </table>
            </div>
            
            <!-- 페이지바 -->
            <center>
               ${pageBar }
            </center>
            
          </div>
        </div>
   </section>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>