<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 <link href="${path}/resources/css/reservation/bookingView.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>



<div id="ticketing">
        <div id="icon">
            <img src="${path }/resources/images/reservation/아이콘.png" width="50px" height="50px" style="margin-top:-1%;margin-left:15%;"/><b style="color:black">뮤지컬 예매</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
            <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"/><b>좌석 선택</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
            <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"/><b>결제하기</b>
        </div>

<div class="containerform text-center">
        <div class="row_5">
            <div class="col_5" style="margin-top:1%">
                <br>
                <h4 class="prdTitle"><b></b></h4><br>
                <img class="posterBoxImage" src="${path }/resources/images/reservation/22014586_p.png" >
            </div>
            <div class="col_5" style="margin-top:8%;font-size:1.1rem;">
                <ul class="info" style="color:black;">
                    <li class="infoItem"><strong class="infoLabel">장소</strong>
                        <div class="infoDesc"><i></i></div><br>
                    </li>
                    <li class="infoItem"><strong class="infoLabel">공연기간</strong>
                        <div class="infoDesc">
                            <p class="infoText">2022.12.16 ~2023.03.05</p>
                        </div>
                    </li>
                    <li class="infoItem"><strong class="infoLabel">공연시간</strong>
                        <div class="infoDesc">
                            <p class="infoText">170분(인터미션 20분 포함)</p>
                        </div>
                    </li>
                    <li class="infoItem"><strong class="infoLabel">관람연령</strong>
                        <div class="infoDesc">
                            <p class="infoText">14세 이상 관람가</p>
                        </div>
                    </li>
                      <li class="infoItem"><strong class="infoLabel">가격</strong>
                        <div class="infoDesc">
                            <p class="infoText">R석 150,000원</p>
                            <p class="infoText">S석 120,000원</p>
                        </div>
                    </li>
                </ul>
            </div>
              <div class="col_5" style="margin-top:2%;margin-left:5%;">
                <div class="my-calendar clearfix" style=>

                    <div class="calendar-box">
                        <div class="ctr-box clearfix">
                            <button type="button" title="prev" class="btn-cal prev">
                            </button>
                            <span class="cal-year"></span>
                            <span class="cal-month"></span>
                            <button type="button" title="next" class="btn-cal next">
                            </button>
                        </div>
                        <table class="cal-table">
                            <thead>
                                <tr>
                                    <th>S</th>
                                    <th>M</th>
                                    <th>T</th>
                                    <th>W</th>
                                    <th>T</th>
                                    <th>F</th>
                                    <th>S</th>
                                </tr>
                            </thead>
                            <tbody class="cal-body"></tbody>
                        </table>
                    </div>

                    <div id="time">
                        <button class="w-btn-outline w-btn-indigo-outline" type="button">
					        <label>1회 17:30</label>
					    </button>&nbsp;&nbsp;&nbsp;&nbsp;
					      <button class="w-btn-outline w-btn-indigo-outline" type="button">
					        <label>2회 17:30</label>
					    </button>
                    
                </div>
                
	</div>
                <!-- // .my-calendar -->
                <div class="booking">
                    <button class="btn btn-danger" style="width:420px;margin-left:5%" onclick="nextPage();">예매하기</button>
                  </div>
               
           </div>
          </div>
         </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 <script src="${path}/resources/js/reservation/bookingView.js"></script> 
<script>
const nextPage = () =>{
const day = document.querySelector(".day-active");
//console.log(day.getAttribute("data-fdate"));
const day2 = new Date(day.getAttribute("data-fdate"));
console.log(day2);

/* 		location.assign('${path}/booking/selectSeat.do'); */
}

</script>

