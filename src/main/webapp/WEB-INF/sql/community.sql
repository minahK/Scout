CREATE TABLE T_TRACE_USERS (
  UserID NUMBER PRIMARY KEY,
  Username VARCHAR2(50),
  Handle VARCHAR2(50) UNIQUE, 
  Email VARCHAR2(100),
  Password VARCHAR2(100),
  Nickname VARCHAR2(50),
  ProfileImage VARCHAR2(255),
  UserType VARCHAR2(20),
  JoinDate DATE
);
CREATE SEQUENCE T_TRACE_USERS_SEQ START WITH 1 INCREMENT BY 1;

-- Users
INSERT INTO T_TRACE_USERS (UserID, Username, Handle, Email, Password, Nickname, ProfileImage, UserType, JoinDate)
VALUES (T_TRACE_USERS_SEQ.NEXTVAL, 'jipgagosipda', '@jipgagosipda', 'nomore@example.com', 'pw1234', 'Min', 'avatar1.png', 'normal', SYSDATE);
INSERT INTO T_TRACE_USERS (UserID, Username, Handle, Email, Password, Nickname, ProfileImage, UserType, JoinDate)
VALUES (T_TRACE_USERS_SEQ.NEXTVAL, 'sunny', '@sunny', 'sunny@example.com', 'pw5678', 'Sunny', 'avatar2.png', 'normal', SYSDATE);
INSERT INTO T_TRACE_USERS (UserID, Username, Handle, Email, Password, Nickname, ProfileImage, UserType, JoinDate)
VALUES (T_TRACE_USERS_SEQ.NEXTVAL, 'leo', '@leo123', 'leo@example.com', 'pw9012', 'Leo', 'avatar3.png', 'normal', SYSDATE);
INSERT INTO T_TRACE_USERS (UserID, Username, Handle, Email, Password, Nickname, ProfileImage, UserType, JoinDate)
VALUES (T_TRACE_USERS_SEQ.NEXTVAL, 'mira', '@mira_hun', 'mira@example.com', 'pw3456', 'Mira', 'avatar4.png', 'normal', SYSDATE);
INSERT INTO T_TRACE_USERS (UserID, Username, Handle, Email, Password, Nickname, ProfileImage, UserType, JoinDate)
VALUES (T_TRACE_USERS_SEQ.NEXTVAL, 'hyun', '@hyun09', 'hyun@example.com', 'pw7890', 'Hyun', 'avatar5.png', 'normal', SYSDATE);

select * from T_TRACE_USERS;

UPDATE T_TRACE_USERS
SET ProfileImage = 'dog.jpg'
WHERE UserID = 1;

UPDATE T_TRACE_USERS
SET ProfileImage = 'lotus.jpg'
WHERE UserID = 23;


UPDATE T_TRACE_USERS
SET ProfileImage = 'gnome.jpg'
WHERE UserID = 24;


UPDATE T_TRACE_USERS
SET ProfileImage = 'christmas.jpg'
WHERE UserID = 25;


UPDATE T_TRACE_USERS
SET ProfileImage = 'woman.jpg'
WHERE UserID = 26;


select * from T_user;


CREATE TABLE T_TRACE_POSTS (
  PostID NUMBER PRIMARY KEY,
  AuthorID NUMBER REFERENCES T_USER(ID),
  Content CLOB,
  ImageURL VARCHAR2(255),
  CreatedAt DATE,
  UpdatedAt DATE,
  LikesCount NUMBER,
  RepostsCount NUMBER,
  ReplyToPostID NUMBER
);
CREATE SEQUENCE T_TRACE_POSTS_SEQ START WITH 1 INCREMENT BY 1;

select * from T_TRACE_POSTS;

