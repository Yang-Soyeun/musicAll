package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.admin.model.vo.NoticeImg;
@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao {

	@Override
	public int insertNotice(SqlSessionTemplate session, Notice n) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertNotice",n);
	}

	@Override
	public int insertNoticeImg(SqlSessionTemplate session, NoticeImg ni) {
		// TODO Auto-generated method stub
		return session.insert("noticeImg.insertImg",ni);
	}

	@Override
	public List<Notice> noticeList(SqlSessionTemplate session, Map<String, Integer> param) {
		// TODO Auto-generated method stub
		return session.selectList("notice.noticeList", null, new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public NoticeImg selectImg(SqlSessionTemplate session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("noticeImg.selectImg",noticeNo);
	}

	@Override
	public int totalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.totalData");
	}

	@Override
	public Notice noticeView(SqlSessionTemplate session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.noticeView", noticeNo);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("notice.deleteNotice",noticeNo);
	}

	@Override
	public int updateNotice(SqlSessionTemplate session, Notice n) {
		// TODO Auto-generated method stub
		return session.insert("notice.updateNotice",n);
	}

	@Override
	public int deletePhoto(SqlSessionTemplate session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("noticeImg.deletePhoto",noticeNo);
	}

	@Override
	public int updatePhoto(SqlSessionTemplate session, NoticeImg ni) {
		// TODO Auto-generated method stub
		return session.update("noticeImg.updatePhoto",ni);
	}
	
}
