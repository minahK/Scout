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
        if(tagName == null || tagName.trim().isEmpty()) return;
        tagName = tagName.trim();
        if (tagMapper.findByTagName(tagName) == null) {
            tagMapper.insertTag(tagName);
        }
    }

    @Override
    public List<TagDTO> getAllTags() {
        return tagMapper.getAllTags();
    }
}