-- posts
INSERT INTO T_TRACE_POSTS (PostID, AuthorID, Content, ImageURL, CreatedAt, UpdatedAt, LikesCount, RepostsCount, ReplyToPostID)
VALUES (T_TRACE_POSTS_SEQ.NEXTVAL, 1, '안녕하세요! TRACE 시작합니다.', NULL, SYSDATE, NULL, 5, 2, NULL);
INSERT INTO T_TRACE_POSTS (PostID, AuthorID, Content, ImageURL, CreatedAt, UpdatedAt, LikesCount, RepostsCount, ReplyToPostID)
VALUES (T_TRACE_POSTS_SEQ.NEXTVAL, 23, '오늘 날씨 너무 좋아요 ☀️', 'weather.jpg', SYSDATE, NULL, 3, 1, NULL);
INSERT INTO T_TRACE_POSTS (PostID, AuthorID, Content, ImageURL, CreatedAt, UpdatedAt, LikesCount, RepostsCount, ReplyToPostID)
VALUES (T_TRACE_POSTS_SEQ.NEXTVAL, 24, '🍜 점심은 라멘!', 'ramen.png', SYSDATE, NULL, 8, 4, NULL);
INSERT INTO T_TRACE_POSTS (PostID, AuthorID, Content, ImageURL, CreatedAt, UpdatedAt, LikesCount, RepostsCount, ReplyToPostID)
VALUES (T_TRACE_POSTS_SEQ.NEXTVAL, 25, '여행와서도 하루종일 코딩 중...', NULL, SYSDATE, NULL, 6, 2, NULL);
INSERT INTO T_TRACE_POSTS (PostID, AuthorID, Content, ImageURL, CreatedAt, UpdatedAt, LikesCount, RepostsCount, ReplyToPostID)
VALUES (T_TRACE_POSTS_SEQ.NEXTVAL, 26, '비행기 타러 갑니다 ✈️', 'flight.jpg', SYSDATE, NULL, 10, 5, NULL);


ALTER TABLE T_TRACE_POSTS ADD Category VARCHAR2(30);

UPDATE T_TRACE_POSTS SET Category = '테크놀로지' WHERE PostID = 21;
UPDATE T_TRACE_POSTS SET Category = '여행' WHERE PostID = 24;
UPDATE T_TRACE_POSTS SET Category = '엔터테인먼트' WHERE PostID = 26;








CREATE TABLE T_TRACE_FOLLOWS (
  FollowID NUMBER PRIMARY KEY,
  FollowerID NUMBER REFERENCES T_TRACE_USERS(UserID),
  FollowingID NUMBER REFERENCES T_TRACE_USERS(UserID),
  FollowedAt DATE
);
CREATE SEQUENCE T_TRACE_FOLLOWS_SEQ START WITH 1 INCREMENT BY 1;

-- Follows
INSERT INTO T_TRACE_FOLLOWS (FollowID, FollowerID, FollowingID, FollowedAt)
VALUES (T_TRACE_FOLLOWS_SEQ.NEXTVAL, 1, 23, SYSDATE);
INSERT INTO T_TRACE_FOLLOWS (FollowID, FollowerID, FollowingID, FollowedAt)
VALUES (T_TRACE_FOLLOWS_SEQ.NEXTVAL, 1, 24, SYSDATE);
INSERT INTO T_TRACE_FOLLOWS (FollowID, FollowerID, FollowingID, FollowedAt)
VALUES (T_TRACE_FOLLOWS_SEQ.NEXTVAL, 23, 25, SYSDATE);
INSERT INTO T_TRACE_FOLLOWS (FollowID, FollowerID, FollowingID, FollowedAt)
VALUES (T_TRACE_FOLLOWS_SEQ.NEXTVAL, 25, 1, SYSDATE);
INSERT INTO T_TRACE_FOLLOWS (FollowID, FollowerID, FollowingID, FollowedAt)
VALUES (T_TRACE_FOLLOWS_SEQ.NEXTVAL, 26, 23, SYSDATE);



CREATE TABLE T_TRACE_Likes (
  LikeID NUMBER PRIMARY KEY,
  UserID NUMBER REFERENCES T_TRACE_USERS(UserID),
  PostID NUMBER REFERENCES T_TRACE_POSTS(PostID),
  LikedAt DATE
);
CREATE SEQUENCE T_TRACE_Likes_SEQ START WITH 1 INCREMENT BY 1;

-- Likes
INSERT INTO T_TRACE_Likes (LikeID, UserID, postID, LikedAt)
VALUES (T_TRACE_Likes_SEQ.NEXTVAL, 1, 21, SYSDATE);
INSERT INTO T_TRACE_Likes (LikeID, UserID, postID, LikedAt)
VALUES (T_TRACE_Likes_SEQ.NEXTVAL, 1, 26, SYSDATE);
INSERT INTO T_TRACE_Likes (LikeID, UserID, postID, LikedAt)
VALUES (T_TRACE_Likes_SEQ.NEXTVAL, 23, 1, SYSDATE);
INSERT INTO T_TRACE_Likes (LikeID, UserID, postID, LikedAt)
VALUES (T_TRACE_Likes_SEQ.NEXTVAL, 24, 28, SYSDATE);
INSERT INTO T_TRACE_Likes (LikeID, UserID, postID, LikedAt)
VALUES (T_TRACE_Likes_SEQ.NEXTVAL, 25, 27, SYSDATE);

select * from T_TRACE_POSTS;
select * from T_TRACE_USERS;

