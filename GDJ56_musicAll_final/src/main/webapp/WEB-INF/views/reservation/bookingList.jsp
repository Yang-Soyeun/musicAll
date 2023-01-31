<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path}/resources/css/performance/performanceList.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<section style="margin-top:100px;">
    <p id="nowShowing" style="font-size:25px; text-align:center;">현재 상영작</p>
    <br>
        <section class="hbody">
          <article class="nav2">
         
          <div id="menu">
            <li><input type="checkbox" id="original">&nbsp;오리지널 내한공연</li>
            <li><input type="checkbox" id="license">&nbsp;라이센스 뮤지컬</li>
            <li><input type="checkbox" id="making">&nbsp;창작 뮤지컬</li>
            <li><input type="checkbox" id="nonverbal">&nbsp;넌버벌 퍼포먼스</li>
            <li><input type="checkbox" id="child">&nbsp;아동</li>
          </div>
          
          </article>
        </section>

    
    <div class="search-box">
        <form action="." method="post">
            <input type="text" id="searchPer" placeholder="제목으로 검색하기" >&nbsp;
            <input type="text" id="datepicker" placeholder="관람일자로 검색하기" style="width:200px; height:48px;">
            <button class="searchBtn" type="submit" >검색</button>

        </form>
    </div>
    <div class="select-box">
        <select style="width:140px; height:40px;font-size:18px;">
            <option value="">예매랭킹순</option>
            <option value="">최신등록순</option>
            <option value="">공연마감 임박순</option>
            <option value="">공연명순</option>
        </select>
    </div>
    <div class="count-box">
        <img src="${path }/resources/images/performance/first.png" id="countimg1" style="width:80px; height: 80px;">
        <img src="${path }/resources/images/performance/second.png" id="countimg2" style="width:70px; height: 75px;">
        <img src="${path }/resources/images/performance/third.png" id="countimg3" style="width:70px; height: 65px;">
        <img src="${path }/resources/images/performance/fourth.png" id="countimg4" style="width:70px; height: 75px; ">
    </div>
    <c:forEach var="p" items="${musicalPhoto}">
    <div class="photo-box" style>
        <img src="${path }/resources/upload/performance/${p.getIName()}" class="perView" style="float:left;"onclick="location.href='${path}/perfor/performanceView.do?mCode=${p.getMCode() }';"/>
    </div>
    </c:forEach>
</section>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script>
	$(function(){
	    $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
	})
</script>

<!-- jquery 기본 js파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0
/jquery.min.js"></script>

<!-- //jquery ui js파일 -->
<script  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui
/1.12.1/jquery-ui.min.js"></script>

<!-- //jquery ui css파일 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs
/jqueryui/1.12.1/jquery-ui.min.css"/>
<br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
