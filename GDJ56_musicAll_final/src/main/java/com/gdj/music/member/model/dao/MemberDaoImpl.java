package com.gdj.music.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.member.model.vo.Member;
import com.gdj.music.member.model.vo.Terms;
import com.gdj.music.question.model.vo.Question;

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Override
	public Member loginEnd(Member m, SqlSessionTemplate session) {
		return session.selectOne("member.loginEnd",m);
	}

	@Override
	public int join(Member m, SqlSessionTemplate session) {
		return session.insert("member.join",m);
	}

	@Override
	public Member findidEnd(Member member, SqlSessionTemplate session) {
		return session.selectOne("member.findId",member);
	}

	@Override
	public Member findpwEnd(Member member, SqlSessionTemplate session) {
		return session.selectOne("member.findPw",member);
	}

	@Override
	public int newPw(String newPw, String repwid, SqlSessionTemplate session) {
		Member m = new Member();
		m.setPassword(newPw);
		m.setMember_Id(repwid);
		
		return session.update("member.newPw",m);
	}

	@Override
	public Member idDupicate(String member_id, SqlSessionTemplate session) {
		return session.selectOne("member.idDuplicate",member_id);
	}

	@Override
	public List<Terms> joinTermsY(SqlSessionTemplate session) {
		return session.selectList("member.joinTermsY");
	}

	@Override
	public List<Terms> joinTermsN(SqlSessionTemplate session) {
		return session.selectList("member.joinTermsN");
	}

	@Override
	public Terms joinTerms1(int term_code, SqlSessionTemplate session) {
		return session.selectOne("member.joinTerm1",term_code);
	}

	@Override
	public int insertq(SqlSessionTemplate session, Question q) {
		return session.insert("question.insertq",q);
	}

	@Override
	public Question myqDetail(SqlSessionTemplate session, Question q) {
		return session.selectOne("question.myDetail",q);
	}

	@Override
	public Member selectKakaoInfo(SqlSessionTemplate session, String id) {
		return session.selectOne("member.selectKakaoInfo", id);
	}
	
	
	

	
	
	
	
	
	
	
	
	
	

	
}
