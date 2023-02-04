package com.gdj.music.chat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.chat.model.dao.ChatDao;
import com.gdj.music.chat.model.vo.ChatMessage;
@Service
public class ChatServiceImpl implements ChatService {

	private ChatDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ChatServiceImpl(ChatDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}



	@Override
	public int insertMsg(ChatMessage cmsg) {
		return dao.insertMsg(cmsg, session);
	}

	
}
