package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.RegionDTO;
import com.app.mapper.RegionMapper;

@Service
public class RegionService {
    @Autowired private RegionMapper regionMapper;
    public List<RegionDTO> getAllRegions() {
        return regionMapper.selectAllRegions();
    }
}
