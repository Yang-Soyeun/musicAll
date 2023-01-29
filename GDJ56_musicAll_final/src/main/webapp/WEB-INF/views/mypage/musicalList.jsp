<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
	<section class="module">
             
       	<!-- 검색창!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<div class="container">
		 <div class="row">
		     <div class="col-sm-6 col-sm-offset-3">
		       <h1 class="module-title font-alt">공연 예매정보</h1>
		     </div>
		 </div>
		 
		 <div class="row">
		   <div class="col-sm-12">
		     <table class="table table-striped table-border checkout-table" style="text-align:center;">
		       <tbody>
		         <tr >
		           <td><b>예매번호</b></td>
		           <td><b>공연번호</b></td>
		           <td><b>공연명</b></td>
		           <td><b>예매일</b></td>
		           <td><b>공연일</b></td>
		           <td><b>환불/취소</b></td>
		           <td><b>리뷰</b></td>
		         </tr>
		         
		         <c:if test="${not empty reservationList }">
		         	<c:forEach var= "r" items="${reservationList}">
				         <tr>
				           <td>
				             <a href="${path }/mypage/musicalListView.do?member_No=${loginMember.member_No}&rCode=${r.get('R_CODE') }" >
				             	<h5 style="color:#6e1515;font-weight:800;" class="product-title font-alt"><c:out value="${r.get('R_CODE') }"/></h5>
				             </a>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><c:out value="${r.get('M_CODE') }"/></h5>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><c:out value="${r.get('M_TITLE') }"/></h5>
				           </td>
				           <td class="">
				             <h5 class="product-title font-alt"><fmt:formatDate value="${r.get('P_DATE') }" type="both" pattern="yyyy-MM-dd hh:mm"/></h5>
				           </td>
				           <td>
				             <h5 class="product-title font-alt">
				             	<fmt:formatDate value="${r.get('R_DATE') }" pattern="yyyy-MM-dd"/>
				             	<c:out value="${r.get('R_TIME') }"/>PM
				             </h5>
				           </td>
				           <td class="">
				           	<c:choose>
				           		<c:when test="${!r.containsKey('RF_CODE') }">
				             		<button id="refundCheck" class="btn btn-danger btn-circle"
				             		 onclick="fn_refund(${loginMember.member_No},${r.get('R_CODE') });">환불</button>
				             	</c:when>
				             	
				             	
				             </c:choose>
				           </td>
				           <td>
			             	<c:choose>
			             		<c:when test="${r.containsKey('REVIEW_NO') }">
			             			<button class="btn btn-warning btn-circle">리뷰 작성</button>				             		
			             		</c:when>
			             		<c:otherwise>
					             <h5 class="product-title font-alt">관람 후 작성 가능</h5>
			             		</c:otherwise>
			             	</c:choose>
				           </td>
				         </tr>
		         	</c:forEach>
		         </c:if>
		         
		         <c:if test="${empty reservationList }">
		         	<tr>
		         		<td colspan="7">공연 예매 내역이 없습니다.</td>
		         	</tr>
		         </c:if>
		         
		         <tr>
		           <td>
		             <h5 class="product-title font-alt">122</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">302</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">뮤지컬 신나</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">2023-01-15</h5>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">2023-01-22</h5>
		           </td>
		           <td class="">
		             <button class="btn btn-g btn-circle" disabled>불가</button>
		           </td>
		           <td>
		             <button class="btn btn-warning btn-circle">리뷰 작성</button>
		           </td>
		         </tr>
		         <tr>
		           <td>
		             <h5 class="product-title font-alt">122</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">302</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">뮤지컬 신나</h5>
		           </td>
		           <td class="">
		             <h5 class="product-title font-alt">2023-01-15</h5>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">2023-01-22</h5>
		           </td>
		           <td class="">
		             <button class="btn btn-d btn-circle">완료</button>
		           </td>
		           <td>
		             <h5 class="product-title font-alt">관람 후 작성 가능</h5>
		           </td>
		         </tr>
		         
		       </tbody>
		     </table>
		   </div>
		 </div>
		 <center>
		 	${pageBar }
		 </center>
		</div>
	</section>
</div>

<!-- 모달창 -->
   <div id="my_modal" style="width:600px;height:auto; display: none;background-color: white;border-radius: 15px 15px;text-align: left;padding:20px;"
      class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
     <h2 style="text-align: center;"><b id="refundNo"></b> | <b id="refundTitle"></b></h2>
    
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">공연 가격　</b> <b id="SEATPRICE"></b></h4>
     <hr class="divider-w">
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">결제 금액　</b> <b id="P_PRICE"></b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">적립 포인트</b> <b id="Point"></b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">사용 포인트</b> <b id="PAYPOINT"></b></h4>
     <hr class="divider-w">
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">총 환급액　</b> <b id="refundTotal"></b></h4>
      
      <div style="margin-top:30px;margin-bottom:20px;text-align: center; ">
        <button style="font-size:13px;" class="modal_close_btn btn btn-g btn-round btn-sm" >취소</button>
        <button style="font-size:13px;" class="btn btn-danger btn-round btn-sm" >환불</button>
        </div>
	</div>
<style>
#adminQnATitle{
  cursor: pointer;
}

</style>
<script>
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색깔은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.8)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
		
        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};
	
	const fn_refund=(member_No,rCode)=>{
		
		$.ajax({
			url:"${path}/mypage/refundMusical.do",
			data: {member_No:member_No , rCode :rCode },
			success:data=>{
				console.log(data);
		    	
				$("#refundNo").text('No.'+data.result.R_CODE);
				$("#refundTitle").text(data.result.M_TITLE);
				
				$("#SEATPRICE").text(data.result.SEATPRICE);//공연 가격
				$("#P_PRICE").text(data.refund.P_PRICE);//결제 금액
				$("#Point").text('-'+(data.refund.P_PRICE)/10);//적립 포인트
				$("#PAYPOINT").text('+'+data.refund.PAYPOINT);//사용 포인트
				$("#refundTotal").text(
						(data.refund.P_PRICE)-(data.refund.P_PRICE/10)+(data.refund.PAYPOINT)
						);//총 환급액
				
				// 모달창 띄우기
			    modal('my_modal');
			}
			
		});
		
	}
</script>






<jsp:include page="/WEB-INF/views/common/footer.jsp"/>