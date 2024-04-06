------------------------------------
------------ 시퀀스 삭제 ------------
------------------------------------



------------------------------------
------------ 테이블 삭제 ------------
------------------------------------
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE TEAM_NOTE CASCADE CONSTRAINTS;
DROP TABLE TEAM_MISSION CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE SHOP CASCADE CONSTRAINTS;
DROP TABLE INVENTORY CASCADE CONSTRAINTS;
DROP TABLE MONTH CASCADE CONSTRAINTS;
DROP TABLE DAY_NOTE CASCADE CONSTRAINTS;
DROP TABLE DAY_MISSION CASCADE CONSTRAINTS;
DROP TABLE MISSION CASCADE CONSTRAINTS;



------------------------------------
------------ 시퀀스 생성 ------------
------------------------------------


------------------------------------
------------ 테이블 생성 ------------
------------------------------------
CREATE TABLE UESRS (
	NICK	            VARCHAR2(30)	CONSTRAINT PK_USERS_NICK PRIMARY KEY CONSTRAINT NN_USERS_NICK NOT NULL CONSTRAINT UQ_USERS_NICK UNIQUE
	, ID	            VARCHAR2(30)	CONSTRAINT NN_USERS_ID NOT NULL CONSTRAINT UQ_USERS_ID UNIQUE
	, PWD	            VARCHAR2(30)	CONSTRAINT NN_USERS_PWD NOT NULL
	, STYLE	            VARCHAR2(30)	DEFAULT NULL
	, EMAIL	            VARCHAR2(50)	CONSTRAINT NN_USERS_EMAIL NOT NULL CONSTRAINT UQ_USERS_EMAIL UNIQUE
	, RANK	            VARCHAR2(30)	DEFAULT 'F' CONSTRAINT NN_USERS_RANK NOT NULL
	, POINT	            NUMBER	        DEFAULT 0 CONSTRAINT NN_USERS_POINT NOT NULL 
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE CONSTRAINT NN_USERS_ENROLL_DATE NOT NULL
	, SELF_INTRODUCE	VARCHAR2(50)	NULL
	, CASH	            NUMBER	        DEFAULT 0 CONSTRAINT NN_USERS_CASH NOT NULL
	, MODIFY_DATE	    TIMESTAMP	    DEFAULT SYSDATE CONSTRAINT NN_USERS_MODIFY_DATE NOT NULL
	, TEAM_POINT	    NUMBER	        DEFAULT 0 CONSTRAINT NN_USERS_TEAM_POINT NOT NULL
);

CREATE TABLE ADMIN (
	ADMIN_NICK	    VARCHAR2(30)	DEFAULT '운영자' CONSTRAINT PK_ADMIN_NICK PRIMARY KEY 
	, ID	        VARCHAR2(30)	CONSTRAINT NN_ADMIN_ID NOT NULL CONSTRAINT UQ_ADMIN_ID UNIQUE 
	, PWD1	        VARCHAR2(30)	CONSTRAINT NN_ADMIN_PWD1 NOT NULL
	, PWD2	        VARCHAR2(30)	CONSTRAINT NN_ADMIN_PWD2 NOT NULL
);

CREATE TABLE TEAM (
	NO	                    NUMBER          CONSTRAINT PK_TEAM_NO PRIMARY KEY
	, NICK	                VARCHAR2(30)	CONSTRAINT NN_TEAM_ID NOT NULL CONSTRAINT UQ_TEAM_ID UNIQUE
	, RANK	                VARCHAR(100)	NULL
	, INVITATION_YN	        CHAR(1)	        DEFAULT 'N' CONSTRAINT NN_INVITATION_YN NOT NULL
	, EXPULSION_YN	        CHAR(1)	        DEFAULT 'N' CONSTRAINT NN_EXPULSION_YN NOT NULL
	, TEAM_POINT	        NUMBER	        DEFAULT 0 CONSTRAINT NN_TEAM_POINT NOT NULL
	, PUBLIC_YN	            CHAR(1)	        DEFAULT 'N' CONSTRAINT NN_PUBLIC_YN NOT NULL
);

CREATE TABLE TEAM_NOTE (
    NO	                NUMBER          CONSTRAINT PK_TEAM_NOTE_NO PRIMARY KEY
	, NICK	            VARCHAR2(30)	NULL
	, TITLE	            VARCHAR2(30)	CONSTRAINT NN_TEAM_NOTE_TITLE NOT NULL
	, MISSION	        VARCHAR2(30)	CONSTRAINT NN_TEAM_NOTE_MISSION NOT NULL
	, MISSION_DETAIL	VARCHAR2(3000)	NULL
	, SUCCESS_YN	    VARCHAR2(30)	DEFAULT 'N' CONSTRAINT NN_TEAM_NOTE_SUCCESS_YN NOT NULL
	, ENROLL_DATE	    TIMESTAMP	    DEFAULT SYSDATE CONSTRAINT NN_TEAM_NOTE_ENROLL_DATE NOT NULL
	, MODIFY_DATE	    TIMESTAMP	    DEFAULT SYSDATE CONSTRAINT NN_TEAM_NOTE_MODIFY_DATE NOT NULL
	, TEAM_POINT	    NUMBER	        DEFAULT 0 CONSTRAINT NN_TEAM_NOTE_TEAM_POINT NOT NULL
);

CREATE TABLE TEAM_MISSION (
	NO	            NUMBER	        CONSTRAINT PK_TEAM_MISSION_NO PRIMARY KEY
	, CATEFORY      VARCHAR2(50)	NULL
	, TITLE	        VARCHAR2(30)	CONSTRAINT NN_TEAM_MISSION_TITLE NOT NULL CONSTRAINT UQ_TEAM_MISSION_TITLE UNIQUE
    , CONTENT	    VARCHAR2(30)	CONSTRAINT NN_TEAM_MISSION_CONTENT NOT NULL
	, TEAM_POINT	NUMBER	        DEFAULT 0 CONSTRAINT NN_TEAM_MISSION_TEAM_POINT NOT NULL
	, REWARD	    VARCHAR2(300)	NULL
);


------------------------------------
------------ 외래키 추가 ------------
------------------------------------


