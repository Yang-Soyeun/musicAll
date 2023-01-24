package com.gdj.music.member.model.service;

import java.util.List;

import com.gdj.music.member.model.vo.Member;
import com.gdj.music.member.model.vo.Terms;

public interface MemberService {

	Member loginEnd(Member m);

	int join(Member m);

	Member findidEnd(Member member);

	Member findpwEnd(Member member);

	int newPw(String newPw, String repwid);

	Member idDuplicate(String member_id);

	List<Terms> joinTermsY();

	List<Terms> joinTermsN();

	Terms joinTerm1(int term_code);


}
