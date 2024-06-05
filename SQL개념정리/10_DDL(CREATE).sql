/*
DDL (DATA DEFINITION LANGAUAGE) : 데이터 정의 언어
    만들고 수정하고 삭제하는 언어
    CREATE, ALTER, DROP
    
    객체 : OBJECT
    오라클에서 객체 : 테이블(TABLE), 뷰(VIEW), 시퀀스(SEQUENCE), 인덱스(INDEX), 패키지(PACKAGE),
                   트리거(TRIGGER), 프로시저(PROCEDURE), 함수(FUNCTION)
                   동의어(SYNONYM), 사용자(USER)
                   
                   
    CREATE
        - 테이블이나 인덱스, 뷰 등 다양한 데이터 베이스 객체를 생성하는 구문
        - 테이블로 생성된 객체는 DROP 구문을 통해 제거할 수 있음
        - 테이블 생성하기
            * 테이블이란 행(ROW)과 열(COLUMN)로 이루어진 가장 기본적인 데이터베이스 객체
            -> 데이터 베이스 내에서 모든 데이터는 테이블을 통해 저장
            
            표현식
            CREATE TABLE 테이블명(
            컬럼명 자료형(크기),
            컬럼명 자료형(크기), ...
            );
            
            자료형
            NUMBER : 숫자형(정수, 실수)
            CHAR(크기) : 고정길이 문자형 (2000BYTE 까지)
            VARCHAR2(크기) : 가변길이 문자형 (4000BYTE 까지 VARCHAR1의 업그레이드 버전)        
                ABC 문자열을 CHAR와 VARCHAR2에 저장하면
                CHAR(10) : CHAR는 크기 10을 모두 사용
                VARCHAR2(10) : 3만큼만 사용. 7은 반환
            DATE : 날짜 타입
            BLOB : 대용량 사진, 영상, 파일 데이터 저장(4GB)
            CLOB : 대용량 문자 데이터(4GB)
        
        *
        UTF-8에서 영어, 숫자, 특수문자 = 1BYTE
        나머지 문자 = 3BYTE
            
*/
-- USER_MEMBER 테이블 생성
-- 아이디, 비밀번호, 이름, 주민번호, 가입일
CREATE TABLE USER_MEMBER (
    USER_ID VARCHAR2(20),
    USER_PW VARCHAR2(20),
    USER_NAME VARCHAR2(15),
    USER_SSN CHAR(14), -- 14글자 고정
    ENROLL_DATE DATE DEFAULT SYSDATE
);
-- DEFAULT = 기본값. 컬럼의 기본값을 지정. 필수 아님
--> DEFAULT 기본 값을 지정하고 INSERT나 UPDATE문을 작성해줄때 지정한 기본 값이 들어감

-- 테이블 생성 확인
SELECT * FROM USER_MEMBER;

-- 컬럼에 주석으로 설명 추가
/*
    표현식
    COMMNET ON COLUMN 테이블명, 컬럼명 IS '주석'; -> 주석은 "" 사용 불가
*/
COMMENT ON COLUMN USER_MEMBER.USER_ID IS '회원 아이디';





