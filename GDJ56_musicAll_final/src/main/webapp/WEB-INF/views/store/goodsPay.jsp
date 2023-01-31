<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<style>


	.payForm {
			display: grid;
			justify-content: center;
			margin-left: 14%;
			margin-top: 3%;
			background: #e5e5e5;
			height: 844px;
			padding: 4%;
			width: fit-content;
			border-radius: 1%;
	}

  #icon{
                    
        font-size:2.0rem;
        border-bottom : gray solid 1px;
        padding:1%;

    }

    
    #ticketing{
        font-size:1.5rem;
        padding:5%;
        

    }

    #point{
        background-color: #F2F2F2;
        height: 62px;
        width: 790px;
        padding:2%;
        display:inline-flex;
       

    }

    #point>div{
        margin-left:5%;
        margin-bottom: -1%;

    }
</style>
<div id="ticketing">
        <div id="icon">
            <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:33%;"/><b style="color:gray">상품 구매</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
            <img src="${path }/resources/images/reservation/아이콘.png" width="50px" height="50px" style="margin-top:-1%;margin-left:6%;"><b style="color:black">결제하기</b>
        </div>
		<div style="margin-left:10%;">
		
			<div style="margin-left:29%; padding:1%; font-size:2.0rem; color: black; width: 28%;">
				<div style="margin-bottom: 2%; display: flex; justify-content: center; padding: 2%;">
					<div style="margin-right:2%; margin-top:1%;">
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-bag-heart-fill" viewBox="0 0 16 16">
						  <path d="M11.5 4v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5ZM8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1Zm0 6.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
						</svg>
					</div>
					<b><c:out value="${goods.gdName }"/></b>
				</div>
				<c:forEach var="i" items="${img }">
       				<c:if test="${i.sumImage.equals('ok') }">
						<div><img src="${path }/resources/upload/goods/${i.imName }" id="countimg1"></div>
					</c:if>
				</c:forEach>			
			</div>
			
			<div class="payForm">
			
				<h4>구매자</h4>
				<input type="text" value="수빈" style="border: none;"/>
				
				<br>
				
				<h4>전화번호</h4>
				<input type="text" value="010-1111-2222" style="border: none;"/>
				
				<br>
				
				<div>
				<div style="float: left;"><h4>상품금액</h4></div>
				<div style="margin-top: -2.1%;margin-left: 14%;"><h3><input type="text" value="${goods.gdPrice }원" style="border: none;"/></h3></div>
				</div>
				
				<div style="">
        			<div style=""><h4>포인트 사용</h4></div>
			        <div id="point">
			            <div>총 포인트&nbsp;&nbsp;&nbsp;<input type="text" value="${point.mpPoint==null?0:point.mpPoint }" readonly></div>
			            <div style="">사용할 포인트&nbsp;&nbsp;&nbsp;<input type="number" style="width:186px;" min="0" max="5000" class="point" >&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" onclick="apply();"style="background-color:lightgray;color:black;margin-top:-1%;font-size:15px;">적용</button></div>
			        </div>
			        <div><br><h4>총 결제 금액</h4><br>
			            <div style="">수량 : &nbsp;&nbsp;  할인 가격:&nbsp;<span class="discount">0</span></div>
			            <div style="font-size:20px;"><p><b>총 금액</b>&nbsp;&nbsp;<b style="color:red;" class="price"><fmt:formatNumber value="" pattern="#,###" />원</b></p></div>
			            <div style="" class="point2"></div>
			        </div>
        
    			</div>
		        
		        <div style="margin-top:7%; margin-left: 29%;">
		            <button class="btn btn-danger" style="width:200px; font-size:15px;" type="button" >결제완료</button>
		            <button class="btn btn-secondary" style="width:110px;background-color:lightgray;color:black;font-size:15px;">취소</button>
		        </div>
	        </div>
    	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>