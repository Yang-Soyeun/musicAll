package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.admin.model.dao.AdminPerforDao;
import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;

@Service
public class AdminPerforServiceImpl implements AdminPerforService{
	
	private SqlSessionTemplate session;
	private AdminPerforDao dao;
	
	@Autowired
	public AdminPerforServiceImpl(SqlSessionTemplate session, AdminPerforDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}
	
	@Override
	@Transactional
	public int insertPerformance(Performance2 p,List<Schedule> sc,List<PerformancePhoto> files) {
		int result=dao.insertPerformance(session,p);
		if(result>0) {
			int result2=0;
			for(Schedule s:sc) {
				result2+=dao.insertSchedule(session,s);
				System.out.println("insert 스케줄:"+s);	
			}
			if(result2==sc.size()) {
				int result3=0;
				for(PerformancePhoto pp:files) {
					result3+=dao.insertPhoto(session,pp);
					System.out.println("insert 사진:"+pp);
				}
				if(result3!=files.size()) throw new RuntimeException("공연등록실패");
			}else {
				throw new RuntimeException("공연등록실패");
			}
		}
		return result;
	}
	
	@Override
	public List<Map<String, PerformancePhoto>> selectPerforList(){
		return dao.selectPerforList(session);
	}
	
	@Override
	public Performance2 selectPerformanceView(int mCode) {
		return dao.selectPerformanceView(session, mCode);
	}
	
	@Override
	public List<Map<String, Schedule>> selectSchedule(int mCode) {
		return dao.selectSchedule(session, mCode);
	}
	
	@Override
	public List<PerformancePhoto> selectPhoto(int mCode) {
		return dao.selectPhoto(session, mCode);
	}
	@Override
	public int deleteAll(int mCode) {
		int result=dao.deletePerformance(session,mCode);
		if(result>0) {
			int result2=dao.deletePhoto(session, mCode);
		}
		return result;
	}

	@Override
	public List<Schedule> selectSchedule2(int mCode) {
		return dao.selectSchedule2(session, mCode);
	}
	
	@Override
	@Transactional
	public int updatePerformance(Performance2 p, List<Schedule> sc, List<PerformancePhoto> files) {
		int result=dao.updatePerformance(session,p);
		int mCode = p.getMCode();
		if(result>0) {
			int result2=dao.deleteSchedule(session,mCode);
			if(files.size()>0) {
				int result3=dao.deletePhoto(session,mCode);
				for(PerformancePhoto pp : files) {
					pp.setMCode(mCode);
					result3+=dao.updatePhoto(session, pp);
				}
			}
			if(result2>0) {
				for(Schedule s:sc) {
					s.setMCode(mCode);
					result2+=dao.updateSchedule(session, s);
				}
			}
		}
		return result;
	}
	@Override
	public List<Map<String, Review>> selectComment(int mCode) {
		return dao.selectComment(session,mCode);
	}
	@Override
	public int selectAverage(int mCode) {
		return dao.selectAverage(session,mCode);
	}
	@Override
	public int deleteComment(int reviewNo) {
		return dao.deleteComment(session,reviewNo);
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyRecent() {
		return dao.orderbyRecent(session);
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyEnd() {
		return dao.orderbyEnd(session);
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForType(String mType1) {
		return dao.searchForType(session,mType1);
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForTitle(Map<String, Object> map) {
		return dao.searchForTitle(session,map);
	}
}
