package com.app.mapper;


import com.app.dto.TravelPlaceDTO;
import com.app.entity.TravelPlace;
import java.util.List;

public interface TravelPlaceMapper {
	  List<TravelPlaceDTO> selectAll();
	    TravelPlaceDTO selectById(int placeId);
	    void insert(TravelPlaceDTO place);
	    void update(TravelPlaceDTO place);
	    void delete(int placeId);
}