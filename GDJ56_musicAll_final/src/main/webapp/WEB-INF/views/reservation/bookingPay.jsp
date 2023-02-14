<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<body onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
<style>


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
        height: 60px;
        width:800px;
        margin-left : 15%;
        padding:1%;
        display:inline-flex;
       

    }

    #point>div{
        margin-left:5%;
        margin-bottom: -1%;

    }
</style>

<div id="ticketing">
        <div id="icon">
            <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:15%;"/><b style="color:gray">뮤지컬 예매</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
            <img src="${path }/resources/images/reservation/아이콘3.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"/><b style="color:gray">좌석 선택</b><img src="${path }/resources/images/reservation/아이콘2.jpg" width="30px" style="margin-top:-5px;margin-left:100px;">
            <img src="${path }/resources/images/reservation/아이콘.png" width="50px" height="50px" style="margin-top:-1%;margin-left:8%;"><b style="color:black">결제하기</b>
        </div>
		<div style="margin-left:10%;">
        <div style="margin-left:10%;padding:1%;"><img src="${path }/resources/images/reservation/포인트.png" width="500px"></div>
        <div id="point">
            <div>총 포인트&nbsp;&nbsp;&nbsp;<input type="text" value="${point.mpPoint==null?0:point.mpPoint }" readonly></div>
            <div style="margin-left:5%;">사용할 포인트&nbsp;&nbsp;&nbsp;<input type="number" style="width:186px;" min="0" max="5000" class="point" >&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" onclick="apply();"style="background-color:lightgray;color:black;margin-top:-1%;font-size:15px;">적용</button></div>
        </div>
        <div><br><img src="${path }/resources/images/reservation/결제.png"  width="200px" style="margin-left:12.2%;padding:1%;"><br>
            <div style="margin-left:14%;">티켓수량 : ${fn:length(seatArr)}&nbsp;&nbsp;  할인 가격:&nbsp;<span class="discount">0</span></div>
            <div style="margin-left:50%;font-size:20px;"><p><b>총 금액</b>&nbsp;&nbsp;<b style="color:red;" class="price"><fmt:formatNumber value="${money }" pattern="#,###" />원</b></p></div>
            <div style="margin-left:48%;" class="point2"></div>
        </div>
        <div style="margin-top:7%;margin-left:27%;">
            <button class="btn btn-danger" style="width:200px;margin-left:5%;font-size:15px;" type="button" onclick="requestPay();">결제완료</button>
            <button class="btn btn-secondary" style="width:110px;background-color:lightgray;color:black;font-size:15px;">취소</button>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
 	
	$(".point2").html('※ 적립 예정 포인트 : '+((${money})/10).toLocaleString('ko-KR')); 
	
	const apply = () =>{	
		const discount=(Number)($(".point").val());
		const userPoint = ${point.mpPoint==null?0:point.mpPoint }
		if(discount>userPoint){
			alert("포인트가 부족합니다.");
			$(".point").val('');
			return;
		}
		$(".discount").html(discount);
		$(".price").html((${money}-discount).toLocaleString('ko-KR')+"원");
		$(".point2").html('※ 적립 예정 포인트 : '+((${money}-discount)/10).toLocaleString('ko-KR')); 
		
	}
	
	const requestPay = () =>{
		<c:if test="${loginMember==null }">
			alert("로그인 후 이용해주세요.");
		</c:if>
		<c:if test="${loginMember!=null }">
			const discount=(Number)($(".point").val());
			IMP.init("imp28146203");
			IMP.request_pay({
				pg : "html5_inicis",
				name : "티켓예매",
				pay_method : "card",
				amount : ${money}-discount,
				buyer_name:"${loginMember.name}",
				buyer_email:"${loginMember.email}"
			}, function(rsp){
				
				const discount=(Number)($(".point").val());
				const amount = ${money}-discount;
		
				if(rsp.success){
					
					let info = new Array();
					
					info.push(${loginMember.member_No});
					info.push(${info[0]});
					info.push("${info[1]}");
					info.push("${info[2]}");
					info.push(amount);
					info.push(rsp.imp_uid);
					info.push(rsp.merchant_uid);
					info.push((Number)($(".point").val()));
					info.push("${fn:join(seatArr,",")}");
					
					location.assign("${path}/booking/payend.do?info="+info);
				}
			else{
			 
				alert(rsp.error_msg);
			}
		});
		</c:if>
}	

	function noBack(){window.history.forward();}

	
</script>