package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.dto.RegionDTO;


@Mapper
public interface RegionMapper {

	  List<RegionDTO> selectAllRegions();

}
