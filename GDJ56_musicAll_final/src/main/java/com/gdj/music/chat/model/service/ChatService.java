package com.gdj.music.chat.model.service;


import java.util.List;

import com.gdj.music.chat.model.vo.ChatHistory;
import com.gdj.music.chat.model.vo.ChatMessage;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Performance2;


public interface ChatService {

	int insertMsg(ChatMessage cmsg);


	List<Performance2> chatRoom(Member m);


	List<ChatHistory> chatHistory(int chatNo);
}
