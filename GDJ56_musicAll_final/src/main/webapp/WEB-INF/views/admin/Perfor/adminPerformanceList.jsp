<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/admin/performance/performanceList.css" rel="stylesheet"/>


<section>
<button style="width:80px; height:30px; font-size:20px; margin-top:10px; margin-left:10px;"
onclick="location.assign('${path}/admin/adminMain.do')">back</button>
  <h1 style="text-align:center; margin-top:20px;">공연 현황</h1>
    <br>
    <div id="assignBox">
    	<button id="assignPer" style="width:100px; height:30px; font-size:15px;" onclick="location.assign('${path}/adminPerfor/performanceAssign.do')">공연등록</button>
    </div>
    <br>
    <br>
    <header>
        <section class="hbody">
          <article class="nav2">
         
          <div id="menu" style="margin-left:380px;">
            <li><input type="checkbox" id="original">&nbsp;오리지널 내한공연</li>
            <li><input type="checkbox" id="license">&nbsp;라이센스 뮤지컬</li>
            <li><input type="checkbox" id="making">&nbsp;창작 뮤지컬</li>
            <li><input type="checkbox" id="nonverbal">&nbsp;넌버벌 퍼포먼스</li>
            <li><input type="checkbox" id="child">&nbsp;아동</li>
          </div>
          
          </article>
        </section>
     </header>

      
    
    <div class="search-box">
        <form action="." method="post">
            <input type="text" id="search" placeholder="제목으로 검색하기" style="width: 600px; height: 40px;">
            <!--<input type="text" id="datepicker">  -->
            <button class="searchBtn" type="submit" style="width:50px; height:30px; font-size:15px;">검색</button>
        </form>
    </div>
    <div class="select-box" >
        <select style="width:140px; height:40px;font-size:18px; ">
            <option value="">예매랭킹순</option>
            <option value="">최신등록순</option>
            <option value="">공연마감 임박순</option>
            <option value="">공연명순</option>
        </select>
    </div>
    <c:choose>
    	<c:when test="${empty musicalPhoto}">
    		<tr>
    			<td>조회된 공연이 없습니다.</td>
    		</tr>
    	</c:when>
	    <c:otherwise>
	    	<div class="count-box2" style="margin-top:50px; margin-left:140px;">
	        	<img src="${path }/resources/images/performance/first.png" id="countimg1" style="width:80px; height: 80px;">
	        	<img src="${path }/resources/images/performance/second.png" id="countimg2" style="width:70px; height: 75px;">
	        	<img src="${path }/resources/images/performance/third.png" id="countimg3" style="width:70px; height: 65px;">
	        	<img src="${path }/resources/images/performance/fourth.png" id="countimg4" style="width:70px; height: 75px;">
	    	</div>
	    	<c:forEach var="f" items="${musicalPhoto }">
	    		<div class="photo-box">
					<img src="${path }/resources/upload/performance/${f.getIName()}" class="perView" style="margin-left:110px; float:left; border-radius:10px;"
					 onclick="location.assign('${path}/adminPerfor/performanceView.do?mCode=${f.getMCode()}')" >
					
					
				</div>
	    			<!-- <div class="leftOver-box">
	        			<div><b style="font-size:20px;">[1/150]</b></div>  
	        		</div> -->
			</c:forEach>
		</c:otherwise>
	</c:choose>
</section>
<!--<script>
	$(function(){
	    $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
	})
</script> -->

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


