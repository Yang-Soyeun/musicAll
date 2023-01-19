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
		          <%--           <c:if test="${not empty performance }">
								<c:forEach var="per" items="${performance }">
								
									<c:forEach var="d" items="${day }">
									<c:if test="${d==per.get('S_DAY') }">
		                        <button class="w-btn-outline w-btn-indigo-outline" type="button">
							        <label>${d }${per.get("S_NUM")}회 </label>
							    </button>
							    	</c:if>
							    	
							    </c:forEach>
							   
    						</c:forEach>
    					</c:if>	 --%>
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

const turn = () =>{
		const d = document.querySelector(".day-active");
		    
	        const day = d.getAttribute("data-fdate");
	        const day2 = new Date(day);
	       function getDayOfWeek(){ 

	        
	        const week = ['일', '월', '화', '수', '목', '금', '토'];
	        const dayOfWeek = week[day2.getDay()];

	        return dayOfWeek;

	        }
	       $("#time").html("");
 <c:if test="${not empty performance }">
<c:forEach var="per" items="${performance }">
	<c:forEach var="d" items="${day }">
	
		if(getDayOfWeek()=="${d}"&&"${d}"=="${per.get('S_DAY')}"){
			/* $("#time").append("<button class='w-btn-outline w-btn-indigo-outline' type='button'><label>"+${per.get('S_NUM')}+"회&nbsp"+"${per.get('S_STARTTIME')}"+"</label></button>") */
			$("#time").append("<input type='radio' id='select"+${per.get('S_NUM')} +"'name='shop'><label for='select"+${per.get('S_NUM')}+"'>"+${per.get('S_NUM')}+"회&nbsp"+"${per.get('S_STARTTIME')}"+"</label>&nbsp")
		}
	</c:forEach>
</c:forEach>
</c:if> } 

const disabled = () =>{
    const d = document.querySelectorAll(".day")   
 
    for(var i=0;i<d.length;i++){
    
        const today = new Date();
        const day = d[i].getAttribute("data-fdate");
        const day2 = new Date(day);
       function getDayOfWeek(){ 

        
        const week = ['일', '월', '화', '수', '목', '금', '토'];
        const dayOfWeek = week[day2.getDay()];

        return dayOfWeek;

        }
       
       <c:if test="${not empty performance }">
			<c:forEach var="per" items="${performance }">
	            if(getDayOfWeek()=="${per.get('S_DAY')}"&&day2>today&&day2<new Date("2023-03-11")){
	                d[i].addEventListener('click', selectDay);
	                d[i].addEventListener('click', turn);
	                d[i].setAttribute("style","color:black");
	            }
            </c:forEach>
        </c:if>
         
       
         }

    }
    disabled();
    $btnPrev.addEventListener('click',disabled);
	$btnNext.addEventListener('click', disabled);
	const nextPage = () =>{
	const day = document.querySelector(".day-active");
	//console.log(day.getAttribute("data-fdate"));
	const day2 = new Date(day.getAttribute("data-fdate"));
	//console.log(day2);
	//console.log("${performance.get(0).get('S_DAY')}");
	 		location.assign('${path}/booking/selectSeat.do'); 
	}
	
 	
 	
</script>

