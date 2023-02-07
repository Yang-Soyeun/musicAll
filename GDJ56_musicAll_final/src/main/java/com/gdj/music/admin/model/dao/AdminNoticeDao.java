package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.admin.model.vo.NoticeImg;

public interface AdminNoticeDao {

	int insertNotice(SqlSessionTemplate session, Notice n);
	int insertNoticeImg(SqlSessionTemplate session, NoticeImg ni);
	List<Notice> noticeList(SqlSessionTemplate session, Map<String, Integer> param);
	NoticeImg selectImg(SqlSessionTemplate session, int noticeNo);
	int totalData(SqlSessionTemplate session);
	Notice noticeView(SqlSessionTemplate session, int noticeNo);
	int deleteNotice(SqlSessionTemplate session, int noticeNo);
	int updateNotice(SqlSessionTemplate session, Notice n);
	int deletePhoto(SqlSessionTemplate session, int noticeNo);
	int updatePhoto(SqlSessionTemplate session, NoticeImg ni);
	
	
}
