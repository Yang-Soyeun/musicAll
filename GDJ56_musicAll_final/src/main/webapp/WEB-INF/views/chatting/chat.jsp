<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet"> 
<%-- <link type="text/css" rel="stylesheet" href="${path}/resources/css/chat/materialize.min.css"  media="screen,projection"/> --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<style>
body {
	background-color: #a1c0d6;
	font-family: Hi Melody;
	font-weight: border;
	
}
.body-chat{
  padding-bottom: 0;
}
.chat-header,
.chat-header a {
  /* background-color: #a1c0d6; */
  color: black;
}

.chat-header {
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.chat {
  /* background-color: #a1c0d6; */
  /* height: 100vh; */
  padding-top: 15px;
  padding-left:10px;
  padding-right: 10px;
  padding-bottom:40px;
  
}

.chat .date-divider {
  text-align: center;
  font-size: 20px;
  color: rgba(0, 0, 0, 0.5);
  margin-bottom: 15px;
}

.chat__message{
margin-bottom: 10px;
display: flex;
}

.chat__message-from-me {
  justify-content: flex-end;
  align-items: flex-end;
}

.chat__message-to-me {
  justify-content: flex-start;
  align-items: flex-start;
}
.chat__message-time {
  font-size: 16px;
  color : rgba(0, 0, 0, 0.5);
}

.chat__message-from-me .chat__message-body{
  background-color: #ffe934;
  padding : 10px 5px;
  border-radius: 2px;
  margin-right: 10px;
  margin-left: 10px;
  font-size: 20px;
}

.chat__message-to-me img{
  height: 35px;
  border-radius: 50%;
  margin-right: 10px;
}

.chat__message-username{
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
}

.chat__message-to-me .chat__message-body {
  background-color: white;
  padding : 10px 5px;
  border-radius: 2px;
  font-size: 20px;
}

.chat__message-center {
  display: flex;
  flex-direction: column;
}

.chat__message-time {
  margin-top: 50px;
  margin-left: 5px;
}

.type-message {
  width: 100%;
  bottom:0;
  position: fixed;
  height: 45px;
  background-color: #a1c0d6;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-left:  10px;
  padding-right: 5px;
}

.type-message .fa-plus {
  color: #b4b4b4;
}

.type-message__input {
  width: 100%;
  display: flex;
  align-items: center;
}

.type-message__input input {
  width: 80%;
  padding: 10px;
  border-style: none;
/*   border-bottom-left-radius: 5px;
  border-top-left-radius: 5px; */
  border-radius : 5px;
}

.type-message__input #btnSend {
  color: #523737;
  background-color: #ffe934;
  padding: 10px;
  margin-right: 5px;
  width: 13%;
}

.type-message__input .record-message i {
  display: flex;
  align-items: center;
  justify-content: center;
}

.header__column {
    height: 45px;
}

#receiver {
    text-align: center;
    margin-left: 233px;
    width: 5em;
    /* background-color: #a1c0d6; */
    height: 1.5em;
}

.enter {
	text-align: center;
	color: gray;
	font-size:20px;
}

#chatimage{
	width:72px;
	height:78px;
	margin-left:45%;
	margin-top:5px;
	float:right;
}
#titleL{
	font-size:20px;
    margin-top: -10px;
}
#backChats{
	margin-top: 38px;
}
</style>


