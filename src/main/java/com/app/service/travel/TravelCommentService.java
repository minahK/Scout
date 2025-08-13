package com.app.service.travel;

import java.util.List;

import com.app.dto.travel.CommentDTO;

public interface TravelCommentService {

	List<CommentDTO> findCommentsByArticleId(int articleId);
	void insertComment(CommentDTO comment);
	void updateComment(CommentDTO comment);
	void deleteComment(int id);
	
	CommentDTO findById(int id);
}
