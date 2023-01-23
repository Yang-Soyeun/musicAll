<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<style>
	.reviewImg{height:200px;}
	.reviewCon{text-align:center;}
	.post-entry{height:120px;}
	.fa-star{color:#ffd400;}
</style>
<div class="main">
	<section class="module">
	  <div class="container" style="margin-bottom:60px;">
	    <div class="row">
	      <div class="col-sm-6 col-sm-offset-3">
	        <h1 class="module-title font-alt">내가 쓴 리뷰</h1>
	      </div>
	    </div>
	  
        <!-- 정렬창 -->
        <form class="row" style="margin-bottom:20px;">
          <div class="col-sm-2 mb-sm-20 " style="float: right;">
            <select onchange="fn_orderRv(this);" class="form-control">
              <option selected value="review_date">최근 작성순</option>
              <option value="scoreHigh">별점 높은 순</option>
              <option value="scoreRow">별점 낮은 순</option>
            </select>
          </div>
        </form>
        
        <script>
        	const fn_orderRv=(obj)=>{
        		
        		$.ajax({
        			url:"${path }/mypage/orderReview.do",
        			data:{keyword:$(obj).val(),member_No:$("#member_No").val()},
        			success:data=>{
        				console.log(data);
//     					$(".reviewCon #rvScore").detach();
        				var iTagP=$("<i>").attr('class','fa fa-star')[0];
        				var iTagM=$("<i>").attr('class','fa fa-star-o')[0];
        				
        				
        				for(i=0;i<data.length;i++){
        					
        					$(".reviewCon #rvTitle")[i].innerText=data[i].M_TITLE;
        					$(".reviewCon #rvContent")[i].innerText=data[i].REVIEW_CONTENT;

        					var score=parseInt(data[i].SCORE);
       						console.log(iTagP);
       						
	       					for(j=0;j<score;j++){//색칠 된 별
// 	       						console.log(score);
	       						$(".reviewCon #rvScore")[i].append("별");        						
// 	       						console.log($(".reviewCon #rvScore")[i]);
	       					}
	       					for(j=0;j<5-score;j++){//색칠 안된 별
// 	       						console.log(4-score);
	       						$(".reviewCon #rvScore")[i].append(iTagM);        						
// 	       						console.log($(".reviewCon #rvScore")[j]);
	       					}
        					
        				}
        			}
        			
        		});
        	}
        </script>
        
	    <!-- 한줄평 -->
	    <c:if test="${not empty myRv }">
	   		<c:forEach var="rv" items="${myRv }">
	   		
			    <div class="col-sm-6 col-md-3 col-lg-3 reviewCon" >
			        <div class="post">
			          <div class="post-thumbnail">
			          	<a href="#">
			          		<img src="${path }/resources/images/performance/matilda.gif" alt="Blog-post Thumbnail" class="reviewImg"/>
			          	</a>
			          </div>
			          <div class="post-header font-alt">
			            <h2 class="post-title">
			            	<a href="#" id="rvTitle"><c:out value="${rv.get('M_TITLE') }"/></a>
			            </h2>
			            <div class="post-meta">My Review</div>
			          </div>
			          <div class="post-entry">
			            <p id="rvContent"><c:out value="${rv.get('REVIEW_CONTENT') }"/></p>
			          </div>
		<!-- 	          <div class="post-more"><a class="more-link" href="#">Read more</a></div> -->
			          <div class="post-more" id="rvScore">
			          	<c:forEach var="i" begin="0" end="${rv.get('SCORE')-1 }" step="1">
							<i class="fa fa-star"  ></i>
						</c:forEach>
			          	<c:forEach var="i" begin="0" end="${4-rv.get('SCORE') }" step="1">
							<i class="fa fa-star-o" ></i>
						</c:forEach>
			          </div>
			        </div>
			      </div>
	    	</c:forEach>
	    </c:if>
	    
	    
	    
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/images/performance/42bunga.png" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	          </div>
	          <div class="post-header font-alt">
	            <h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	          </div>
	          <div class="post-entry">
	            <p>너무 재미있게 잘 봤어요~</p>
	          </div>
	          <div class="post-more">
	          	<i class="fa fa-star" ></i>
	          	<i class="fa fa-star" ></i>
	          	<i class="fa fa-star-o" ></i>
	          	<i class="fa fa-star-o" ></i>
	          	<i class="fa fa-star-o"></i>
	          </div>
	        </div>
	      </div>
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/images/performance/sweet.gif" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	        </div>
	        <div class="post-header font-alt">
	           	<h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	        </div>
	          <div class="post-entry">
	            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	      <div class="col-sm-6 col-md-3 col-lg-3 reviewCon">
	        <div class="post">
	          <div class="post-thumbnail">
	          	<a href="#">
	          		<img src="${path }/resources/images/performance/wild.png" alt="Blog-post Thumbnail" class="reviewImg"/>
	          	</a>
	          </div>
	          <div class="post-header font-alt">
	           	<h2 class="post-title"><a href="#">프랑켄슈타인</a></h2>
	            <div class="post-meta">My Review</div>
	          </div>
	          <div class="post-entry">
	            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
	          </div>
	          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
	        </div>
	      </div>
	      <c:if test="${empty myRv }">
	      	<div class="" style="text-align:center; margin-top:50px;">
				<h3>작성한 리뷰가 없습니다.</h3> 
			</div>
	      </c:if>
	      
	      <!-- 페이지바 -->
	      <center>
	      	${pageBarRv }
	      </center>
	  </div>
	  
	  
	  
	  
	  
	  
	  <!-- 1:1문의 -->
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-6 col-sm-offset-3">
	        <h1 class="module-title font-alt">1:1 문의 내역</h1>
	      </div>
	    </div>
	  
        <!-- 검색창 -->
        <form action="${path }/mypage/searchQs.do" class="row" style="margin-bottom:20px;">
          <div class="col-sm-4 mb-sm-20 " style="float: right;">
              <div class="search-box">
                <input class="form-control" id="keyword" name="keyword" type="text" placeholder="Search..." required>
                <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                <input type="hidden" name="member_No" id="member_No" value="1"> <!-- value수정 필요`!!!!!!!!!!!!!!!! -->
              </div>
      		</div>
          <div class="col-sm-2 mb-sm-20 " style="float: right;">
            <select id="type" name="type" class="form-control">
              <option selected value="qs_title">제목</option>
              <option value="qs_content">내용</option>
              <option value="qs_result">답변유무(Y/N)</option>
              		<!-- 답변유무 클릭하면 selectbox가 또 나오면 좋을듯!!! -->
            </select>
          </div>
        </form>
	    
	    <div class="row">
	      <div class="col-sm-12">
	        <table class="table table-striped table-border checkout-table" style="text-align:center;">
	          <tbody>
	            <tr>
	              <td><b>번호</b></td>
	              <td><b>유형</b></td>
	              <td><b>제목</b></td>
	              <td><b>작성자</b></td>
	              <td><b>답변유무</b></td>
	              <td><b>작성일</b></td>
	            </tr>
	            
	            <c:if test="${not empty myQs }">
	            	<c:forEach var="qs" items="${myQs }">
	            		<tr class="QsTr">
			              <td>
			                <h5 id="qsNo" class="product-title font-alt"><c:out value="${qs.qsNo }"/></h5>
			              </td>
			              <td>
			                <h5 id="qsHeadTitle" class="product-title font-alt"><c:out value="${qs.qsHeadTitle }"/></h5>
			              </td>
			              <td class="">
			                <h5 class="product-title font-alt"><i id="qsTitle" class="fa fa-lock"><c:out value="${qs.qsTitle }"/></i></h5>
			              </td>
			              <td class="">
			                <h5 id="member_Id" class="product-title" style="letter-spacing:2px;"><c:out value="${loginMember.member_Id}"/></h5>
			              </td>
			              <td class="">
			                <h5 id="qsResult" class="product-title font-alt"><c:out value="${qs.qsResult }"/></h5>
			              </td>
			              <td class="">
			                <h5 id="qsDate" class="product-title font-alt">
			                	<fmt:formatDate value="${qs.qsDate }" type="both" pattern="yyyy-MM-dd (E) hh:mm:ss"/>
			                </h5>
			              </td>
		            	</tr>
		            </c:forEach>
		         </c:if>
		         <c:if test="${empty myQs }">
		         	<tr>
		         		<td colspan="6">1대1 문의 내역이 없습니다.</td>
		         	</tr>
		         </c:if>
		         
		         
	          </tbody>
	        </table>
	      </div>
	      <!-- 페이지바 -->
	      <center>
	      	${pageBarQs }
	      </center>
	    </div>
	  </div>
	</section>
</div>

<!-- 	<script> -->
<!-- 		const fn_searchQuestion=()=>{ -->
<!-- 		console.log($("#No").val()); -->
<!-- 			$.ajax({ -->
<%--  				url:"${path }/mypage/searchQs.do", --%>
<!--  				data:{type:$("#type").val(),keyword:$("#keyword").val(),No:$("#member_No").val()}, -->
<!--  				success:data=>{ -->
<!--  					console.log(data); -->
<!--  					console.log($(".QsTr #qsNo")); -->
<!--  					for(i=0;i<5;i++){ -->
<!--  						console.log(data[i].qsDate); -->
						
						
<!--  						console.log($(".QsTr #qsNo")[i].innerText); -->
<!--  						$(".QsTr #qsNo")[i].innerText=data[i].qsNo; -->
<!--  						$(".QsTr #qsHeadTitle")[i].innerText=data[i].qsHeadTitle; -->
<!--  						$(".QsTr #qsTitle")[i].innerText=data[i].qsTitle; -->
<!--  						$(".QsTr #qsResult")[i].innerText=data[i].qsResult; -->
<!--  						$(".QsTr #qsDate")[i].innerText=data[i].qsDate; -->
<!-- 					} -->
<!--  				} -->
				
<!--  			}); -->
<!--  		}; -->
<!-- 	</script> -->














<jsp:include page="/WEB-INF/views/common/footer.jsp"/>