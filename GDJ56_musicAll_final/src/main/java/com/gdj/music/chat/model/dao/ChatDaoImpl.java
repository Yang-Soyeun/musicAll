package com.gdj.music.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.chat.model.vo.ChatMessage;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public int insertMsg(ChatMessage cmsg, SqlSessionTemplate session) {
		return session.insert("chat.insertMsg",cmsg);
	}

	
}
