package com.gdj.music.member.model.service;

import com.gdj.music.member.model.vo.Member;

public interface MemberService {

	Member loginEnd(Member m);

	int join(Member m);

	Member findidEnd(Member member);

	Member findpwEnd(Member member);

	int newPw(String newPw, String repwid);


}
