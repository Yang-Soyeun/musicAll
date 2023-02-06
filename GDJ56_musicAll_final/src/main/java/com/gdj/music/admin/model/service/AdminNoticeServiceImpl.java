package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.admin.model.dao.AdminNoticeDao;
import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.admin.model.vo.NoticeImg;
@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	private SqlSessionTemplate session;
	private AdminNoticeDao dao;
	
	
	@Autowired
	public AdminNoticeServiceImpl(SqlSessionTemplate session, AdminNoticeDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}

	//공지 등록
	@Override
	@Transactional
	public int insertNotice(Notice n, List<NoticeImg> files) {
		
		int result = dao.insertNotice(session,n);
		
		if(result>0) {
			int result2 = 0;
			
			for(NoticeImg ni : files) {
				
				result2 += dao.insertNoticeImg(session,ni);
			}
			if(result2 != files.size()) throw new RuntimeException("이미지 등록 실패");
		}else {
			
			throw new RuntimeException("공지 등록 실패");
		}
		
		return result;
	}

	@Override
	public List<Notice> noticeList(Map<String, Integer> param) {
		return dao.noticeList(session,param);
	}

	@Override
	public NoticeImg selectImg(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectImg(session, noticeNo);
	}

	


	@Override
	public Notice noticeView(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.noticeView(session, noticeNo);
	}

	@Override
	public int totalData() {
		// TODO Auto-generated method stub
		return dao.totalData(session);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(session, noticeNo);
	}

	@Override
	public int updateNotice(Notice n, List<NoticeImg> files) {
		// TODO Auto-generated method stub
		int result=dao.updateNotice(session,n);
		if(result>0) {
			if(files.size()>0) {
				int result2=dao.deletePhoto(session,n.getNoticeNo());
				for(NoticeImg ni : files) {
					result2+=dao.updatePhoto(session,ni);
				}
			}
	
		}
		
		return result;
		
	}
	
	
}
