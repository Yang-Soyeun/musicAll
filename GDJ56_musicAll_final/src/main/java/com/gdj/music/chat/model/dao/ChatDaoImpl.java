package com.gdj.music.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.chat.model.vo.ChatHistory;
import com.gdj.music.chat.model.vo.ChatListVo;
import com.gdj.music.chat.model.vo.ChatMessage;
import com.gdj.music.member.model.vo.Member;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public int insertMsg(ChatMessage cmsg, SqlSessionTemplate session) {
		return session.insert("chat.insertMsg",cmsg);
	}

	@Override
	public List<ChatListVo> chatRoom(Member m, SqlSessionTemplate session) {
		return session.selectList("chat.chatRoom",m);
	}

	@Override
	public List<ChatHistory> chatHistory(int chatNo, SqlSessionTemplate session) {
		return session.selectList("chat.chatHistory",chatNo);
	}
	
	

	
}
