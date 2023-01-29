package com.gdj.music.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.member.model.dao.MemberDao;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.member.model.vo.Terms;
import com.gdj.music.question.model.vo.Question;

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

	@Override
	public Member findpwEnd(Member member) {
		return dao.findpwEnd(member,session);
	}

	@Override
	public int newPw(String newPw, String repwid) {
		return dao.newPw(newPw,repwid,session);
	}

	@Override
	public Member idDuplicate(String member_id) {
		return dao.idDupicate(member_id, session);
	}
	
	@Override
	public List<Terms> joinTermsY(){
		return dao.joinTermsY(session);
	}

	@Override
	public List<Terms> joinTermsN() {
		return dao.joinTermsN(session);
	}

	@Override
	public Terms joinTerm1(int term_code) {
		return dao.joinTerms1(term_code,session);
	}

	@Override
	public int insertq(Question q) {
		return dao.insertq(session,q);
	}

	@Override
	public Question myqDetail(Question q) {
		return dao.myqDetail(session, q);
	}

	@Override
	public Member selectKakaoInfo(String id) {
		return dao.selectKakaoInfo(session, id);
	}

	@Override
	public int updateQ(Question q) {
		return dao.updateQ(session, q);
	}

	@Override
	public int deleteQ(Question qt) {
		return dao.deleteQ(session,qt);
	}
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	
}
