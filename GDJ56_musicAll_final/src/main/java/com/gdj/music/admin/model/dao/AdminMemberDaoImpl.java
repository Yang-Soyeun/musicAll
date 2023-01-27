package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.member.model.vo.Member;
@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Override
	public List<Member> memberList(SqlSessionTemplate session,Map<String,Integer> param) {
		// TODO Auto-generated method stub
		return session.selectList("adminMem.memberList",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}

	@Override
	public int totalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("adminMem.totalData");
	}

	@Override
	public int deleteMember(SqlSessionTemplate session, int memberNo) {
		// TODO Auto-generated method stub
		return session.delete("adminMem.deleteMember",memberNo);
	}
	
}
