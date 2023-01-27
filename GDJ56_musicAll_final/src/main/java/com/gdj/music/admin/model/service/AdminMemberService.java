package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.member.model.vo.Member;

public interface AdminMemberService {
	List<Member> memberList(Map<String,Integer> param);
	int totalData();
	int deleteMember(int memberNo);
}
