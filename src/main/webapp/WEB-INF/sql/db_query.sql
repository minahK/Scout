CREATE TABLE travel_place (
    place_id NUMBER PRIMARY KEY,
    title VARCHAR2(200),
    content CLOB,
    file_name VARCHAR2(200),
    latitude NUMBER,
    longitude NUMBER,
    reg_date DATE
);

CREATE SEQUENCE travel_place_seq START WITH 1 INCREMENT BY 1;