package com.gdj.music.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChattingServer extends TextWebSocketHandler {
	
	//방번호, 접속한사람
	private Map<String, Map<String,WebSocketSession> > clients=new HashMap();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("클라이언트 접속");
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		//클라이언트가 보낸 메세지확인하기
		//클라이언트가 보낸 메세지는 payload에서 저장된다.
		System.out.println(message.getPayload());
		//클라이언트가 보낸 json데이터 jackson이용해서 파싱하기
//		ObjectMapper mapper=new ObjectMapper();
		SendMessage msg=mapper.readValue(message.getPayload(), SendMessage.class);
		System.out.println(msg);
		
		
		switch(msg.getType()) {//메세지처리 분할
		//어떤메세지를 관리하고 처리할건지 내가 다 정한다!!!
			case "open" : addClient(session,msg);break;//client정보에 추가//처음 오픈이면
			//open -> session은 내가 관리해야함!
			case "msg" : sendMessage(msg);break;//메세지를 클라언트에게 전달 
			case "system" : sendAdminMessage() ;break;// 시스템정보를 클라이언트에게 전달
		}
	}
	//외부에서 사용할수 잇는건 msg하나뿐!!
	//다른건 모든 private!!!
	
	private void addClient(WebSocketSession session, SendMessage msg) throws IOException{
		session.getAttributes().put("info", msg);

		String roomNo = msg.getRoom();
		
		
		/************************************************/
		//방 안에 있는 사용자 목록
		Map<String,WebSocketSession> roomInfo = getRoomMember(roomNo);
		roomInfo.put(msg.getSender(), session);
		
		//방 목록
		//방이 없으면 새로 방 생성, 방이 있으면 방 만들지 말고 사용자 추가
		clients.put(roomNo, roomInfo);
		/************************************************/
		
		SendMessage adminmsg=new SendMessage("system","","",msg.getSender()+"가 접속했습니다.",roomNo);
//		ObjectMapper mapper=new ObjectMapper();
		System.out.println(clients.toString());
		
		//해당 방에 있는 사람 가져오기
		Map<String,WebSocketSession> roomMembers = getRoomMember(roomNo);
		
		System.out.println("===================================");
		System.out.println(roomMembers);
		System.out.println("===================================");
		
		for(String id:roomMembers.keySet()) {
			System.out.println("id : " + id);
			WebSocketSession client = roomMembers.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(adminmsg)));
		}
	}
	
	private void sendMessage(SendMessage msg) throws IOException{
		
		Map<String,WebSocketSession> roomMembers = getRoomMember(msg.getRoom());
		
		for(String id:roomMembers.keySet()) {
			WebSocketSession client=roomMembers.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
		}//

		
		
		
	}
	private void sendAdminMessage() {
		System.out.println("시스템메세지");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("커넥션 클로즈");
		//채팅방 나간 사람의 세션을 삭제처리
		//사람이 아무도 없으면 방을 삭제
		super.afterConnectionClosed(session, status);
	}
	
	//방에 있는 사람 목록 가져오기
	private Map<String,WebSocketSession> getRoomMember(String roomNo){
		return clients.get(roomNo);
	}
}
