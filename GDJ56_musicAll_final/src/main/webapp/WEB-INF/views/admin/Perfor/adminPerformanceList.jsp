<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path }/resources/css/admin/performance/performanceList.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

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
            <li><input type="radio" name="mType" value="오리지널" onclick="getCheckboxValue(event);">&nbsp;오리지널 내한공연</li>
            <li><input type="radio" name="mType" value="라이센스" onclick="getCheckboxValue(event);">&nbsp;라이센스 뮤지컬</li>
            <li><input type="radio" name="mType" value="창작뮤지컬" onclick="getCheckboxValue(event);">&nbsp;창작 뮤지컬</li>
            <li><input type="radio" name="mType" value="넌버벌" onclick="getCheckboxValue(event);">&nbsp;넌버벌 퍼포먼스</li>
            <li><input type="radio" name="mType" value="아동" onclick="getCheckboxValue(event);">&nbsp;아동</li>
          </div>
          
          </article>
        </section>
     </header>

      
    
    <div class="search-box">
        <form action="${path }/adminPerfor/searchForTitle.do" method="post">
            <input type="text" name="mTitle" id="search" placeholder="제목으로 검색하기" style="width:400px; height:45px;margin-left:180px;">
            <button class="searchBtn" type="submit" style="width:50px; height:30px; font-size:15px;">검색</button>
        </form>
    </div>
    <div class="select-box" >
        <select id="orderby" style="width:140px; height:40px;font-size:18px; ">
        	<option value="예매랭킹순">정렬</option>
            <option value="예매랭킹순">예매랭킹순</option>
            <option value="최신등록순">최신등록순</option>
            <option value="공연마감임박순">공연마감 임박순</option>
        </select>
    </div>
    <c:choose>
    	<c:when test="${empty musicalPhoto}">
    		<tr>
    			<td style="font-size:20px; text-align:center;">조회된 공연이 없습니다.</td>
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
					<img src="${path }/resources/upload/performance/${f.I_NAME}" class="perView" style="margin-left:110px; float:left; border-radius:10px;"
					 onclick="location.assign('${path}/adminPerfor/performanceView.do?mCode=${f.M_CODE}')" >
					
					
				</div>
	    			<!-- <div class="leftOver-box">
	        			<div><b style="font-size:20px;">[1/150]</b></div>  
	        		</div> -->
			</c:forEach>
		</c:otherwise>
	</c:choose>
</section>
<script>
	/* $(function(){
	    $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
	}) */
	
	$('#orderby').change(function(){
		var select=$("#orderby option:selected").val();
		console.log(select);
		if(select=='최신등록순'){
			location.assign("${path}/adminPerfor/orderbyRecent.do");
		}else if(select=='예매랭킹순'){
			location.assign("${path}/adminPerfor/orderbyBest.do");
		}else if(select=='공연마감임박순'){
			location.assign("${path}/adminPerfor/orderbyEnd.do");
		}
	}
	)		
	
	//체크박스 장르 가져오기
 	function getCheckboxValue(event)  {
  		let result = '';
  		if(event.target.checked){
    		result = event.target.value;
    		console.log(result);
    		if(result=='오리지널')	{
    			location.assign("${path}/adminPerfor/searchForType.do?mType=1");
    		}
    		if(result=='라이센스')	{
    			location.assign("${path}/adminPerfor/searchForType.do?mType=2");
    		}
    		if(result=='창작뮤지컬')	{
    			location.assign("${path}/adminPerfor/searchForType.do?mType=3");
    		}
    		if(result=='넌버벌')	{
    			location.assign("${path}/adminPerfor/searchForType.do?mType=4");
    		}
    		if(result=='아동')	{
    			location.assign("${path}/adminPerfor/searchForType.do?mType=5");
    		}
  		}else{
    		result = '';
  		}
  	} 
	
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