CREATE TABLE T_TRACE_MENTIONS (
  MentionID NUMBER PRIMARY KEY,
  PostID NUMBER NOT NULL,
  CommentID NUMBER NOT NULL,
  MentionedUserID NUMBER NOT NULL,
  MentionedAt DATE DEFAULT SYSDATE,

  CONSTRAINT FK_MENTION_POST FOREIGN KEY (PostID)
    REFERENCES T_TRACE_POSTS(PostID),

  CONSTRAINT FK_MENTION_COMMENT FOREIGN KEY (CommentID)
    REFERENCES T_TRACE_COMMENTS(CommentID),

  CONSTRAINT FK_MENTION_USER FOREIGN KEY (MentionedUserID)
    REFERENCES T_TRACE_USERS(UserID)
);
CREATE SEQUENCE T_TRACE_MENTIONS_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO T_TRACE_MENTIONS (MentionID, PostID, CommentID, MentionedUserID, MentionedAt)
VALUES (T_TRACE_MENTIONS_SEQ.NEXTVAL, 21, 52, 1, SYSDATE);
INSERT INTO T_TRACE_MENTIONS (MentionID, PostID, CommentID, MentionedUserID, MentionedAt)
VALUES (T_TRACE_MENTIONS_SEQ.NEXTVAL, 26, 54, 24, SYSDATE);
INSERT INTO T_TRACE_MENTIONS (MentionID, PostID, CommentID, MentionedUserID, MentionedAt)
VALUES (T_TRACE_MENTIONS_SEQ.NEXTVAL, 1, 51, 25, SYSDATE);
INSERT INTO T_TRACE_MENTIONS (MentionID, PostID, CommentID, MentionedUserID, MentionedAt)
VALUES (T_TRACE_MENTIONS_SEQ.NEXTVAL, 1, 51, 26, SYSDATE);
INSERT INTO T_TRACE_MENTIONS (MentionID, PostID, CommentID, MentionedUserID, MentionedAt)
VALUES (T_TRACE_MENTIONS_SEQ.NEXTVAL, 21, 55, 23, SYSDATE);

select * from T_TRACE_POSTS;
select * from T_TRACE_USERS;
select * from T_TRACE_COMMENTS;
select * from T_TRACE_MENTIONS;

CREATE TABLE T_TRACE_COMMENTS (
  CommentID NUMBER PRIMARY KEY,
  PostID NUMBER NOT NULL,
  WriterID NUMBER NOT NULL,
  Content VARCHAR2(1000) NOT NULL,
  CreatedAt DATE DEFAULT SYSDATE,

  CONSTRAINT FK_COMMENT_POST FOREIGN KEY (PostID)
    REFERENCES T_TRACE_POSTS(PostID),

  CONSTRAINT FK_COMMENT_WRITER FOREIGN KEY (WriterID)
    REFERENCES T_TRACE_USERS(UserID)
);
CREATE SEQUENCE T_TRACE_COMMENTS_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO T_TRACE_COMMENTS (CommentID, PostID, WriterID, Content, CreatedAt)
VALUES (T_TRACE_COMMENTS_SEQ.NEXTVAL, 1, 1, '오늘 날씨 너무 좋다 ☀️', SYSDATE);
INSERT INTO T_TRACE_COMMENTS (CommentID, PostID, WriterID, Content, CreatedAt)
VALUES (T_TRACE_COMMENTS_SEQ.NEXTVAL, 21, 23, '@sunny랑 제주도 가고 싶다!', SYSDATE);
INSERT INTO T_TRACE_COMMENTS (CommentID, PostID, WriterID, Content, CreatedAt)
VALUES (T_TRACE_COMMENTS_SEQ.NEXTVAL, 1, 24, '정말 재밌는 여행이었어요!', SYSDATE);
INSERT INTO T_TRACE_COMMENTS (CommentID, PostID, WriterID, Content, CreatedAt)
VALUES (T_TRACE_COMMENTS_SEQ.NEXTVAL, 26, 25, '@mira_hun 그때 기억나? ㅎㅎ', SYSDATE);
INSERT INTO T_TRACE_COMMENTS (CommentID, PostID, WriterID, Content, CreatedAt)
VALUES (T_TRACE_COMMENTS_SEQ.NEXTVAL, 21, 26, '사진도 올려줘~', SYSDATE);

select * from T_TRACE_POSTS;
select * from T_TRACE_USERS;



CREATE TABLE T_TRACE_Trends (
  TrendID NUMBER PRIMARY KEY,
  Hashtag VARCHAR2(100),
  Region VARCHAR2(100),
  CollectedAt DATE
);
CREATE SEQUENCE T_TRACE_Trends_SEQ START WITH 1 INCREMENT BY 1;

