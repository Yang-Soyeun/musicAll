package com.gdj.music.perfor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;

@Repository
public class PerformanceDaoImpl implements PerformanceDao{
	
	@Override
	public List<PerformancePhoto> selectPerforList(SqlSessionTemplate session) {
		return session.selectList("img.selectPerforList");
	}
	@Override
	public Performance2 selectPerformanceView(SqlSessionTemplate session,int mCode) {
		return session.selectOne("musical.selectPerformanceView",mCode);
	}
	@Override
	public List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode) {
		return session.selectList("img.selectPhoto",mCode);
	}
}
