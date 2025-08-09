CREATE TABLE password_reset_tokens (
    token VARCHAR2(255) PRIMARY KEY,
    email VARCHAR2(255) NOT NULL,
    expiry TIMESTAMP NOT NULL,
    used CHAR(1) DEFAULT 'N' -- 'Y' or 'N'으로 처리
);
