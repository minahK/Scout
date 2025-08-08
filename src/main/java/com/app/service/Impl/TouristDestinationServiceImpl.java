package com.app.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.mapper.TouristDestinationMapper;
import com.app.service.TouristDestinationService;

@Service
public class TouristDestinationServiceImpl implements TouristDestinationService {
    @Autowired
    private TouristDestinationMapper touristDestinationMapper;

    @Override
    public List<TouristDestinationDTO> getAllDestinations() {
        return touristDestinationMapper.getAllDestinations();
    }

	@Override
	public TouristDestinationDTO getDestinationById(Long id) {
	
		return null;
	}

	@Override
	public int addDestination(TouristDestinationDTO dto) {
		
		return 0;
	}

	@Override
	public int updateDestination(TouristDestinationDTO dto) {
	
		return 0;
	}

	@Override
	public int deleteDestination(Long id) {
		
		return 0;
	}

	
}