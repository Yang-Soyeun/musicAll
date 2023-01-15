<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<link href="${path}/resources/css/reservation/selectSeat.css" rel="stylesheet">
<style>
.left-margin {
			    margin-left: 30px;
			}
			
			.right-margin {
			    margin-right: 30px;
			}
			
			.top-margin {
			    margin-top: 30px;
			}
</style>
    <div id="ticketing">
         <div id="icon">
           <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:15%;"/><b>뮤지컬 예매</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
           <img src="${path }/resources/images/reservation/아이콘.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"/><b style="color:black"s>좌석 선택</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
           <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"/><b>결제하기</b>
        </div>
    </div>
	<div class="test">
		 <div class="seat-wrapper">			     
		 	 <div class="stage-view"><img src="${path }/resources/images/reservation/스테이지.png" width="400px" height="80px"></div> 
		  </div>
		  <div id="right-container" style="float:right">	  
            <br>
            <b>일자 : </b>2023년 01월 26일(목)<br><br>
            <b>시간 : </b> 19시 30분<br><br>
            <b>선택좌석</b><br><br>
            E11 (R석, 88000원)<br>
            A12 (R석, 88000원)<br><br>
            <b>총 결제 금액</b><br><br>
            176,000원
       	  </div>
    </div>
    
	<div class="booking">
        <button class="btn btn-danger" style="width:270px;float:right;margin-right:19.5%;font-size:15px;" onclick="location.assign('${path}/booking/selectSeat.do')">결제하기</button>
    </div>
    
	<div class="select-theater-place">
		<span>남은좌석</span><span class="remain-seats">152</span>/<span
			class="all-seats">172</span>
	</div>
   <div class="selected-seats-wrapper">
						<span class="selected-seats-title">좌석번호</span> <span
							class="selected-seats">선택한 좌석이 없습니다.</span>
					</div>
	<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 좌석 수</div>
						<div class="reserve-number">0</div>
					</div>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 <script src="${path}/resources/js/reservation/selectSeat.js"></script>
