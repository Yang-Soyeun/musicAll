<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/member/terms.css">

<body>
  <div id="__next">
    <div class="memberContainer">
        <div class="headerTitle">약관동의</div>
      </div>
      <div class="contents">
        <div class="contentWrapper termsContent">
          <div class="uCheckbox allAgree"><label><input type="checkbox" id="checkAll"><span class="text">약관 전체 동의</span></label></div>
          <div class="termsBlock">
            <c:if test="${not empty listY }">
            <div class="label">필수 동의 항목</div>

            <c:forEach items="${listY }" var="l" >
            <div class="termsItem">
              <div class="uCheckbox sType"><label><input type="checkbox" class="singleSelector requireSelector"><span
                    class="text"></span></label>
                <div class="checkboxCont"><a href="javascript:window.open('${path}/member/term1.do?term_code=${l.term_code }', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" class="btn btnLink">${l.term_name }</a></div>
              </div>
              </div>
               </c:forEach>
				</c:if>
                </div>
                
	<div class="termsBlock">
		<c:if test="${not empty listN }">
			<div class="label">선택 동의 항목</div>
				<c:forEach items="${listN }" var="li">
					<div class="termsItem">
						<div class="uCheckbox sType"><label><input type="checkbox" class="singleSelector">
							<span class="text"></span></label>
							<div class="checkboxCont"><a href="javascript:window.open('${path}/member/term1.do?term_code=${li.term_code }', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=yes');" class="btn btnLink" >${li.term_name }</a></div>
						</div>
					</div>
				</c:forEach>
		</c:if>
	</div>
          <div class="ubtnArea" style="text-align: center;">
            <div class="col"><input type="button" onclick="bt_next();" class="btn btn-danger btn-circle" data-id="nextStep" value="다음단계" ></div>
          </div>
          </div>
        </div>
      </div>
</body>

<script>
	$("#checkAll").on("click",function(){
		if($("#checkAll").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});

	const bt_next = function(){
		
		let c = $("input.requireSelector");//input 클라스에 있는 선택자 c라는 변수에 담기
		
		for(let i=0 ; i<c.length ; i++){//포문돌리고
			
			let m = c[i];//c[i]를 변수에 담아야한다.
			
			if($(m).prop("checked")==false){
				alert("musicAll 이용약관과 개인정보 수집 및 이용에 대한 필수 항목을 모두 동의해주세요.");
				
				return false;//반환하는 이유? 한번만 돌고 끝내기 위해서!
			}
			console.log(c[i]);
		}
		
		location.assign('${path}/member/join.do');
	}
	
	$(".singleSelector").on("click",function(){
	//체크박스 갯수는 총 5개이다
	//만약 4개의 체크박스만 체크되어있으면 전체 동의 체크박스는 해제되어야 하며
	//다시 총 5개의 체크박스가 전부 체크되면 전체동의 체크박스는 체크되어야한다.
	//즉 갯수를 중심을 두고 로직을 짜본다!
		
		//체크박스의 갯수를 변수에 담는다.
		let s = $("input.singleSelector").length;
		
		//체크박스 중에서 선택된 애들의 갯수만 가져오기->input.singleSelector:checked 이렇게 작성!!
		let m = $("input.singleSelector:checked").length;
		
		if(s==m){
			$("#checkAll").prop("checked",true);
		} else {
			$("#checkAll").prop("checked",false);
		}
	});
	
	
	

</script>
