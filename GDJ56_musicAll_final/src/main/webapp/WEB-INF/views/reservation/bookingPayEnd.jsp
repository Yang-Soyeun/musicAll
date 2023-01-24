<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<link href="${path}/resources/css/reservation/selectSeat.css" rel="stylesheet">
<script>
	alert("${msg}");
</script>
 <div class="wrap">
            <div class="box">
                <h2><b>뮤지컬 예매완료</b></h2>
                <div><img src="${path }/resources/images/reservation/티켓.png" width="200px"></div>
                <h1><b>Thank You</b></h1><br><br>
                <div id="contents" style="text-align:left;padding:10px;font-size:1.2em;">
                    <div id="detail">
                    공연일자 : ${info[2] }  <br><br>
                    공연 시간 : ${info[3] }<br><br>
                    가격 : ${info[4] }원
                    </div>
                    <div id="detail2">
                        공연명 : ${title } <br><br>
                        좌석 : 
                        <c:forEach var="s" begin="7" end="${fn:length(info)-1}">      
                        	  ${info[s]}&nbsp; 
                        </c:forEach>
                    </div>
                </div> 
                <button class="btn btn-danger" style="background-color:#A50000; width:150px;margin-left:-1%;margin-top:10%;font-size:15px;" type="button" onclick="location.replace('${path}')">홈으로</button>
            </div>    
      </div>
     


        <style>


        .wrap{
            width: 100%;
            text-align: center;
        } 
        .box{ 
            display: inline-block;
            margin-top:10%;
        }
            h2:after {
        content: "";
        display: block;
        width: 700px;
        border-bottom: 1px solid gray;
        margin : 10px ;
        }

        #contents{
            border : 1px gray solid;
            width : 700px;
            height : 200px;

        }

        #detail{
            width:320px;
            border-right : 1px gray solid;
            margin: 10px;
            float:left;


        }
        #detail2{
            width:300px;
            display:inline-block;
            height:145px;
            margin: 10px;


        }
        </style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>