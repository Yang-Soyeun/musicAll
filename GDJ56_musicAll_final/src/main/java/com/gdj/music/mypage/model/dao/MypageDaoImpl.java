package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.reservation.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao {

	//포인트리스트 출력
	@Override
	public List<Point> selectPointListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param) {
		return session.selectList("mypage.selectPointListPage",member_No,
						new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
						,param.get("numPerpage")));
	}

	//남은 포인트 출력
	@Override
	public Point selectPoint(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectPoint",member_No);
	}

	@Override
	public int selectPointCount(SqlSessionTemplate session,int member_No) {
		return session.selectOne("mypage.selectPointCount",member_No);
	}
	
	
	
}
