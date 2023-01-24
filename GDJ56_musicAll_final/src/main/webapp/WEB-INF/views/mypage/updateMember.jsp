<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>


<link rel="stylesheet" href="${path }/resources/css/member/join.css">

<div class="memberContainer">
	<div class="contents">
		<div class="contentWrapper registContent">
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputId">아이디</label>
							<div class="inputBox">
								<input type="text" id="member_id" class="inputText" placeholder="6~20자 영문, 숫자" 
								tabindex="1" value="${mem.member_Id }" maxlength="20" required="required" readonly>
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputPw">비밀번호</label>
							<div class="inputBox">
								<input type="password" id="password" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" tabindex="2" value="" maxlength="12" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputPwConfirm">비밀번호 확인</label>
							<div class="inputBox">
								<input type="password" id="password_check" class="inputText" placeholder="8~12자 영문, 숫자, 특수문자" tabindex="3" value="" maxlength="12" required="required">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputName">이름</label>
							<div class="inputBox">
								<input type="text" id="member_name" class="inputText" tabindex="4" value="${mem.name }">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: block;"></div>
			</div>
			<div class="uBlock">
				<div class="uInputArea emailType">
					<div class="col">
						<div class="uInput">
							<label for="inputEmail">이메일</label>
							<div class="inputBox">
								<input type="text" id="email" class="inputText" tabindex="5" value="${mem.email.split('@')[0] }">
							</div>
						</div>
					</div>
					<div class="col selectCol">
						<div class="uSelectBox">
							<label>
								<select tabindex="6" id="selectemail">
									<option value="direct">직접입력</option>
									<option value="naver.com" ${mem.email.split('@')[1].contains('naver')?'selected':'' }>@naver.com</option>
									<option value="hanmail.net" ${mem.email.split('@')[1].contains('hanmail')?'selected':'' }>@hanmail.net</option>
									<option value="gmail.com" ${mem.email.split('@')[1].contains('gmail')?'selected':'' }>@gmail.com</option>
									<option value="nate.com" ${mem.email.split('@')[1].contains('nate')?'selected':'' }>@nate.com</option>
									<option value="hotmail.com" ${mem.email.split('@')[1].contains('hotmail')?'selected':'' }>@hotmail.com</option>
								</select>
							</label>
						</div>
					</div>
					<div class="col">
						<div class="uBtnArea">
							<button type="button" class="uBtn borderType">인증번호받기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="uErrorText" style="display: block;"></div>
			<div class="uBlock">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputCellphone">휴대폰</label>
							<div class="inputBox">
								<input type="text" id="phone" class="inputText" placeholder="010 1234 5678" tabindex="7" value="${mem.phone }">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="uErrorText" style="display: none;">점유인증을 하여 휴대폰 번호를 등록해주세요. 등록한 번호는 로그인 이후 변경 가능합니다.</div>
				<div class="accountValiBlock" style="display: none;">
				<div class="accountGuide"></div>
					<p class="blockText">동일 정보로 가입된 계정으로 로그인 하시겠습니까?</p><a href="#" class="btn btnArrow">로그인하기</a>
				</div>
			</div>
			<div class="uBlock" style="display: none;">
				<div class="uInputArea">
					<div class="col">
						<div class="uInput">
							<label for="inputCertifyNum">인증번호</label>
							<div class="inputBox">
								<input type="text" id="inputCertifyNum" class="inputText" tabindex="8" value="">
								<button type="button" class="btnDel" aria-label="삭제"></button>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="uBtnArea">
							<button type="button" class="uBtn borderType">재발송</button>
							<button type="button" class="uBtn borderType">확인</button>
						</div>
					</div>
				</div>
				<div class="certifyTime" style="display: none;">인증유효시간 <span class="time">00:00</span></div>
			</div>
			<div class="ubtnArea row">
				<div class="col text-center">
					<button type="button" class="btn btn-danger btn-circle" onclick="fn_join();">변경완료</button>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>