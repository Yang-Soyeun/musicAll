package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.admin.model.vo.NoticeImg;

public interface AdminNoticeService {

	int insertNotice(Notice n, List<NoticeImg> files);
	
	List<Notice> noticeList(Map<String, Integer> param);
	Notice noticeView(int noticeNo);
	NoticeImg selectImg(int noticeNo);
	int totalData();
	int deleteNotice(int noticeNo);
	int updateNotice(Notice n, List<NoticeImg> files);
	
	
	
	
}
