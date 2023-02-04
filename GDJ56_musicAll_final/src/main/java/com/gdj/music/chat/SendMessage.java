package com.gdj.music.chat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SendMessage {
	private String type;	//메세지타입?
	private String sender;	//채팅발신자
	private String reciever; //채팅수신자
	private String msg;	//채팅메세지
	private String room; //채팅방번호
	private int sendMemberId;
}
