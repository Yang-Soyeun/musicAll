package com.gdj.music.perfor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;

public interface PerformanceDao {

	List<PerformancePhoto> selectPerforList(SqlSessionTemplate session);

	Performance2 selectPerformanceView(SqlSessionTemplate session,int mCode);

	List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode);

}
