package com.app.dao;

import java.util.List;

import com.app.dto.TouristRequestDTO;

public interface TouristRequestDAO {
    void insert(TouristRequestDTO dto);
    List<TouristRequestDTO> selectAll();
    TouristRequestDTO selectOne(int id);
    // update, delete 등 필요시 추가
}