-- Trends
INSERT INTO T_TRACE_Trends (TrendID, Hashtag, Region, CollectedAt)
VALUES (T_TRACE_Trends_SEQ.NEXTVAL, '#제주도', '대한민국', SYSDATE);
INSERT INTO T_TRACE_Trends (TrendID, Hashtag, Region, CollectedAt)
VALUES (T_TRACE_Trends_SEQ.NEXTVAL, '#비행기', '대한민국', SYSDATE);
INSERT INTO T_TRACE_Trends (TrendID, Hashtag, Region, CollectedAt)
VALUES (T_TRACE_Trends_SEQ.NEXTVAL, '#애월읍', '대한민국', SYSDATE);
INSERT INTO T_TRACE_Trends (TrendID, Hashtag, Region, CollectedAt)
VALUES (T_TRACE_Trends_SEQ.NEXTVAL, '#에코랜드', '대한민국', SYSDATE);
INSERT INTO T_TRACE_Trends (TrendID, Hashtag, Region, CollectedAt)
VALUES (T_TRACE_Trends_SEQ.NEXTVAL, '#맛집추천', '대한민국', SYSDATE);

select * from T_TRACE_POSTS;
select * from T_TRACE_USERS;








CREATE TABLE T_TRACE_Reposts (
  RepostID NUMBER PRIMARY KEY,
  UserID NUMBER REFERENCES T_TRACE_USERS(UserID),
  postID NUMBER REFERENCES T_TRACE_POSTS(postID),
  RepostedAt DATE
);
CREATE SEQUENCE T_TRACE_Reposts_SEQ START WITH 1 INCREMENT BY 1;

-- Retweets
INSERT INTO T_TRACE_Reposts (RepostID, UserID, postID, RepostedAt)
VALUES (T_TRACE_Reposts_SEQ.NEXTVAL, 23, 1, SYSDATE);
INSERT INTO T_TRACE_Reposts (RepostID, UserID, postID, RepostedAt)
VALUES (T_TRACE_Reposts_SEQ.NEXTVAL, 24, 21, SYSDATE);
INSERT INTO T_TRACE_Reposts (RepostID, UserID, postID, RepostedAt)
VALUES (T_TRACE_Reposts_SEQ.NEXTVAL, 1, 26, SYSDATE);
INSERT INTO T_TRACE_Reposts (RepostID, UserID, postID, RepostedAt)
VALUES (T_TRACE_Reposts_SEQ.NEXTVAL, 26, 27, SYSDATE);
INSERT INTO T_TRACE_Reposts (RepostID, UserID, postID, RepostedAt)
VALUES (T_TRACE_Reposts_SEQ.NEXTVAL, 25, 28, SYSDATE);



select * from T_TRACE_POSTS;
select * from T_TRACE_USERS;

CREATE TABLE T_TRACE_Notifications (
  NotificationID NUMBER PRIMARY KEY,
  UserID NUMBER REFERENCES T_TRACE_USERS(UserID),
  Type VARCHAR2(50),
  ReferenceID NUMBER,
  IsRead CHAR(1),
  CreatedAt DATE
);
CREATE SEQUENCE T_TRACE_Notifications_SEQ START WITH 1 INCREMENT BY 1;

-- Notifications
INSERT INTO T_TRACE_Notifications (NotificationID, UserID, Type, ReferenceID, IsRead, CreatedAt)
VALUES (T_TRACE_Notifications_SEQ.NEXTVAL, 1, 'mention', 2, 'N', SYSDATE);
INSERT INTO T_TRACE_Notifications (NotificationID, UserID, Type, ReferenceID, IsRead, CreatedAt)
VALUES (T_TRACE_Notifications_SEQ.NEXTVAL, 23, 'like', 3, 'Y', SYSDATE);
INSERT INTO T_TRACE_Notifications (NotificationID, UserID, Type, ReferenceID, IsRead, CreatedAt)
VALUES (T_TRACE_Notifications_SEQ.NEXTVAL, 24, 'retweet', 1, 'N', SYSDATE);
INSERT INTO T_TRACE_Notifications (NotificationID, UserID, Type, ReferenceID, IsRead, CreatedAt)
VALUES (T_TRACE_Notifications_SEQ.NEXTVAL, 25, 'follow', 5, 'Y', SYSDATE);
INSERT INTO T_TRACE_Notifications (NotificationID, UserID, Type, ReferenceID, IsRead, CreatedAt)
VALUES (T_TRACE_Notifications_SEQ.NEXTVAL, 26, 'bookmark', 4, 'N', SYSDATE);


