package com.gdj.music.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.member.model.vo.Member;
import com.gdj.music.member.model.vo.Terms;
import com.gdj.music.question.model.vo.Question;

public interface MemberDao {

	Member loginEnd(Member m, SqlSessionTemplate session);

	int join(Member m, SqlSessionTemplate session);

	Member findidEnd(Member member, SqlSessionTemplate session);

	Member findpwEnd(Member member, SqlSessionTemplate session);

	int newPw(String newPw, String repwid, SqlSessionTemplate session);

	Member idDupicate(String member_id, SqlSessionTemplate session);

	List<Terms> joinTermsY(SqlSessionTemplate session);

	List<Terms> joinTermsN(SqlSessionTemplate session);

	Terms joinTerms1(int term_code, SqlSessionTemplate session);

	int insertq(SqlSessionTemplate session, Question q);

	Question myqDetail(SqlSessionTemplate session, Question q);

	Member selectKakaoInfo(SqlSessionTemplate session, String id);

	int updateQ(SqlSessionTemplate session, Question q);

	int deleteQ(SqlSessionTemplate session, Question qt);


}
