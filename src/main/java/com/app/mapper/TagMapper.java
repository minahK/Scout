package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.app.dto.TagDTO;

@Mapper
public interface TagMapper {
	TagDTO findByTagName(@Param("tagName") String tagName);

	int insertTag(@Param("tagName") String tagName);

	List<TagDTO> getAllTags();
}