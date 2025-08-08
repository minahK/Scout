CREATE TABLE TRAVEL_COURSE (
  COURSE_ID   NUMBER PRIMARY KEY,                   -- 코스 ID (PK)
  TITLE       VARCHAR2(200),                        -- 코스명
  DESCRIPTION CLOB,                                 -- 상세설명
  REGION_ID   NUMBER REFERENCES REGION(REGION_ID),  -- 지역 ID (FK)
  USER_ID     NUMBER REFERENCES USERS(USER_ID),     -- 작성자 (FK)
  CREATED_AT  DATE                                  -- 등록일시
);

-- 시퀀스 (PK 자동 증가)
CREATE SEQUENCE TRAVEL_COURSE_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;