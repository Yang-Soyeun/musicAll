<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/performance/performanceView.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section>
<div id="title-box">
        <p>라이센스 뮤지컬 - 1위</p>
        <br>
        <strong style="font-size:30px;">브로드웨이 42번가</strong>
        <form name="myform" class="myform" method="post" action="./save">
            <fieldset>
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
                <img src="${path }/resources/images/performance/42bunga.png" id="imgView" style="margin-top:-500px;">
            </div>
            <div class="info-box2" >
                <b class="info">공연기간</b><p>2022.11.05 ~ 2023.01.15</p><br>
                <b class="info">공연시간</b><p>14:00 ~ 16:30 (160분)</p><br>
                <b class="info">관람연령</b><p>8세 이상</p><br>
                <b class="info">가격</b><p>원</p><br>
                <b class="info">장소</b><p>예술의 전당 CJ 토월극장</p><br><br>
                <button class="btn btn-danger" id="go1" onclick="location.href='${path}/booking/bookingview.do'">예매하러 가기</button><br>
                <button class="btn btn-danger" id="go2">관심공연 등록</button>
                
            </div>
        </div>

        <div id="downContainer">
            <ul>
                <li><a href="#" id="perInfo" style="font-size: 20px;">공연정보</a></li>
                <li><a href="#" id="Comment" style="font-size: 20px;">한줄평</a></li>
            </ul>
        </div>

        <div id="detailInfo"><!--상세정보-->
            <img src="${path }/resources/images/performance/detail.jpg" width="800" height="2000" style="margin-left: 550px;">
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
                <p style="font-size: 16px;">정말 재밌게 봤습니다.</p>
                <p style="font-size: 13px;">2023.01.13&nbsp;&nbsp;&nbsp;즐거운 인생</p>
            </div>
        </div>
    </div>
</section>
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


    <br>
    <br>
    <br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>