<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
<style>
	#title-box{
    			margin-top: 10px;
        		margin-left: 500px;
        	  }
    .myform fieldset{
            		display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
            		direction: rtl; /* 이모지 순서 반전 */
            		border: 0; /* 필드셋 테두리 제거 */
        			}
        .myform fieldset legend{
            text-align: left;
        }
        .myform input[type=radio]{
            display: none; /* 라디오박스 감춤 */
        }
        .myform label{
            font-size: 1.5em; /* 이모지 크기 */
            color: transparent; /* 기존 이모지 컬러 제거 */
            text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
        }
        .myform label:hover{
            text-shadow: 0 0 0 #a00; /* 마우스 호버 */
        }
        .myform label:hover ~ label{
            text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에 오는 이모지들 */
        }
        .myform input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
        }
        .myform2 fieldset{
            display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
            direction: rtl; /* 이모지 순서 반전 */
            border: 0; /* 필드셋 테두리 제거 */
        }
        .myform2 fieldset legend{
            text-align: left;
        }
        .myform2 input[type=radio]{
            display: none; /* 라디오박스 감춤 */
        }
        .myform2 label{
            font-size: 1em; /* 이모지 크기 */
            color: transparent; /* 기존 이모지 컬러 제거 */
            text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
        }
        .myform2 label:hover{
            text-shadow: 0 0 0 #a00; /* 마우스 호버 */
        }
        .myform2 label:hover ~ label{
            text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에 오는 이모지들 */
        }
        .myform2 input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
        }
        #info-box{
            margin-left: 500px;
            width: 900px;
            height: 650px;
            background-color: #E6E6E6;
        }
        #imgView{
            width: 300px;
            height: 450px;
            margin-top: -600px;
            margin-left: 60px;
        }
        .info{
            line-height: 1;
            font-size: 18px;
        }
        .info-box2{
            margin-top: 50px;
            margin-left: 150px;
            display: inline-block;
        }
        .info-box3{
            margin-top: 40px;
            margin-left: 50px;
            display: inline-block;

        }
        .go{
            margin-top: 15px;
            width: 300px;
            height: 30px;
            font-size: 15px;
            background-color: #a50000;
            color: white;
        }
        
        #downContainer a{
            font-size: 25px;
            /*margin-left: 350px;*/
            text-decoration: none;/*a href 밑줄 등 글자 꾸밈 없음*/
            color: #6E6E6E;
            line-height: 40px;
        }
        #downContainer{
            margin-left: 300px;
            margin-top: 20px;
            text-align: center;/*중앙정렬*/
            padding: 20px 0 20px 0;
        }
        #downContainer li {
            display: inline-block;/*여백 없이 좌측으로 붙은 li*/
            padding: 0 40px 0 0;
            margin-left: 200px;
            
        }
          
        #downContainer a:after {/*after 가상요소*/
           /*a요소를 블록 요소라고 선언*/
             /*width:70px;/*카테고리 메뉴 밑줄의 크기를 동일하게 주기 위해 width 설정*/
              /* 혹시 a요소 크기만큼 생기길 바란다면 width 삭제 */ 
            content: '';/*content안은 밑줄 디자인을 위해 비워두세요.*/
            border-bottom: solid 2px #6E6E6E;
            transform: scaleX(0);/*크기를 0으로 줌으로써 평상시엔 밑줄 없음*/
            transition: transform 250ms ease-in-out; /*변형 방식*/
        }
        #downContainer a:hover:after {
            transform: scaleX(1);/*a 속성에 hover시 after를 기존 크기로 변경*/
        }

        .oneComment{
           margin-left: 500px;
           border: solid 1px #D8D8D8;
           border-radius: 15px;
           width: 900px;
           display: none;
           
        }
        #perInfo{
            margin-left: -540px;
            
        }
        #Comment{
            margin-left: -400px;
            

        }
        #starBox{
            margin-left: 30px;
        }
        .deleteComment{
            float: right;
            margin-right: 5px;
            margin-top: -20px;
            border-radius: 5px;
        }
    </style>
	<div id="title-box">
	<p>${musical }</p>
	<p>${schedule }</p>
	<p>${perPhoto }</p>
		<p>라이센스 뮤지컬 - 1위</p>
    	<strong style="font-size:30px;">${musical.getMTitle() }</strong>
        <form name="myform" class="myform" method="post" action="./save">
        	<fieldset>
        	<!-- <legend></legend> -->
            	<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
         	</fieldset>
        </form>
    </div>
	<br>
   

    <div class="parent">
        <div id="info-box">
            <div style="display:inline-block; " >
                <img src="img/42bunga.png" id="imgView">
            </div>
            <div class="info-box2" >
                <b class="info">공연기간</b><p>2022.11.05 ~ 2023.01.15</p><br>
                <b class="info">공연시간</b><p>14:00 ~ 16:30 (160분)</p><br>
                <b class="info">관람연령</b><p>8세 이상</p><br>
                <b class="info">가격</b><p>원</p><br>
                <b class="info">장소</b><p>예술의 전당 CJ 토월극장</p><br><br>
                <button class="go">공연정보 수정</button><br>
                <button class="go">공연 삭제</button>
            </div>
        </div>

        <div id="downContainer">
            <ul>
                <li><a href="#" id="perInfo" style="font-size: 20px;">공연정보</a></li>
                <li><a href="#" id="Comment" style="font-size: 20px;">한줄평</a></li>
            </ul>
        </div>

        <div id="detailInfo"><!--상세정보-->
            <img src="img/detail.jpg" width="800" height="2000" style="margin-left: 550px;">
        </div>

        <div class="oneComment"><!--한줄평-->
            <div id="starBox">
                <form name="myform2" class="myform2" method="post" action="./save">
                    <fieldset>
                        <legend></legend>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </form>
                <button class="deleteComment">X</button>
                <p style="font-size: 16px;">정말 재밌게 봤습니다.</p>
                <p style="font-size: 13px;">2023.01.13&nbsp;&nbsp;&nbsp;즐거운 인생</p>
            </div>
        </div>
        <br>
        <div class="oneComment"><!--한줄평-->
            <div id="starBox">
                <form name="myform2" class="myform2" method="post" action="./save">
                    <fieldset>
                        <legend></legend>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </form>
                <button class="deleteComment">X</button>
                <p style="font-size: 16px;">정말 재밌게 봤습니다.</p>
                <p style="font-size: 13px;">2023.01.13&nbsp;&nbsp;&nbsp;즐거운 인생</p>
            </div>
        </div>
        <br>
        <div class="oneComment"><!--한줄평-->
            <div id="starBox">
                <form name="myform2" class="myform2" method="post" action="./save">
                    <fieldset>
                        <legend></legend>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </form>
                <button class="deleteComment">X</button>
                <p style="font-size: 16px;">정말 재밌게 봤습니다.</p>
                <p style="font-size: 13px;">2023.01.13&nbsp;&nbsp;&nbsp;즐거운 인생</p>
            </div>
        </div>
    </div>
    <!--show and hide 클릭이벤트-->
    <script>
        $('#perInfo').click(function(){
            $("#detailInfo").show();
            $(".oneComment").hide();
        })

        $('#Comment').click(function(){
            $("#detailInfo").hide();
            $(".oneComment").show();


        })

    </script>
</section>