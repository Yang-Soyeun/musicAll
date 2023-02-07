<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<div class="main">
	<section class="module">
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-6 col-sm-offset-3">
	        <h1 class="module-title font-alt">상품 구매내역</h1>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-sm-12">
	        <table class="table table-striped table-border checkout-table" style="text-align:center;">
	          <tbody>
	            <tr >
	              <td><b>주문번호</b></td>
	              <td><b>상품명</b></td>
	              <td><b>수량</b></td>
	              <td><b>가격</b></td>
	              <td><b>결제일</b></td>
	              <td><b>환불/취소</b></td>
	            </tr>
	            <c:if test="${not empty myShopping }">
	            	<c:forEach var="shop" items="${myShopping }">
	              <tr>
	                <td>
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('SB_CODE') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('G_NAME') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><c:out value="${shop.get('SB_COUNT') }"/></h5>
	                </td>
	                <td class="">
	                  <h5 class="product-title font-alt"><fmt:formatNumber value="${shop.get('TOTAL') }" pattern="###,###"/></h5>
	                </td>
	                <td>
	                  <h5 class="product-title font-alt">
	                  	<fmt:formatDate value="${shop.get('P_DATE') }" type="both" pattern="yyyy-MM-dd (E) hh:mm:ss"/>
	                  </h5>
	                </td>
	                <td class="">
	                	<c:if test="${!shop.containsKey('RF_CODE') }">
		                  <button class="btn btn-danger btn-circle"
		                  	onclick="fn_refund(${loginMember.member_No},${shop.get('SB_CODE') });">환불</button>
	                  	</c:if>
	                  	<c:if test="${shop.containsKey('RF_CODE') }">
	                  		<button id="refundCheck" class="btn btn-d btn-circle">완료</button>
	                  	</c:if>
	                </td>
	              </tr>
	      	</c:forEach>
	            </c:if>
	            <c:if test="${empty myShopping }">
	            	<tr>
	            		<td colspan="6">구매내역이 없습니다.</td>
	            	</tr>
	            </c:if>
	          </tbody>
	        </table>
	      </div>
			  <center>
			  	${pageBar }
			  </center>
	  
	    </div>
	  </div>
	</section>
</div>
<!-- 모달창 -->
   <div id="my_modal" style="width:600px;height:auto; display: none;background-color: white;border-radius: 15px 15px;text-align: left;padding:20px;"
      class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
     <h2 style="text-align: center;"><b id="refundTitle"></b></h2>
    
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">상품 가격　</b> <b id="TOTAL"></b><b>원</b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">구매 수량　</b> <b id="SB_COUNT"></b><b>개</b></h4>
     <hr class="divider-w">
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">결제 금액　</b> <b id="P_PRICE"></b><b>원</b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">적립 포인트</b> <b id="Point"></b><b>P</b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;">사용 포인트</b> <b id="PAYPOINT"></b><b>P</b></h4>
     <hr class="divider-w">
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px; color:#d43f3a;">총 환급액　</b> <b id="refundTotal"></b><b>원</b></h4>
     <h4 style="margin-top:30px;"><b style="margin-left:50px; margin-right:50px;color:#d43f3a;">환급 포인트</b> <b id="refundPoint"></b><b>P</b></h4>
     <input type="hidden" id="imp_uid"/>
     <input type="hidden" id="gCode"/>
      
      <div style="margin-top:30px;margin-bottom:20px;text-align: center; ">
        <button style="font-size:13px;" class="modal_close_btn btn btn-g btn-round btn-sm" >취소</button>
        <button style="font-size:13px;" class="btn btn-danger btn-round btn-sm" onclick="cancelPayGoods();">환불</button>
      </div>
	</div>
	
<script>
	//환불 최종
	function cancelPayGoods(){
		
		$.ajax({
			url:"${path}/mypage/cancelPayGoods",
			type:"POST",
			contentType: 'application/x-www-form-urlencoded; charset = utf-8',
			data:{
				"memberNo":"${loginMember.member_No}",
				"imp_uid" : $("#imp_uid").val(),//imp_Uid
				"gCode" : $("#gCode").val(),//gCode
				"SB_COUNT" : $("#SB_COUNT").text(),//수량
				"cancel_request_amount":$("#P_PRICE").text(),//환불금액
				"cancel_request_point":$("#PAYPOINT").text(),//돌려줄 포인트
				"cancel_response_point":$("#Point").text()//돌려받을 포인트
			},
			success:data=>{
				if(data>0){
					alert("환불이 완료되었습니다.");
					location.replace("${path}/mypage/shoppingList.do");
				}
			}
			
			
		});//ajax
		
	}//cancelPay


	//모달
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
	
	//환불 클릭시 모달창
	const fn_refund=(member_No,sbCode)=>{
		
		$.ajax({
			url:"${path}/mypage/refundGoods.do",
			data: {member_No:member_No , sbCode :sbCode },
			success:data=>{
				console.log(data);
		    	
				$("#refundTitle").text(data.G_NAME);
				
				$("#TOTAL").text(data.TOTAL);//상품 가격
				$("#SB_COUNT").text(data.SB_COUNT);//상품 가격
				$("#P_PRICE").text(data.P_PRICE);//결제 금액
				$("#Point").text('+'+(data.P_PRICE/10));//적립 포인트
				$("#PAYPOINT").text('-'+data.PAYPOINT);//사용 포인트
				$("#refundTotal").text(data.P_PRICE);//총 환급액
				$("#refundPoint").text(
						(data.P_PRICE/10)-data.PAYPOINT
						);//총 환급포인트
				$("#imp_uid").val(data.P_UID);
				$("#gCode").val(data.G_CODE);
				
				// 모달창 띄우기
			    modal('my_modal');
			}
			
		});
		
	}
</script>	
	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>