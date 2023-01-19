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
        <table class="question">
            <caption class="qtit"><b style="font-size:20px; margin-left:20px;">공연등록</b></caption>
            <tr>
                <th class="th" scope="row"><b>공연 제목</b></th>
                    <td><input type="text" class="wid53" title="이메일" placeholder="ex : 마틸다"></td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 타입</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_0" value="종류1">
                                오리지널 내한공연 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_1" value="종류2">
                                라이센스 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_2" value="종류3">
                                창작뮤지컬  </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_3" value="종류4">
                                넌버벌 퍼포먼스 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_3" value="종류4">
                                아동 </label>
                        </p>
                    </td>
                    <!-- <td><select lass="wid10" title="핸드폰 앞 자리 선택">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select><input type="text" title="전화번호 앞" maxlength="4" lass="wid20" /><input type="text"  title="전화번호뒤" maxlength="4" lass="wid20" /></td> -->
            </tr>
            <tr>
                <th class="th" scope="row"><b>공연 관람가능 연령</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_0" value="종류1">
                                전체관람가 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_1" value="종류2">
                                8세 이상 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_2" value="종류3">
                                12세 이상 </label>
                        <label>
                            <input type="radio" name="re_course" value="radio" id="program_3" value="종류4">
                                15세 이상 </label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 요일</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_0" value="종류1">
                                월 </label>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_1" value="종류2">
                                화 </label>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_2" value="종류3">
                                수  </label>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_3" value="종류4">
                                목 </label>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_3" value="종류4">
                                금 </label>
                        <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_3" value="종류4">
                                토 </label>
                       <label>
                            <input type="checkbox" name="re_course" value="radio" id="program_3" value="종류4">
                                일 </label>                         
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
                    <th class="th" scope="row"><b>공연 시간</b></th>
                    <td>
                      <p>
                        <label>
                          <input type="radio" name="re_course" value="radio" id="program_0" value="종류1">
                          1회차 (17:00) </label>
                        <label>
                          <input type="radio" name="re_course" value="radio" id="program_1" value="종류2">
                          2회차 (20:00) </label>
                          
                      </p>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 장소</b></th>
                        <td><input type="text" class="wid53" title="이메일" placeholder="ex :예술의 전당 CJ 토월극장"></td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 가격</b>
                    <td>
                        <p>VIP석:</p><input type="text" class="wid53" title="이메일" placeholder="ex :150000" style="width:200px;">원
                        <p>R석:</p><input type="text" class="wid53" title="이메일" placeholder="ex :150000" style="width:200px;">원
                        <p>S석:</p><input type="text" class="wid53" title="이메일" placeholder="ex :150000" style="width:200px;">원
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 메인포스터</b>
                    <td>
                        <input type="file" onchange="readURL(this);" >
                        <br /><br />
                        <img id="preview" style="width:300px; height: 400px;"/>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>공연 상세정보</b>
                    <td>
                        <input type="file" onchange="readURL2(this);" >
                        <br /><br />
                        <img id="preview2" style="width:300px; height: 400px;"/>
                    </td>
                </tr>
                

          </table>
              <div class="btngreen">
                  <a href="#" class="Btn">신청하기</a>
              </div>
        <!-- //Form -->    
        <script>

            //날짜
            $('input[name="daterange"]').daterangepicker();

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
        </script>
</section>
</body>