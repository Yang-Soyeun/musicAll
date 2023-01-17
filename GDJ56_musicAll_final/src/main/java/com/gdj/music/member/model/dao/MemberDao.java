package com.gdj.music.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.member.model.vo.Member;

public interface MemberDao {

	Member loginEnd(Member m, SqlSessionTemplate session);

}
