package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.app.dto.TagDTO;

@Mapper
public interface TagMapper {
	// 중복 체크용
	TagDTO findByTagName(@Param("tagName") String tagName);

	// 태그 추가
	int insertTag(@Param("tagName") String tagName);

	// 전체 태그 리스트 조회
	List<TagDTO> getAllTags();
}