<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
        <table class="question">
            <caption class="qtit"><b style="font-size:20px; margin-left:20px;">공연등록</b></caption>
            <tr>
                <th class="th" scope="row"><b>공연 제목</b></th>
                    <td><input type="text" name="perTitle" class="wid53" title="이메일" placeholder="ex : 마틸다"></td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 타입</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="radio" name="perType" id="original" value="오리지널">
                                오리지널 내한공연 </label>
                        <label>
                            <input type="radio" name="perType" id="license" value="라이센스">
                                라이센스 </label>
                        <label>
                            <input type="radio" name="perType"  id="makeMusical" value="창작뮤지컬">
                                창작뮤지컬  </label>
                        <label>
                            <input type="radio" name="perType"  id="nonverbal" value="넌버벌">
                                넌버벌 퍼포먼스 </label>
                        <label>
                            <input type="radio" name="perType"  id="child" value="아동">
                                아동 </label>
                        </p>
                    </td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 관람가능 연령</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="age" value="전체관람가" id="allCan">
                                전체관람가 </label>
                        <label>
                            <input type="radio" name="age" value="8세이상" id="overEight">
                                8세 이상 </label>
                        <label>
                            <input type="radio" name="age" value="12세이상" id="overTwelve">
                                12세 이상 </label>
                        <label>
                            <input type="radio" name="age" value="15세이상" id="overFifteen">
                                15세 이상 </label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 요일, 공연 시간</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="checkbox" name="mon" id="mon" value="월">
                                월 
                        </label>1회차:&nbsp;<input type="text" id="mon_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="mon_time2" class="time1" name="startTime2" class="form-control" style="width:140px;">
                        <br>
                        <label>
                            <input type="checkbox" name="tues" id="tues" value="화">
                                화 
                        </label>1회차:&nbsp;<input type="text" id="tues_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="tues_time2" class="time1" name="startTime2" class="form-control" style="width:140px;">
                        <br>
                        <label>
                            <input type="checkbox" name="wends" id="wends" value="수">
                                수  
                        </label>1회차:&nbsp;<input type="text" id="wends_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="wends_time2" class="time1" name="startTime2" class="form-control" style="width:140px;">
                        <br>
                        <label>
                            <input type="checkbox" name="thurs" id="thurs" value="목">
                                목 
                        </label>1회차:&nbsp;<input type="text" id="thurs_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="thurs_time2" class="time1" name="startTime2" class="form-control" style="width:140px;">
                        <br>
                        <label>
                            <input type="checkbox" name="fri" id="fri" value="금">
                                금 
                        </label>1회차:&nbsp;<input type="text" id="time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="time1" class="time1" name="startTime2" class="form-control" style="width:140px;">
                        <br>
                        <label>
                            <input type="checkbox" name="sature" id="sature" value="토">
                                토 
                        </label>1회차:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime2" class="form-control" style="width:140px;">
                       <br>
                       <label>
                            <input type="checkbox" name="sun" id="sun" value="일">
                                일 
                      </label>1회차:&nbsp;<input type="text" id="sun_time1" class="time1" name="startTime1" class="form-control" style="width:140px;">
                        		2회차:&nbsp;<input type="text" id="sun_time2" class="time1" name="startTime2" class="form-control" style="width:140px;">                         
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 기간</b></th>
                    <td>              
                        <input type="text" name="daterange" style="width:200px;"/>
                    </td>
                    <!-- <td><input type="text" size="10" title="우편번호" readonly style='cursor:pointer'> -&nbsp; <input type="text" size="10" title="우편번호" readonly style='cursor:pointer'>
                        <span class="button"><a href="#">우편번호찾기</a></span><br>
                        <input type="text" class="add wid53"   name="address" id="address"  maxlength="80">
                    </td> -->
                </tr>
                 <tr>
                    <th class="th" scope="row"><b>공연 상영시간</b></th>
                    <td>              
                        <input type="text" name="watchTime" placeholder="ex)120" style="width:200px;"/>분
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 장소</b></th>
                        <td><input type="text" name="perPlace" class="wid53" placeholder="ex :예술의 전당 CJ 토월극장"></td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 가격</b>
                    <td>
                        <p>VIP석:</p><input type="text" name="vipPrice" class="wid53"  placeholder="ex :150000" style="width:200px;">원
                        <p>R석:</p><input type="text" name="rPrice" class="wid53"  placeholder="ex :150000" style="width:200px;">원
                        <p>S석:</p><input type="text" name="sPrice" class="wid53"  placeholder="ex :150000" style="width:200px;">원
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 메인포스터</b>
                    <td>
                        <input type="file" name="upFile" onchange="readURL(this);" >
                        <br /><br />
                        <img id="preview" style="width:300px; height: 400px;"/>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 상세정보</b>
                    <td>
                        <input type="file" name="upFile2" onchange="readURL2(this);" >
                        <br /><br />
                        <img id="preview2" style="width:300px; height: 400px;"/>
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
            $('input[name="daterange"]').daterangepicker();
            
            //timepicker
            $(function() {
                $(".time1").timepicker({
                    timeFormat: 'h:mm p',
                    interval: 60,
                    minTime: '10',
                    maxTime: '9:00pm',
                    defaultTime: '10',
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
            	$('input:checked').each((i,e)=>{
					form.append("perDay",
							$(e).val()+","+$(e).parent().next().val()
							+","+$(e).parent().next().next().val())            		
            	})
            	
        		
        		const sumnail=$("input[name=upFile]")[0].files;
				const file=$("input[name=upFile2]")[0].files;
        		
				//썸네일
				$.each(sumnail,(i,v)=>{
					form.append("upFile"+i,v);
				});
				
				//일반사진 
				$.each(file,(i,v)=>{
 					form.append("upFile2"+i,v);
 				});
				
 				var perTitle=$("input[name=perTitle]").val();
 				var perType=$("input[name=perType]:checked").val();
 				var age=$("input[name=age]:checked").val();
				
 				//var mon=$("#mon:checked").val();
 				//var tues=$("#tues:checked").val();
 				//var wends=$("#wends:checked").val();
 				//var thurs=$("#thurs:checked").val();
 				//var fri=$("#fri:checked").val();
 				//var sature=$("#sature:checked").val();
 				//var sun=$("#sun:checked").val();
				
 				var daterange=$("input[name=daterange").val(); 
 				var watchTime=$("input[name=watchTile]").val();
 				var perPlace=$("input[name=perPlace").val();
 				var vipPrice=$("input[name=vipPrice]").val();
 				var rPrice=$("input[name=rPrice").val();
 				var sPrice=$("inputname=sPrice").val();
				
 				form.append("perTitle",perTitle);
 				form.append("perType",perType);
 				form.append("age",age);
 				form.append("aniName",aniName);
				
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
 				form.append("watchTime",watchTime);
 				form.append("perPlace",perPlace);
 				form.append("vipPrice",vipPrice);
 				form.append("rPrice",rPrice);
 				form.append("sPrice",sPrice);
				

 				if(sumnail.length<1){
 					 if(file.length<1){
					   $.ajax({
						url :"${path}/adminPerfor/insertPerformance.do",
						data : form,
						type : "post",
						contentType:false,
						processData:false,
						success : e=>{
							 console.log(e.msg);	 
							 console.log(e.loc); 
							var loc2 = e.loc;
							alert(e.msg);
							 location.replace('${path}/adminPerfor/'+loc2);
								alert("공연등록 성공");
								$("#upFile2").val("");
						},
						error:(r,m,e)=>{
									alert("공연등록 실패!다시 등록해주세요.");
								}
					 	}) 
 					}else{
 						alert("사진을 첨부해주세요.");
 					}
 				}else{
 					alert("대표이미지를 설정해야 합니다.");
 				}
				
				
        	};
        
           
            
        </script>
</section>
</body>