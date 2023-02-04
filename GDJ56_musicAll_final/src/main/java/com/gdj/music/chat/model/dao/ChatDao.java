package com.gdj.music.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.chat.model.vo.ChatMessage;

public interface ChatDao {

	int insertMsg(ChatMessage cmsg, SqlSessionTemplate session);

}