</head>
	<body>
	<!-- 방번호를 히든에 담고 메세지를 보낼때 방번호를 추가로 보냄! -->
		<input type="hidden" id="roomNo" value="${roomNo }"/>
		<header class= "top-header chat-header" style="height: 88px;">
			<div class="header__column" id="titleImg" style="float:left;">
				<i class="fa fa-chevron-left fa-lg" id="backChats"></i>
			</div>
			<div id="titleL" style="display : table;">
				<div style="display : table-cell;width: 70%;">
					<img src="${path}/resources/upload/performance/${cl.getIName()}" id="chatimage" class="circle">
				</div>
				<div style="display : table-cell;vertical-align: middle;">
					<span>
						<c:out value="${cl.getMTitle() }"/>
					</span>
				</div>
				
			</div>
		</header>
		<main class="chat">
			<div class="date-divider">
				<span class="date-divider__text">${today}</span>
			</div>
			<div id="chattingcontainer"></div>
		</main>
		<div class="type-message">
			<div class="type-message__input">
				<input type="text" id="msg"/>
				<button id="sendBtn" style="margin-left: 10px;">전송</button>
				<!-- <span id="sendBtn">전송</span> -->
			</div>
		</div>
		<!-- <input id="msg"><button id="sendBtn">전송</button> -->
		
		<script>
			let isload = false;
			
			//오자마자 접속시작
			let websocket = new WebSocket("ws://localhost:9090/GDJ56_musicAll_final/chatting");//자동적으로 채팅접속(서버올릴시-카카오맵x)
			//let websocketp = new WebSocket("wss://gd1class.iptime.org:8844/GDJ56_musicAll_final/chatting");카카오맵 사용시
			//let serverWeb = new WebSocket("ws://localhost:9090/GDJ56_musicAll_final/chatting")//서버x
			//new WebSocket("ws://gd1class.iptime.org:9999/GDJ56_musicAll_final/chatting");//자동적으로 채팅접속(서버올릴시-카카오맵x)
			//채팅구현(on open, on message, on close)
			websocket.onopen=(data)=>{
				
				let roomNo = $("#roomNo").val();
				
				//자동으로 접속된 정보를 주는것!sessiondata랑 비슷!
				console.log(data);
				//websocket.send(//데이터보내는로직구현->message구현)
				websocket.send(JSON.stringify(new Message("open",'${sessionScope.loginMember.member_Id}',"","",roomNo,"${sessionScope.loginMember.member_No}")));//내가누군지 알려준다! 데이터보내기!
				//JSON.stringify -> 모든메세지 처리 이것으로 해야함!
			}//접속이 되자마자 00님이 입장하였습니다 구현하는 로직!
			
			websocket.onmessage=(response)=>{
				console.log(response);
				const msg = JSON.parse(response.data);
				console.log(msg);
				switch(msg.type){
					case "connection" :
						addMsgSystem(msg);
						if(isload==false){//isload 거짓이면
							getHistory();	//히스토리 함수를 불러오고
							isload = true;//isload 참으로 만들어라 - > 즉! 커넥션이 일회성만 돌게 만들어라!
						}
						break;
					case "msg" : printMsg('${sessionScope.loginMember.member_Id}',msg);break;//나는 오른쪽? 너는 왼쪽? 이거 구현하기 위해서!
					case "disconnection" : addMsgSystem(msg);break;		
							
				}
			}
			//엔터치면 전송되게끔!
			$("#msg").on("keyup",function(e){
		 		if(e.keyCode == '13'){
		 			$("#sendBtn").click();
		 		}
		 	});
			
			
			$("#sendBtn").click(e=>{
				let roomNo = $("#roomNo").val();
				const msg=$("#msg").val();
				const sendData=new Message("msg",'${sessionScope.loginMember.member_Id}',"",msg,roomNo,"${sessionScope.loginMember.member_No}");
				websocket.send(JSON.stringify(sendData));
				
				$("#msg").val('');
			});//메세지보낸것
			
			
			class Message{
				constructor(type,sender,reciever,msg,room,sendMemberId){
					this.type=type;
					this.sender=sender;
					this.reciever=reciever;
					this.msg=msg;
					this.room=room;
					this.sendMemberId = sendMemberId;
				}
				//**********우린 특정대상이x 모든 회원이 참여가능! 그래서 reciever을 뺄지 고민중..그럼 다시 다바꿔야하므로..패스//
			}
		
			function addMsgSystem(msg){//시스템 메세지
				console.log(msg);
				const $h3=$("<div class='enter'>").text(msg.msg);
				$("#chattingcontainer").append($h3);
				
				//스크롤 최하단으로 내리기
				window.scrollTo(0, document.body.scrollHeight);//인터넷
			}
			
			//채팅방 출력
			function printMsg(myId,msg){
				//내가 입력한 입력한 값과 내가 받은값의 디자인이 class로 나뉘어져 있음
				//따라서 3항연산자를 사용하여 divCls에 class 명을 넣음
				const divCls = myId==msg.sender? "chat__message chat__message-from-me" : "chat__message chat__message-to-me";
				let currT = new Date().getHours() + ":" + new Date().getMinutes(); 
				let html = '<div class="'+divCls+'"><div class="chat__message-center"><h3 class="chat__message-username">' + msg.sender 
							+ '</h3><span class="chat__message-body">' + msg.msg + '</span></div><span class="chat__message-time">' 
							+ currT + '</span></div>';//인터넷...ㅎㅎ
				
				$("#chattingcontainer").append(html);
				
				//스크롤 최하단으로 내리기
				window.scrollTo(0, document.body.scrollHeight);//인터넷
			}
			//접속했을때
			const getHistory=()=>{
				let roomNo = $("#roomNo").val();
				$.ajax({
					url : '${path}/chatting/chatContent.do', 
					data : {"chatNo" : roomNo},
					dataType : 'json',
					type : 'post',
					success : data=>{
						for(i=0 ; i<data.length ; i++){
							
							//로그인한 멤버아이디가 작성자와 같다면 chat__message-from-me 이고 아니면 chat__message-to-me이다
							const chatMe = "${sessionScope.loginMember.member_Id}"==data[i].memberId ? "chat__message chat__message-from-me" : "chat__message chat__message-to-me";
							//const chatSender = data[i].memberId!=data[i].memberId?"chat_message message-username" : "chat__message chat__message-to-me";
							var now=data[i].msgTime;
							let html = '<div class="'+chatMe+'"><div class="chat__message-center"><h3 class="chat__message-username">' + data[i].memberId 
										+ '</h3><span class="chat__message-body">' +  data[i].msgContent + '</span></div><span class="chat__message-time">' 
										+ now.substr(11,5) + '</span></div>';//인터넷...ㅎㅎ 
										
							$("#chattingcontainer").append(html);
						}				
						
					}
				});
			}
			
			$("#backChats").on("click",function(){
				location.href = "${path}/chatting/chatList.do";
				
			});
		</script>
	
	</body>

</html>