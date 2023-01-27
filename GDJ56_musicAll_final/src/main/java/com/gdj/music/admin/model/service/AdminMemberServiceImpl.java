package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.admin.model.dao.AdminMemberDao;
import com.gdj.music.member.model.vo.Member;
@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	private AdminMemberDao dao;
	private SqlSessionTemplate session;

	@Autowired
	public AdminMemberServiceImpl(AdminMemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<Member> memberList(Map<String,Integer> param) {
		// TODO Auto-generated method stub
		return dao.memberList(session,param);
	}

	@Override
	public int totalData() {
		// TODO Auto-generated method stub
		return dao.totalData(session);
	}

	@Override
	public int deleteMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.deleteMember(session,memberNo);
	}
	
	
}
