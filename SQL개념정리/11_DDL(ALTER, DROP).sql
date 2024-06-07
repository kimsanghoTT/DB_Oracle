/*
DDL (DATA DEFINITION LANGUAGE)
    - 데이터 정의 언어로 객체를 만들고(CREATE) 수정하고(ALTER) 삭제하는(DELETE) 구문
    
    - ALTER
        * 수정 가능한 것 : 컬럼(추가, 수정, 삭제), 제약조건(추가, 삭제), 이름변경(테이블,컬럼, 제약조건)
        * 작성법
            1. 테이블을 수정하는 경우
            ALTER TABLE 테이블명 ADD | MODIFY | DROP 수정할내용;
            
                1) 제약조건 추가, 삭제
                ** [] : 생략 가능
                제약조건 추가 
                ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] 제약조건(컬럼명) [REFERENCES 테이블명(컬럼명)];
                
                제약조건 삭제
                ALTER TABLE 테이블명 DROP 제약조건(컬럼명);
            
                2) 컬럼 추가, 수정, 삭제
                컬럼 추가
                ALTER TABLE 테이블명 ADD(컬럼명 데이터타입 [DEFAULT '값']);
                
                컬럼 수정
                ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입; (데이터 타입 변경)
                ALTER TABLE 테이블명 MODIFY DEFAULT '값'; (기본값 수정)
                
                ** 데이터 타입을 수정할 경우 컬럼에 저장된 크기 미만으로는 변경할 수 없음
                    EX) VARCHAR2(100) -> VARCHAR2(10)일 때 데이터 10 초과되는 게 있으면 변경 불가
                    
                컬럼 삭제
                ALTER TABLE 테이블명 DROP (삭제할컬럼명);
                ALTER TALBE 테이블명 DROP COLUMN 삭제할 컬럼명;
                
                ** 테이블에는 최소 1개 이상의 컬럼이 존재해야하기 때문에 모든 컬럼 삭제 불가능
                
                3) 테이블 삭제
                DROP TABLE 테이블명 [CASCADE CONSTRAINTS];
                
                4) 제약조건, 컬럼, 테이블 이름 변경
                ALTER TABLE 원래이름 RENAME TO 바꿀이름;
*/
-- DEPARTMENT 테이블 복사해서 예제 진행
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

-- DEPT_COPY에 PK 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_PK PRIMARY KEY (DEPT_ID);
--> ALTER TABLE DEPT_COPY : 테이블 수정할 것임을 선언
--> ADD CONSTRAINT : 새로운 제약조건을 추가한다는 선언
--> DEPT_COPY_PK : 새로운 제약조건의 이름
--> PRIMARY KEY (DEPT_ID) : DEPT_ID를 기본키로 설정

-- DEPT_COPY 테이블에서 DEPT_TITLE에 UNIQUE 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_U UNIQUE (DEPT_TITLE);

-- DEPT_COPY에 CNAME VARCHAR(20) 컬럼 추가
ALTER TABLE DEPT_COPY ADD (CNAME VARCHAR2(20));

-- DEPT_COPY에 LNAME VARCHAR(30) 기본값 '한국'인 컬럼 추가
ALTER TABLE DEPT_COPY ADD (LNAME VARCHAR2(30) DEFAULT '한국');

SELECT * FROM DEPT_COPY;

-- DEPT_COPY의 DEPT_ID컬럼의 데이터 타입을 CHAR(2) -> VARCHAR2(3)변경
ALTER TABLE DEPT_COPY MODIFY DEPT_ID VARCHAR2(3);
--> 컬럼 값을 조절할 땐 이미 저장된 데이터 값이 변경할 데이터 타입 크기보다 크지 않은지 확인하고 조절

-- DEPT_COPY의 CNAME, LNAME 삭제
ALTER TABLE DEPT_COPY DROP (CNAME);  -- 1번
ALTER TABLE DEPT_COPY DROP COLUMN LNAME; -- 2번

SELECT * FROM DEPT_COPY;

-- DEPT_COPY의 DEPT_TITLE, LOCATION_ID를 각각 1번, 2번 방법으로 삭제
ALTER TABLE DEPT_COPY DROP (DEPT_TITLE);
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;

-- 삭제할 테이블 TB1 생성
CREATE TABLE TB1(
    TB1_PK NUMBER PRIMARY KEY,
    TB1_COL NUMBER
);

-- 삭제할 테이블 TB2 생성
CREATE TABLE TB2(
    TB2_PK NUMBER PRIMARY KEY,
    TB2_COL NUMBER REFERENCES TB1 -- TB1 테이블의 PK 값을 참조
);

-- 일반 삭제(DEPT_COPY)
DROP TABLE DEPT_COPY;

SELECT * FROM DEPT_COPY; -- ORA-00942: table or view does not exist

DROP TABLE TB1;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- 외래 키에 의해 참조되는 고유/기본 키가 있기 때문에 삭제할 수 없음

/*
해결방법 1: 자식 테이블 삭제 후 부모 테이블 삭제

해결방법 2: CASCADE CONSTRAINTS 활용
--> 제약 조건까지 모두 삭제시켜 조건을 없애 부모 자식 관계를 끊음
*/
-- 1
DROP TABLE TB2;
DROP TABLE TB1;

-- 2
DROP TABLE TB1 CASCADE CONSTRAINTS;
DROP TABLE TB2;

CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

ALTER TABLE DEPT_COPY RENAME TO DCOPY;

SELECT * FROM DCOPY;

