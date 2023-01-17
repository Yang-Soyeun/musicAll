package com.gdj.music.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Override
	public Member loginEnd(Member m, SqlSessionTemplate session) {
		return session.selectOne("member.loginEnd",m);
	}

	
}
