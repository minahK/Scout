package com.app.dao.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.travel.TravelCommentDAO;
import com.app.dto.travel.CommentDTO;

@Repository
public class TravelCommentDAOImpl implements TravelCommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CommentDTO> findCommentsByArticleId(int articleId) {
		
		return sqlSession.selectList("com.app.mapper.travel.TravelCommentMapper.findCommentsByArticleId", articleId);
	}

	@Override
	public void insertComment(CommentDTO comment) {
		
		sqlSession.insert("com.app.mapper.travel.TravelCommentMapper.insertComment", comment);
	}

	@Override
	public void updateComment(CommentDTO comment) {
		
		sqlSession.update("com.app.mapper.travel.TravelCommentMapper.updateComment", comment);
	}

	@Override
	public void deleteComment(int id) {
		
		sqlSession.delete("com.app.mapper.travel.TravelCommentMapper.deleteComment", id);
	}

}
