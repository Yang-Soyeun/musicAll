package com.gdj.music.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj.music.chat.model.service.ChatService;
import com.gdj.music.chat.model.vo.ChatMessage;

public class ChattingServer extends TextWebSocketHandler {

	private ChatService service;

	@Autowired
	public ChattingServer(ChatService service) {
		super();
		this.service = service;
	}

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
		//클라이언트가 보낸 json데이터 jackson이용해서 파싱하기
		SendMessage msg=mapper.readValue(message.getPayload(), SendMessage.class);
		
		switch(msg.getType()) {//메세지처리 분할
		//어떤메세지를 관리하고 처리할건지 내가 다 정한다!!!
			case "open" : addClient(session,msg);break;//client정보에 추가//처음 오픈이면
			//open -> session은 내가 관리해야함!
			case "msg" : sendMessage(msg);break;//메세지를 클라언트에게 전달
			case "system" : sendAdminMessage(msg) ;break;// 시스템정보를 클라이언트에게 전달
		}
	}
	//외부에서 사용할수 잇는건 msg하나뿐!!
	//다른건 모든 private!!!
	
	private void addClient(WebSocketSession session, SendMessage msg) throws IOException{
		session.getAttributes().put("info", msg);

		//방번호
		String roomNo = msg.getRoom();
		/************************************************/
		//방 안에 있는 사용자 목록
		Map<String,WebSocketSession> roomInfo = getRoomMember(roomNo);
		//방안에 사용자가 없으면...
		if(roomInfo == null) {
			roomInfo = new HashMap<String,WebSocketSession>();	
		}
		roomInfo.put(msg.getSender(), session);
		
		//방 목록
		//방이 없으면 새로 방 생성, 방이 있으면 방 만들지 말고 사용자 추가
		clients.put(roomNo, roomInfo);
		/************************************************/
		
		SendMessage adminmsg=new SendMessage("connection","","",msg.getSender()+"가 접속했습니다.",roomNo,0);
		System.out.println(clients.toString());
		
		//해당 방에 있는 사람 가져와서 입장 메세지 전달
		sendAdminMessage(adminmsg);
		
		
	}

	//메세시 전달 (DB저장됨)
	private void sendMessage(SendMessage msg) throws IOException{
		Map<String,WebSocketSession> roomMembers = getRoomMember(msg.getRoom());
		for(String id:roomMembers.keySet()) {
			WebSocketSession client=roomMembers.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
		}
		//DB INSERT (메세지 다 보낸 후)
		ChatMessage cmsg = new ChatMessage();
		cmsg.setMsgContent(msg.getMsg());
		cmsg.setChatNo(Integer.parseInt(msg.getRoom()));
		cmsg.setSendMember(msg.getSendMemberId());
		
		int result = service.insertMsg(cmsg);
		
	}
	
	//시스템메세지 (DB 저장안됨)
	private void sendAdminMessage(SendMessage msg) throws IOException {
		Map<String,WebSocketSession> roomMembers = getRoomMember(msg.getRoom());
		for(String id:roomMembers.keySet()) {
			WebSocketSession client=roomMembers.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
		}
	}

	//연결이 끝난후에
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("커넥션 클로즈");
		//채팅방 나간 사람의 세션을 삭제처리
		//사람이 아무도 없으면 방을 삭제

		//세션아이디 가져옴
		String sessionId = session.getId();//로그아웃한 세션 아이디
		
		//소켓 종료
		if(clients.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			//방 번호의 참여자 목록을 가져옴
			for(String roomNo:clients.keySet()) {//방별로 접속한 사용자를 찾기위하여 반복분 돌린다!
				//keySet : 맵 반복분 돌릴경우 키값을 모를때 가져오는 방법! 차차 좀 기억하쟈..!!
				Map<String,WebSocketSession> roomMember = getRoomMember(roomNo); //방에 들어온사람 가져옴
				if(roomMember!=null) {//방에들어온 사람이 null이 아니면
					
					for(String memberId : roomMember.keySet()) {//사람마다 방에 접속여부를 찾기위하여 반복분 실행!
						WebSocketSession memberInfo = roomMember.get(memberId);//방접속한참여자의 웹소켓 정보를 가져와서 웹소켓 세션에 담았음
						String memberInfoSessionId = memberInfo.getId();//웹소켓에담은 접속자 정보를 멤버인포세션아이디에 담아줌 -> 추후 비교하기위하여
						if(sessionId.equals(memberInfoSessionId)) {//만약 로그아웃한 아이디 = 방접속한 참여자가 같으면
							System.out.println(memberId + "로그아웃");
							roomMember.remove(memberId);//세션삭제 = 로그아웃 처리
							
							//방을 나가면 방의사람에게 방 나갔다고 메세지 출력
							SendMessage adminmsg=new SendMessage("disconnection","","",memberId+"가 방을 나갔습니다.",roomNo,0);						
							sendAdminMessage(adminmsg);
						}
					}
				}
			}
		}
		super.afterConnectionClosed(session, status);
	}

	//방에 있는 사람 목록 가져오기
	private Map<String,WebSocketSession> getRoomMember(String roomNo){
		return clients.get(roomNo);
	}
}
