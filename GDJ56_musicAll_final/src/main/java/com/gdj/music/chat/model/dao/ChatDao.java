package com.gdj.music.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.chat.model.vo.ChatHistory;
import com.gdj.music.chat.model.vo.ChatListVo;
import com.gdj.music.chat.model.vo.ChatMessage;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Performance2;

public interface ChatDao {

	int insertMsg(ChatMessage cmsg, SqlSessionTemplate session);

	List<ChatListVo> chatRoom(Member m, SqlSessionTemplate session);

	List<ChatHistory> chatHistory(int chatNo, SqlSessionTemplate session);

}
