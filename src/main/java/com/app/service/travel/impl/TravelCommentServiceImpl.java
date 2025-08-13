package com.app.service.travel.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.travel.TravelCommentDAO;
import com.app.dto.travel.CommentDTO;
import com.app.service.travel.TravelCommentService;

@Service
public class TravelCommentServiceImpl implements TravelCommentService{

	@Autowired
	private TravelCommentDAO commentDAO;
	
	@Override
	public List<CommentDTO> findCommentsByArticleId(int articleId) {
		
		return commentDAO.findCommentsByArticleId(articleId);
	}

	@Override
	public void insertComment(CommentDTO comment) {
		
		commentDAO.insertComment(comment);
	}

	@Override
	public void updateComment(CommentDTO comment) {
		
		commentDAO.updateComment(comment);
	}

	@Override
	public void deleteComment(int id) {
		
		commentDAO.deleteComment(id);
	}

	@Override
	public CommentDTO findById(int id) {
		
		return commentDAO.findById(id);
	}

}
