package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.member.model.vo.Member;

public interface AdminMemberDao {

	List<Member> memberList(SqlSessionTemplate session,Map<String,Integer> param);
	int totalData(SqlSessionTemplate session);
	int deleteMember(SqlSessionTemplate session, int memberNo);
}
