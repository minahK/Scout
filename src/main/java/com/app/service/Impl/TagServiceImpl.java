package com.app.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.TagDTO;
import com.app.mapper.TagMapper;
import com.app.service.TagService;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public void addTag(String tagName) {
        // 공백·null·중복 체크
        if(tagName == null) return;
        tagName = tagName.trim();
        if(tagName.isEmpty()) return;

        TagDTO exists = tagMapper.findByTagName(tagName);
        if (exists == null) {
            tagMapper.insertTag(tagName);
        }
        // 이미 있으면 아무 동작 안함 (실무에선 에러/메시지 처리)
    }

    @Override
    public List<TagDTO> getAllTags() {
        return tagMapper.getAllTags();
    }
}