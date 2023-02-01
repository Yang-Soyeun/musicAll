<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="sDay" value="${sdayMap.keySet() }"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<section>

    <style>
        /* Form */
        
        .question{width:100%;border-top:2px solid #bdbdbd;border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;}
        .question .qtit{text-align:left; margin:50px 0 10px 0;}
        .question tr{border-top:1px solid #cdcdcd;}
        .question tr:first-child{border-top:0;}
        .question th{background:#f6f6f6; width:20%;text-align:left; padding-left:3%}
        .question td{text-align:left;background:#fff;padding-top:1%!important;padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
        .question input[type="text"],
        .question select{margin-right:1%;color:#5c5c5c;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;}
        .question select{padding:0.9%;}
        .question textarea{vertical-align:middle;border:1px solid #cdcdcd; width:94%; height:100px;background:#f6f6f6;padding:1%}
        .question label{margin-right:1%;}
        .question .button{margin-right:1%;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#5e5e5e;vertical-align:middle;border:1px solid #5e5e5e;padding:1%; cursor:pointer;}
        .question .button a{color:#fff;}
        .question .add{margin-top:1%;}
        .question .wid10{width:10%;}
        .question .wid20{width:20%;}
        .question .wid30{width:30%;}
        .question .wid53{width:49%;}
        
        .btngreen{margin-top:30px;}
        .btngreen a{width:8%;margin:0 auto;display:block;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#fff;border:1px solid #FF8000;border-radius:2em;background:#FF8000; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
        .btngreen a:hover{background:#fff;color:#FF8000;}
    </style>
        
        <!-- Form -->
     <form id="perforFrm" action="${path }/adminPerfor/insertPerformance.do"
        method="post" enctype="multipart/form-data">
        <input type="hidden" name="mCode" value="${mCode }">
        <table class="question">
            <caption class="qtit"><b style="font-size:20px; margin-left:20px;">공연정보 수정</b></caption>
            <tr>
                <th class="th" scope="row"><b>공연 제목</b></th>
                    <td><input type="text" name="mTitle" class="wid53" title="이메일" value="${musical.getMTitle() }"></td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 타입</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="radio" name="mType" id="original" value="오리지널" ${musical.getMType().equals("오리지널")?"checked":"" }>
                                오리지널 내한공연 </label>
                        <label>
                            <input type="radio" name="mType" id="license" value="라이센스" ${musical.getMType().equals("라이센스")?"checked":"" }>
                                라이센스 </label>
                        <label>
                            <input type="radio" name="mType"  id="makeMusical" value="창작뮤지컬" ${musical.getMType().equals("창작뮤지컬")?"checked":"" }>
                                창작뮤지컬  </label>
                        <label>
                            <input type="radio" name="mType"  id="nonverbal" value="넌버벌" ${musical.getMType().equals("넌버벌")?"checked":"" }>
                                넌버벌 퍼포먼스 </label>
                        <label>
                            <input type="radio" name="mType"  id="child" value="아동" ${musical.getMType().equals("아동")?"checked":"" }>
                                아동 </label>
                        </p>
                    </td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 관람가능 연령</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="mAge" value="전체관람가" id="allCan" ${musical.getMAge().equals("전체관람가")?"checked":"" }>
                                전체관람가 </label>
                        <label>
                            <input type="radio" name="mAge" value="8세이상" id="overEight" ${musical.getMAge().equals("8세이상")?"checked":"" }>
                                8세 이상 </label>
                        <label>
                            <input type="radio" name="mAge" value="12세이상" id="overTwelve" ${musical.getMAge().equals("12세이상")?"checked":"" }>
                                12세 이상 </label>
                        <label>
                            <input type="radio" name="mAge" value="15세이상" id="overFifteen" ${musical.getMAge().equals("15세이상")?"checked":"" }>
                                15세 이상 </label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 요일, 공연 시간</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="checkbox" name="mon" id="mon" value="월" 
                            ${sDay.contains("월")?"checked":"" }>
                                월 
                        </label>1회차:&nbsp;<input type="text" id="mon_time1" class="time1" name="startTime1" class="form-control" style="width:140px;" 
                        					value="${sdayMap.get('월').size()>0?sdayMap.get('월').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="mon_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('월').size()==2?sdayMap.get('월').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="tues" id="tues" value="화" 
                            ${sDay.contains("화")?"checked":"" }>
                                화 
                        </label>1회차:&nbsp;<input type="text" id="tues_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('화').size()>0?sdayMap.get('화').get(0).SStartTime:''}" >
                        		2회차:&nbsp;<input type="text" id="tues_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('화').size()==2?sdayMap.get('화').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="wends" id="wends" value="수"
                            ${sDay.contains("수")?"checked":"" } >
                                수  
                        </label>1회차:&nbsp;<input type="text" id="wends_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        				value="${sdayMap.get('수').size()>0?sdayMap.get('수').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="wends_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        				value="${sdayMap.get('수').size()==2?sdayMap.get('수').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="thurs" id="thurs" value="목" 
                            ${sDay.contains("목")?"checked":"" }>
                                목 
                        </label>1회차:&nbsp;<input type="text" id="thurs_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('목').size()>0?sdayMap.get('목').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="thurs_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('목').size()==2?sdayMap.get('목').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="fri" id="fri" value="금" 
                            ${sDay.contains("금")?"checked":"" }>
                                금 
                        </label>1회차:&nbsp;<input type="text" id="time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('금').size()>0?sdayMap.get('금').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="time1" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('금').size()==2?sdayMap.get('금').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="sature" id="sature" value="토" 
                            ${sDay.contains("토")?"checked":"" }>
                                토 
                        </label>1회차:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('토').size()>0?sdayMap.get('토').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('토').size()==2?sdayMap.get('토').get(1).SStartTime:''}">
                       <br>
                       <label>
                            <input type="checkbox" name="sun" id="sun" value="일" 
                            ${sDay.contains("일")?"checked":"" }>
                                일 
                      </label>1회차:&nbsp;<input type="text" id="sun_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                      						value="${sdayMap.get('일').size()>0?sdayMap.get('일').get(0).SStartTime:''}">
                        		2회차:&nbsp;<input type="text" id="sun_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('일').size()==2?sdayMap.get('일').get(1).SStartTime:''}">                         
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 기간</b></th>
                    <td>              
                        <input type="text" id="daterange" name="daterange" style="width:200px;" value="${musical.getMPeriod()}-${musical.getMPeriodEnd()}"/>
                    </td>
                    <!-- <td><input type="text" size="10" title="우편번호" readonly style='cursor:pointer'> -&nbsp; <input type="text" size="10" title="우편번호" readonly style='cursor:pointer'>
                        <span class="button"><a href="#">우편번호찾기</a></span><br>
                        <input type="text" class="add wid53"   name="address" id="address"  maxlength="80">
                    </td> -->
                </tr>
                 <tr>
                    <th class="th" scope="row"><b>공연 상영시간</b></th>
                    <td>              
                        <input type="text" name="sTime" value="${schedule.get(0).getSTime() }" style="width:200px;"/>분
                    </td>
                </tr>
                <tr>
                <th class="th" scope="row"><b>공연 장소</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="perPlace" value="예술의 전당" id="artPalace" ${musical.getHName() .equals("예술의 전당")? "checked":""}>
                                 예술의 전당</label>
                        <label>
                            <input type="radio" name="perPlace" value="블루스퀘어" id="blueSquare" ${musical.getHName() .equals("블루스퀘어")? "checked":""}>
                                 블루스퀘어</label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 가격</b>
                    <td>
                        <p>VIP석:</p><input type="text" name="vipPrice" class="wid53"  value="${musical.getVipPrice() }" style="width:200px;">원
                        <p>R석:</p><input type="text" name="rPrice" class="wid53"  value="${musical.getSPrice() }" placeholder="ex :150000" style="width:200px;">원
                        <p>S석:</p><input type="text" name="sPrice" class="wid53"  value="${musical.getRPrice() }" placeholder="ex :150000" style="width:200px;">원
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 메인포스터</b>
                    <td>
                        <input type="file" name="upFile" onchange="readURL(this);" >
                        <br /><br />
                        <img id="preview" style="width:300px; height: 400px;"  src="${path }/resources/upload/performance/${photo.get(0).IName}"/>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 상세정보</b>
                    <td>
                        <input type="file" name="upFile2" onchange="readURL2(this);"> 
                        <br /><br />
                        <img id="preview2" style="width:300px; height: 400px;" src="${path }/resources/upload/performance/${photo.get(1).IName}"/>
                    </td>
                </tr>
                

          </table>

              <div class="btngreen">
                  <a href="javascript:chk_form(event);" id="enrollPer" class="Btn" >신청하기</a>
              </div>
        <!-- //Form -->    
      </form>
        <script>
            //daterangepicker
            //$('input[name="daterange"]').daterangepicker();
            $("#daterange").daterangepicker({
            	locale:{
            		"format": 'YY/MM/DD'}
            		
            });
            
            //timepicker
            $(function() {
                $(".time1").timepicker({
                    timeFormat: 'h:mm p',
                    interval: 60,
                    minTime: '10',
                    maxTime: '11:00pm',
                    defaultTime: '00:00',
                    startTime: '12:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true        
                });
            });

            // 썸네일
            function readURL(input) {
	            if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
			        document.getElementById('preview').src = e.target.result;
		            };
		        reader.readAsDataURL(input.files[0]);
	            } else {
		            document.getElementById('preview').src = "";
	            }
            }
            
            //상세정보
            function readURL2(input) {
	            if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
			        document.getElementById('preview2').src = e.target.result;
		            };
		        reader.readAsDataURL(input.files[0]);
	            } else {
		            document.getElementById('preview').src = "";
	            }
            }
            
            //ajax로 받은 데이터 보내기! 
            //$("#enrollPer").click(e=>{
            const chk_form=(e)=>{	
            	
        		
        		let form=new FormData();
        		console.log($('input[type=checkbox]:checked'));
        		
            	$('input[type=checkbox]:checked').each((i,e)=>{
					form.append("perDay",
							$(e).val()+"-"+$(e).parent().next().val()
							+"-"+$(e).parent().next().next().val())            		
				
            	});
            	 
            
            	
        		const upFile=$("input[name=upFile]")[0].files;
				const upFile2=$("input[name=upFile2]")[0].files;
        		
				//썸네일
				$.each(upFile,(i,v)=>{
					form.append("upFile"+i,v);
				});
				
				//일반사진 
				$.each(upFile2,(i,v)=>{
 					form.append("upFile2"+i,v);
 				});
				
 				var mTitle=$("input[name=mTitle]").val();
 				var mType=$("input[name=mType]:checked").val();
 				var mAge=$("input[name=mAge]:checked").val();
				
 				//var mon=$("#mon:checked").val();
 				//var tues=$("#tues:checked").val();
 				//var wends=$("#wends:checked").val();
 				//var thurs=$("#thurs:checked").val();
 				//var fri=$("#fri:checked").val();
 				//var sature=$("#sature:checked").val();
 				//var sun=$("#sun:checked").val();
				
 				var daterange=$("input[name=daterange]").val(); 
 				var sTime=$("input[name=sTime]").val();
 				var perPlace=$("input[name=perPlace]:checked").val();
 				var vipPrice=$("input[name=vipPrice]").val();
 				var rPrice=$("input[name=rPrice]").val();
 				var sPrice=$("input[name=sPrice]").val();
				var mCode=$("input[name=mCode]").val();
				console.log(mCode);
 				form.append("mTitle",mTitle);
 				console.log(mTitle);
 				form.append("mType",mType);
 				console.log(mType);
 				form.append("mAge",mAge);
 				form.append("mCode",mCode);
 			
				
// 				if(mon=="월"){
// 					 form.append("mon",mon);
// 				}
// 				if(tues=="화"){
// 					 form.append("tues",tues);
// 				}
// 				if(wends=="수"){
// 					 form.append("wends",wends);
// 				}
// 				if(thurs=="목"){
// 					 form.append("thurs",thurs);
// 				}
// 				if(fri=="금"){
// 					 form.append("fri",fri);
// 				}
// 				if(sature=="토"){
// 					 form.append("sature",sature);
// 				}
// 				if(sun=="일"){
// 					 form.append("sun",sun);
// 				}
				
// 				form.append("mon_time1",mon_time1);
// 				form.append("mon_time2",mon_time2);
// 				form.append("tues_time1",tues_time1);
// 				form.append("tues_time2",tues_time2);
// 				form.append("wends_time1",wends_time1);
// 				form.append("wends_time2",wends_time2);
// 				form.append("thurs_time1",thurs_time1);
// 				form.append("thurs_time1",thurs_time1);
// 				form.append("fri_time1",fri_time1);
// 				form.append("fri_time2",fri_time2);
// 				form.append("sature_time1",sature_time1);
// 				form.append("sature_time2",sature_time2);
// 				form.append("sun_time1",sun_time1);
// 				form.append("sun_time2",sun_time2);
				
 				form.append("daterange",daterange);
 				console.log(daterange);
 				form.append("sTime",sTime);
 				form.append("perPlace",perPlace);
 				console.log(perPlace);
 				form.append("vipPrice",vipPrice);
 				form.append("rPrice",rPrice);
 				form.append("sPrice",sPrice);
 				console.log(daterange);
 				console.log(form); 
 				//if(sumnail.length<1){
 				//if(file.length<1){
 					
 				//var form = $('perforFrm')[0];
 				
 				
 				//let form = document.getElementById('perforFrm');
 				
 				
 				console.log("344 form : "+form);
 				//var formData = new FormData(form);
 				
 				/* console.log("346 formData : "+formData);
 				for (let key of formData.keys()) {
 					console.log(key, ":", formData.get(key));
 				}
 				console.log("348"); */
 				
 				
 				$.ajax({
 					type:"post",
 					enctype:'multipart/form-data',
 				    url:'${path}/adminPerfor/updatePerformance.do',
 				    data:form,
 				    dataType:'json',
 				  
 				    processData:false,
 				    contentType:false,
 				    cache:false,
 				    success:function(data){
 				   		alert("공연 수정 성공! 리스트로 돌아갑니다:)");
					 	location.replace("${pageContext.request.contextPath}/adminPerfor/performanceList.do");		
 				    },
 				    error:function(e){
 				        alert("수정실패, 다시 시도해주세요! ");
 				        console.log(${mCode});
 				       //location.replace("${pageContext.request.contextPath}/adminPerfor/performanceList.do");
 				    }
 				});	
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 				
				
				
        	};
        
           
            
        </script>
</section>
</body>