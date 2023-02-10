<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value="GoodsPage"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path }/resources/css/store/single_styles.css">

<style>
      .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
         vertical-align: inherit; text-align: center;
      }
   
</style>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
     
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
            <div class="col">

            <!-- Breadcrumbs -->

            <div class="breadcrumbs d-flex flex-row align-items-center">
               <ul>
                  <li><a href="${path }">Home</a></li>
                  <li><a href="${path }/goods/goodsMain.do"><i class="fa fa-angle-right" aria-hidden="true"></i>굿즈 스토어</a></li>
                  <li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>장바구니</a></li>
               </ul>
               
            </div>
            
         </div>
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">장바구니</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            
            <!-- 장바구니 리스트 출력 -->
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                   	  <th><input type="checkbox" onclick="selectAll(this);"></th>
                      <th></th>
                      <th>상품명</th>
                      <th class="hidden-xs">가격</th>
                      <th>수량</th>
                      <th>총 금액</th>
                      <th></th>
                    </tr>
                    
                    <!-- 상품 개수, 가격 합산 -->
                    <c:set var = "sumgoods" value = "0" />
                    <c:set var = "sumprice" value = "0" />
                    
                 <c:if test="${not empty goodsCt }">
                  <c:forEach var="g" items="${goodsCt }">
                    <tr>
                      <td class="hidden-xs">
                      		<input type="checkbox" id="price${sumgoods+1 }" name="price${sumgoods+1 }" value="${g.goods.gdPrice }" onchange="itemSum(event)">
        
                      </td>
                      <td class="hidden-xs" style="width: 10%;">
                      <c:if test="${not empty img }">
	                      <c:forEach var="i" items="${img }">
	                         <c:if test="${i.gdCode == g.gdCode }">
                               <a href="#"><img src="${path }/resources/upload/goods/${i.imName}" alt="Accessories Pack" /></a>
                            </c:if>
                         </c:forEach>
                      </c:if>
                      </td>
                      <td>
                        <h5 class="product-title font-alt"><c:out value="${g.goods.gdName }"/></h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${g.goods.gdPrice }" pattern="#,###" />원</h5>
                      </td>
                      <td>
                        <input class="form-control" id="quantity_value" type="number" name="" value="${g.ctCount }" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${g.goods.gdPrice }" pattern="#,###" />원</h5>
                      </td>
                      <td class="pr-remove">
                         <button class="btn btn-round btn-g btn-sm" id="${g.gdCode }" type="submit" style="margin: 2%;" onclick="location.assign('${path }/goods/goodsPay.do?gdCode=${g.gdCode }&member_no=${loginMember.member_No }&gdCount=${g.ctCount }')">구매하기</button><br>
                         <button class="btn btn-danger btn-round btn-sm" type="submit" style="margin: 2%;" onclick="location.assign('${path }/goods/deleteCart.do?gdCode=${g.gdCode }&memberNo=${loginMember.member_No }')">나중에 구매</button>
                      </td>
                    </tr>
                    
                       <c:set var= "sumgoods" value="${sumgoods + 1 }"/>
                       <c:set var= "sumprice" value="${sumprice + g.goods.gdPrice }"/>
                       
                       </c:forEach>
               </c:if>
               <c:if test="${empty goodsCt }" >
                  <tr>
                        <td colspan="6" style="text-align: center;">
                        <div class="product-item men" style="width:100%;cursor: initial; padding: 2%;">
                           <h5 style="color:lightslategray;font-weight: bolder;font-size:14px;">등록된 상품이 없습니다. 상품을 담으러 가시겠습니까?</h5>
                           <button class="btn btn-danger btn-round" type="button" style="margin-top:20px;font-size:14px;"
                              onclick="location.assign('${path }/goods/goodsMain.do');">
                           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16"
                                       style="margin-bottom: -2%; margin-right: 3%;">
                              <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
                              <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                           </svg> 굿즈 쇼핑하러 가기 
                           </button>
                        </div>
                     </td>
                     </tr>
               </c:if>
               
                  </tbody>
                </table>
              </div>
            </div>
            
       
            <div class="row" >
              <div class="col-sm-3 col-sm-offset-3" style="float:right;">
                <div class="form-group">
                  <button class="btn btn-block btn-round btn-d pull-right" type="submit" style="margin-bottom: 7%;">변경</button>
                </div>
              </div>
            </div>
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">선택 구매</h4>
                  <table class="table table-striped table-border checkout-table">
                    <tbody>
                      <tr>
                        <th>선택 상품 개수</th>
                        <td><div class="count">0</div></td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>총 금액</th>
                        <td><div class="result">0원</div></td>
                      </tr>
                    </tbody>
                  </table>
                  <button class="btn btn-lg btn-block btn-round btn-d" type="submit" onclick="location.assign('${path }/goods/goodsPayAll.do')">구매하기</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        

        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
    <script>
      //수량 변경
      
      //전체 선택, 해제
      function selectAll(selectAll)  {
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  });
		}
      
      //선택 구매 계산  
	  function itemSum(event)  {
         
        var total = 0;
        var count = 0;
        
        
       
        for(let i=1; i<=8; i++){
              let chkbox = document.getElementById("price"+i);
              if(chkbox.checked){
                  total += Number(chkbox.value);
                  count += 1;
              }
              $(".count").html(count); 
              $(".result").html(total+'원'); 
          }
        
         
         
     }
      
         for(let i = 1; i <= 8; i++){
            
              let check = document.getElementById("price"+i);
              check.onclick = itemSum(event);
              
          }

        
         
   
         
      
      
    </script>
    
  </body>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>