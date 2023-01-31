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
        
        <script>
        	const fn_orderRv=(obj)=>{
        		
        		$.ajax({
        			url:"${path }/mypage/orderReview.do",
        			data:{keyword:$(obj).val(),member_No:$("#member_No").val()},
        			success:data=>{
//         				console.log(data);
        				
						$(".reviewCon #rvScore").empty();//별점 초기화
//         				$(".rvPhoto").attr('href','###');//a태그 주소 바꾸기!!!?!수정 필요!!!!!!!!!??????
						//혹은 div post-thumbnail 아래 자식 태그 지웠다가 a 태그 생성해서 append하기
						
        				$(".rvPhoto").empty();//기존 사진 지우기
						
        				for(i=0;i<data.length;i++){
        					
        					$(".reviewCon #rvTitle")[i].innerText=data[i].M_TITLE;//제목
        					$(".reviewCon #rvContent")[i].innerText=data[i].REVIEW_CONTENT;//내용
        					var img=$("<img src='${path }/resources/images/performance/"+data[i].I_NAME+
        							"' alt='Blog-post Thumbnail' class='reviewImg'></img>")[0];//사진 생성
        							
							$(".rvPhoto")[i].append(img);//사진 넣기	
        							
        					var score=parseInt(data[i].SCORE);//scrore를 int로 바꾸기
							
       						
	       					for(j=0;j<score;j++){//색칠 된 별
	       						
		        				var iTagP=$("<i>").attr('class','fa fa-star')[0];
	       						$(".reviewCon #rvScore")[i].append(iTagP);  
	       						
	       					}
	       					for(j=0;j<5-score;j++){//색칠 안된 별
	       						
		        				var iTagM=$("<i>").attr('class','fa fa-star-o')[0];
	       						$(".reviewCon #rvScore")[i].append(iTagM);  
	       						
	       					}
        					
        				}
        			}
        			
        		});
        	}
        </script>
        
	    <!-- 한줄평 -->
	    <c:if test="${not empty myRv }">
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
        
	   		<c:forEach var="rv" items="${myRv }">
	   		
			    <div class="col-sm-6 col-md-3 col-lg-3 reviewCon" >
			        <div class="post">
			          <div class="post-thumbnail">
			          	<a href="#" class="rvPhoto">
			          		<img src="${path }/resources/upload/performance/${rv.get('I_NAME') }" 
			          			alt="Blog-post Thumbnail" class="reviewImg"/>
			          	</a>
			          </div>
			          <div class="post-header font-alt">
			            <h2 class="post-title" id="rvTitle">
			            	<c:out value="${rv.get('M_TITLE') }"/>
			            </h2>
			            <div class="post-meta">My Review</div>
			          </div>
			          <div class="post-entry">
			            <p id="rvContent"><c:out value="${rv.get('REVIEW_CONTENT') }"/></p>
			          </div>
		<!-- 	          <div class="post-more"><a class="more-link" href="#">Read more</a></div> -->
			          <div class="post-more" id="rvScore">
			          	<c:forEach var="i" begin="1" end="${rv.get('SCORE') }" step="1">
							<i class="fa fa-star"  ></i>
						</c:forEach>
			          	<c:forEach var="i" begin="1" end="${5-rv.get('SCORE') }" step="1">
							<i class="fa fa-star-o" ></i>
						</c:forEach>
			          </div>
			        </div>
			      </div>
	    	</c:forEach>
	    </c:if>
	    
	      <c:if test="${empty myRv }">
	      	<div class="" style="text-align:center; ">
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
        <form action="" class="row" style="margin-bottom:20px;">
          <div class="col-sm-4 mb-sm-20 " style="float: right;">
              <div class="search-box">
                <input class="form-control" id="keyword" name="keyword" type="text" placeholder="Search..." required>
<!--                 <button class="search-btn" type="submit"><i class="fa fa-search"></i></button> -->
                <button class="search-btn" type="button" onclick="fn_searchQuestion(${loginMember.member_No});" ><i class="fa fa-search"></i></button>
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
	        <table id="qsTable" class="table table-striped table-border checkout-table" style="text-align:center;">
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
	            		<tr class="QsTr" onclick='detail(${qs.qsNo})'>
			              <td>
			                <h5 id="qsNo" class="product-title font-alt"><c:out value="${qs.qsNo }"/></h5>
			              </td>
			              <td>
			                <h5 id="qsHeadTitle" class="product-title font-alt"><c:out value="${qs.qsHeadTitle }"/></h5>
			              </td>
			              <td>
			                <h5 class="product-title font-alt"><i id="qsTitle" class="fa fa-lock"><c:out value="${qs.qsTitle }"/></i></h5>
			              </td>
			              <td >
			                <h5 id="member_Id" class="product-title" style="letter-spacing:2px;"><c:out value="${loginMember.member_Id}"/></h5>
			              </td>
			              <td >
			                <h5 id="qsResult" class="product-title font-alt"><c:out value="${qs.qsResult }"/></h5>
			              </td>
			              <td >
			                <h5 id="qsDate" class="product-title font-alt">
			                	<fmt:formatDate value="${qs.qsDate }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
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

	<script>
		//1:1 상세화면
		const detail=(qsNo)=>{
			
			location.assign("${path}/question/myqdetail.do?qsNo="+qsNo);
		}
	
		//1대1 질문 ajax 검색
 		const fn_searchQuestion=(No)=>{
 			
 		console.log($("#member_No").val()); 
 			$.ajax({ 
 				url:"${path }/mypage/searchQs.do?=No",
  				data:{type:$("#type").val(),keyword:$("#keyword").val(),member_No:$("#member_No").val()},
  				dataType:'json',
  				type:'post',
  				success:data=>{ 
//   					console.log(data); 
  					
					if(data!=null){
						$(".QsTr").remove();
						
	  					for(i=0;i<data.length;i++){ 
							var tr=$("<tr class='QsTr' onclick='detail("+data[i].qsNo+")'></tr>")[0];
							var td1=$("<td>")[0];
							var td2=$("<td>")[0];
							var td3=$("<td>")[0];
							var td4=$("<td>")[0];
							var td5=$("<td>")[0];
							var td6=$("<td>")[0];
							
							var qsNo=$("<h5 id='qsNo' class='product-title font-alt'>"+data[i].qsNo+"</h5>")[0];
							var qsHeadTitle=$("<h5 id='qsHeadTitle' class='product-title font-alt'>"+data[i].qsHeadTitle+"</h5>")[0];
							var qsTitle=$("<h5 class='product-title font-alt'><i id='qsTitle' class='fa fa-lock'>"+data[i].qsTitle+"</i></h5>")[0];
							var member_Id=$("<h5 id='member_Id' class='product-title' style='letter-spacing:2px;'>"+data[i].memberNo+"</h5>")[0];
							var qsResult=$("<h5 id='qsResult' class='product-title font-alt'>"+data[i].qsResult+"</h5>")[0];
							var qsDate=$("<h5 id='qsDate' class='product-title font-alt'>"+data[i].qsDate+"</h5>")[0];
							
							td1.append(qsNo);
							td2.append(qsHeadTitle);
							td3.append(qsTitle);
							td4.append(member_Id);
							td5.append(qsResult);
							td6.append(qsDate);
							
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							tr.append(td4);
							tr.append(td5);
							tr.append(td6);
							
							$("#qsTable").append(tr);
							$("center").remove();
	 					} 
					}
  				}
				
  			}); 
  		}; 
  		
  		
 	</script> 





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>