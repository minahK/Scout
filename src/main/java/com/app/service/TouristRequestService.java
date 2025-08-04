package com.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.app.dto.TouristRequestDTO;

@Service
public class TouristRequestService {
	
	
	// 실제로는 DAO와 연동, 여기선 임시 리스트로 예시
	private List<TouristRequestDTO> inMemoryDb = new ArrayList<>();

	public List<TouristRequestDTO> getAllRequests() {
		return inMemoryDb;
	}

	public void saveRequest(TouristRequestDTO dto, MultipartFile file) {
		// 파일 저장 로직 구현 (예: 서버에 파일 저장 후 경로를 dto.setFilePath(...)에 저장)
		// if (!file.isEmpty()) { ... }

		// DB 저장 (여기선 임시)
		dto.setRequestId((long) (inMemoryDb.size() + 1));
		dto.setCreatedAt(new java.util.Date());
		inMemoryDb.add(dto);
	}
}