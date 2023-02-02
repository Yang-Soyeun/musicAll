package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.admin.model.vo.Comment;
import com.gdj.music.question.model.vo.Question;

@Repository
public class AdminQuestionDaoImpl implements AdminQuestionDao {

	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("adminQ.totalData");
	}

	@Override
	public List<Question> questionList(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("adminQ.questionList", null,
				new RowBounds((param.get("cPage") - 1) * param.get("numPerpage"), param.get("numPerpage")));
	}

	@Override
	public Question answerQ(SqlSessionTemplate session, Question q) {
		return session.selectOne("adminQ.answerQuestion", q);
	}

	@Override
	public int comment(SqlSessionTemplate session, Comment c) {
		return session.insert("adminQ.comment", c);
	}

	@Override
	public int commentYN(SqlSessionTemplate session, Comment c) {
		return session.update("adminQ.commentYN", c);
	}

	@Override
	public Comment commnetList(SqlSessionTemplate session, Question q) {
		return session.selectOne("adminQ.commentList",q);
	}

	@Override
	public int updateComment(SqlSessionTemplate session, Comment cm) {
		return session.update("adminQ.updateCommnet",cm);
	}

	
	
	
}
	
