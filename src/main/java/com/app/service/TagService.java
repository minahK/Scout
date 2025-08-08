package com.app.service;

import java.util.List;

import com.app.dto.TagDTO;

public interface TagService {

	 void addTag(String tagName);
	    List<TagDTO> getAllTags();
}
