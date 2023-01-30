package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.admin.model.dao.AdminQuestionDao;
import com.gdj.music.question.model.vo.Question;

@Service
public class AdminQuestionServiceImpl implements AdminQuestionService {

	private AdminQuestionDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public AdminQuestionServiceImpl(AdminQuestionDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public int totalData() {
		return dao.totalData(session);
	}

	@Override
	public List<Question> questionList(Map<String, Integer> param) {
		return dao.questionList(session, param);
	}
	
	
	
	
	
	
	
	
	
}