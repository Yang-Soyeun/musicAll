<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>

</head>
<body>

	<h3>spring chatting</h3>
	<!-- 방번호를 히든에 담고 메세지를 보낼때 방번호를 추가로 보냄! -->
	<input type="hidden" id="roomNo" value="${roomNo }"/>
	<div id="chattingcontainer"></div>
	<input id="msg"><button id="sendBtn">전송</button>
	
	<script>  
		//오자마자 접속시작
		let websocket = new WebSocket("ws://localhost:9090/GDJ56_musicAll_final/chatting");//자동적으로 채팅접속
		
		//채팅구현(on open, on message, on close)
		websocket.onopen=(data)=>{
			
			let roomNo = $("#roomNo").val();
			
			//자동으로 접속된 정보를 주는것!sessiondata랑 비슷!
			console.log(data);
			//websocket.send(//데이터보내는로직구현->message구현)
			websocket.send(JSON.stringify(new Message("open",'${sessionScope.loginMember.member_Id}',"","",roomNo)));//내가누군지 알려준다! 데이터보내기!
			//JSON.stringify -> 모든메세지 처리 이것으로 해야함!
		}//접속이 되자마자 00님이 입장하였습니다 구현하는 로직!
		
		websocket.onmessage=(response)=>{
			console.log(response);
			const msg = JSON.parse(response.data);
			console.log(msg);
			switch(msg.type){
				case "system" : addMsgSystem(msg);break;
				case "msg" : printMsg('${sessionScope.loginMember.member_Id}',msg);break;//나는 오른쪽? 너는 왼쪽? 이거 구현하기 위해서!
			}
		}
		
		$("#sendBtn").click(e=>{
			let roomNo = $("#roomNo").val();
			const msg=$("#msg").val();
			const sendData=new Message("msg",'${sessionScope.loginMember.member_Id}',"",msg,roomNo);
			websocket.send(JSON.stringify(sendData));
		});//메세지보낸것
		
		
		class Message{
			constructor(type,sender,reciever,msg,room){
				this.type=type;
				this.sender=sender;
				this.reciever=reciever;
				this.msg=msg;
				this.room=room;
			}
			/**********우린 특정대상이x 모든 회원이 참여가능! 그래서 reciever을 뺄지 고민중.......************/
		}
	
		function addMsgSystem(msg){
			console.log(msg);
			const $h3=$("<h3>").css("textAlign","center").text("==== "+msg.msg+"====");
			$("#chattingcontainer").append($h3);
		}
		function printMsg(myId,msg){
			console.log(myId);
			console.log(msg);
			const $p=$("<p>").css("textAlign",(myId==msg.sender?"left":"right"))
					.text(msg.sender + ":" +  msg.msg);
			
			$("#chattingcontainer").append($p);	
		}
	</script>


</body>



</html>