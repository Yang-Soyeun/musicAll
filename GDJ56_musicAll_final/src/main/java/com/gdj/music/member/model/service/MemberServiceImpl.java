package com.gdj.music.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.member.model.dao.MemberDao;
import com.gdj.music.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MemberServiceImpl(MemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public Member loginEnd(Member m) {
		return dao.loginEnd(m,session);
	}

	@Override
	public int join(Member m) {
		return dao.join(m,session);
	}

	@Override
	public Member findidEnd(Member member) {
		return dao.findidEnd(member, session);
	}
	
	
	
	
	
	
}
