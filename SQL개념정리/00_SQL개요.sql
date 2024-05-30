-- 주석 작성하기 (컨트롤 + /)
/* 주석 여러 줄 작성 */

-- CMD 창에서 대표 관리자의 권한으로 SQL 접속하는 명령어
sqlplus sys as sysdba;
/*
sqlplus : 오라클 데이터베이스에서 제공하는 명령줄 도구
sys : 시스템(system)
as sysdba : 시스템 데이터 베이스 어드민(System Data Base Admin)

설치할 때 작성한 비밀번호 작성하기
비밀번호는 눈에 보이지 않음
*/

-- 기존에는 계정을 생성하기 위해 ALTER를 이용해 SCRIPT TRUE로 변경해 줬지만 이제는 안해도 됨
/*
ALTER : 어떤 상황을 변경하는 SQL 명령어
SESSION : 사용자가 로그인해서 명령을 실행하고 연결된 상태
SET : 무엇을 변경할 것인지 선택
"_ORACLE_SCRIPT" : DB 코드 작성
TRUE; : 허용
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 계정 생성 방법
/*
CREATE : 생성
USER : 사용자
아이디명 : 사용자 이름
IDENTIFIED BY : 생성한 사용자 계정에 대한 비밀번호를 설정하기 위한 코드
비밀번호 : 비밀번호 설정
*/
CREATE USER 아이디명 IDENTIFIED BY 비밀번호;

-- 생성된 계정에 접속, 기본 자원 관리 권한 추가
/*
GRANT : 사용자에게 특정 권한이나 역할을 부여하기 위한 명령어
CONNECT : 사용자가 데이터베이스에 접속할 수 있는 권한을 부여
        -> kh T반에 들어올 수 있는 권한
RESOURCE : 테이블, 인덱스, 뷰 등을 생성할 수 있는 권한을 부여
        -> T반에서 특정 행동이나 만들기, 변경, 설정을 할 수 있는 권한
이 외 여러 권한들이 있으며, 여러 권한을 한 번에 작성할 때는 ','를 사용해서 작성
TO 아이디명 : 어떤 아이디에 권한을 줄 것인지 설정
*/
GRANT CONNECT, RESOURCE TO 아이디명;

/*테이블 생성하기*/
/*
테이블 : 데이터베이스에서 모든 데이터를 포함하는 공간.
    테이블명 : 중점이 되어 중점과 관련된 내용을 설정할 수 있도록 작성
    
생성 방법
CREATE TABLE 테이블명 (컬럼명 데이터타입);
*/

-- 직원 테이블 생성하기

CREATE TABLE 직원 (직원번호 NUMBER(4), 직원이름 VARCHAR2(10));

/*
데이터 타입
NUMBER : 숫자값
VARCHAR : String과 똑같은 문자열
*/

-- 데이터 추가하기 INSERT

/*
데이터를 추가할 때는 INSERT를 작성해준다

작성 방법
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, 컬럼명3, ... ) VALUES (컬럼에해당하는값1, 컬럼에해당하는값2, 컬럼에해당하는값3);
*/

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (1, '홍길동', '40', '010-1234-5678', '2024-05-01');

CREATE TABLE MEMBER 
(
  M_ID VARCHAR2(20 BYTE) 
, M_NAME VARCHAR2(20 BYTE) 
, M_AGE VARCHAR2(20 BYTE) 
, M_PHONE VARCHAR2(20 BYTE) 
, M_DATE VARCHAR2(20 BYTE) 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (2, '박지훈', '35', '010-5678-1234', '2024-05-02');
INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (3, '김철수', '32', '010-1245-3464', '2024-05-03');
INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (4, '이영희', '37', '010-1234-5674', '2024-05-04');
INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (5, '최민수', '29', '010-9767-1246', '2024-05-05');
INSERT INTO MEMBER (m_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (6, '정수진', '33', '010-2352-5745', '2024-05-06');


-- KH_CAFE 추가하기

INSERT INTO KH_CAFE (C_ID, C_NAME, C_ADDRESS, C_PHONE, C_TIME)
VALUES (1, '메가커피', '서울시 강남구 강남동', '02-888-8888', '영업시간 : 9시 ~ 18시');



