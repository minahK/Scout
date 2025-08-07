package com.app.dto.travelDestination;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TravelInfo {

	private int id;               // 여행지 고유번호
    private String contact;       // 문의 및 안내
    private String homepage;      // 홈페이지
    private String address;       // 주소
    private String openTime;      // 이용시간
    private String holiday;       // 휴일
    private String parking;       // 주차 가능여부
    private String admission;     // 입장료
}
