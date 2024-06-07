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

/*
제약 조건 (CONSTRAINTS)
    - 사용자가 원하는 조건의 데이터만 유지하기 위해 특정 컬럼에 설정하는 제약
    - 데이터 무결성 보장을 목적으로 함
        입력 데이터에 문제가 없는지 자동으로 검사하는 목적
        데이터 수정 / 삭제 가능 여부 검사 등을 목적으로 함
        -> 제약조건을 위배하는 DML 구문은 수행할 수 없음
        
    종류
    PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY
    
    확인
    -- USER_CONSTRAINTS : 사용자가 작성한 제약 조건을 확인하는 딕셔너리 뷰
    
    OWNER : 유저 아이디
    CONSTRAINTS_NAME : 제약 조건 이름
    CONSTRAINTS_TYPE : 제약 조건 유형
    C : CHECK
    P : PRIMARY KEY
    U : UNIQUE
    R : FOREIGN KEY
    V : VIEW
    O : 읽기 전용 뷰
    TABLE NAME : 제약 조건이 적용된 테이블 이름
*/
-- CONSTRAINTS
DESC USER_CONSTRAINTS;

SELECT * FROM user_constraints;

/*
NOT NULL
    해당 컬럼에 반드시 값이 존재해야하는 경우 사용
    삽입 / 수정시 NULL 값을 허용하지 않도록 컬럼 레벨에서 제한
*/
-- NOT NULL을 지정한 테이블 생성
CREATE TABLE USER_TEST_TABLE(
    USER_NO NUMBER(10,0) NOT NULL,
    USER_ID VARCHAR2(30),
    USER_PWD VARCHAR2(30),
    USER_NAME VARCHAR2(20),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
    );

INSERT INTO USER_TEST_TABLE VALUES(1, '사용자1','PW1','홍길동','남','010-1111-2222','hong@hong.co.kr');

INSERT INTO USER_TEST_TABLE VALUES(null, '사용자1','PW1','홍길동','남','010-1111-2222','hong@hong.co.kr');
/*
SQL 오류: ORA-01400: cannot insert NULL into ("KH_T"."USER_TEST_TABLE"."USER_NO")
null 값을 넣을 수 없음

USER_NO NUMBER(10,0) NOT NULL -> NULL 값을 넣을 수 없다 설정했기 때문에 NULL을 넣을 수 없는 것
*/

/*
UNIQUE
    - 컬럼에 입력 값에 대해 중복을 제한하는 제약 조건
    - 컬럼 레벨에서 설정 가능, 테이블 레벨에서 설정 가능
    - 단, UNIQUE 제약 조건이 설정된 컬럼에 NULL 값 한 번 삽입 가능
    - 유니크 컬럼이 여러개면 각 컬럼마다 NULL이 들어가도 됨
    
*/
-- UNIQUE 제약 조건이 들어간 조건 테이블 생성
CREATE TABLE UNIQUE_TABLE (
    USER_NO NUMBER(10,0),
  --  USER_ID VARCHAR2(30) UNIQUE, -> 컬럼 레벨 제약 조건. 이름이 없어서 불가능
   /*
    CONSTRAINT 제약 조건 종류
    컬럼 레벨 제약 조건(이름 O)
    
    방법 1
    */
    USER_ID VARCHAR2(30) CONSTRAINT USER_ID_U UNIQUE,   
    USER_PWD VARCHAR2(30),
    
    -- 방법 2, 테이블 레벨로 UNIQUE 조건 설정
    -- UNIQUE(USER_NAME) -- 이름이 없어서 불가능
    USER_NAME VARCHAR2(30), 
    CONSTRAINT USER_NAME_U UNIQUE(USER_NAME)

    );
    
-- KH CAFE 테이블 만들기
CREATE TABLE KH_CAFE(
    CAFE_ID NUMBER(10,0) PRIMARY KEY,
    CAFE_NAME VARCHAR2(100) NOT NULL,
    CAFE_PHONE VARCHAR2(2) CONSTRAINT CAFE_PHONE_U UNIQUE,
    CAFE_ADDRESS VARCHAR2(100), CONSTRAINT CAFE_ADDRESS_U UNIQUE(CAFE_ADDRESS)
    
    );
/*
ORA-00955: name is already used by an existing object

해당 명칭을 사용하는 테이블이 이미 존재함
*/
INSERT INTO KH_CAFE VALUES (1, '맥아커피', '02-1111-1111','서울시 강남구 광남동 2길');

/*
ALTER를 사용해서 컬럼 크기를 수정할 수 있음
    ALTER 테이블명 MODIFY(수정할컬럼명 수정할 크기);
*/
ALTER TABLE KH_CAFE MODIFY (CAFE_PHONE VARCHAR2(20));

COMMIT;

/*
PRIMARY KEY(기본키)
    - 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
    - 테이블에 대한 식별자(IDENTIFIER) 역할을 함
    - NOT NULL + UNIQUE의 의미
    - 한 테이블 당 한 개만 설정 가능
    - 컬럼 레벨, 테이블 레벨 둘 다 설정 가능
    - 한 개 컬럼에 설정할 수 있고, 여러개의 컬럼을 묶어서 설정할 수 있음
*/
/*
CREATE TABLE USER_PRIMARY_TABLE(
-- (방법1)
    컬럼명 자료형(정수자리값, 실수자리값) PRIMARY KEY,
-- (방법2)
    컬럼명 자료형(정수자리값, 실수자리값) CONSTRAINT 인덱스에저장할이름명 PRIMARY KEY,
-- (방법3)
    컬럼명 자료형(정수자리값, 실수자리값),
    CONSTRAINT 인덱스에저장할이름명 PRIMARY KEY(연결할컬럼명)
);
*/
CREATE TABLE USER_PRIMARY_TABLE(
    USER_NO NUMBER(10,0) CONSTRAINT USER_NO_PF PRIMARY KEY,
    USER_NAME VARCHAR2(200)
);
COMMIT;

INSERT INTO USER_PRIMARY_TABLE VALUES (1, '홍길동');
INSERT INTO USER_PRIMARY_TABLE VALUES (1, '이순신');
--> 기본 키 중복으로 오류
--> USER_NO 컬럼에 1 값이 존재하는데 추가로 1을 넣는다고 했기 떄문에 중복 오류

INSERT INTO USER_PRIMARY_TABLE VALUES (NULL, '이순신');
--> 기본 키가 NULL로 오류 발생. NULL을 삽입할 수 없음

/*
UNIQUE / PK 차이점
    
    UNIQUE : NULL 값이 한 개는 허용되나 두 개 이상 안됨
    
    PRIMARY KEY : NULL 값 불가능, 중복 불가능

*/

/*
FOREIGN KEY(외부키)
    - 참조된 다른 테이블의 컬럼이 제공하는 값만 사용할 수 있음
    - 삭제하는 데 있어 에러가 자주 발생
    
CONSTRAINT 인덱스값 REFERENCES 컬럼명(참조할 키);
*/

CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER(10,0) PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO USER_GRADE VALUES(10, '일반회원');
INSERT INTO USER_GRADE VALUES(20, '우수회원');
INSERT INTO USER_GRADE VALUES(30, '특별회원');

COMMIT;

-- USER_GRADE의 GRADE_CODE 참조하는 테이블 생성
CREATE TABLE USER_FK(
    USER_NO NUMBER(10,0) PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PW VARCHAR2(30) NOT NULL,
    GRADE_CODE NUMBER(10,0),
    CONSTRAINT FK_GRADE FOREIGN KEY (GRADE_CODE) 
    REFERENCES USER_GRADE(GRADE_CODE)
);

SELECT * FROM USER_GRADE;

/*
10	일반회원
20	우수회원
30	특별회원
*/

INSERT INTO USER_FK VALUES(1, 'USER01', 'PW01', 10);

SELECT * FROM USER_FK;

INSERT INTO USER_FK VALUES(2, 'USER02', 'PW02', 20);
INSERT INTO USER_FK VALUES(3, 'USER03', 'PW03', 30);
INSERT INTO USER_FK VALUES(4, 'USER04', 'PW04', 40);
-- parent key not found 부모키인 USER_GRADE에 40이라는 값이 없어서 넣을 수 없음

INSERT INTO USER_GRADE VALUES(40, '플래티넘회원');
INSERT INTO USER_FK VALUES(4, 'USER04', 'PW04', 40);
--> 부모키인 USER_GRADE에 40이라는 값이 있어서 넣을 수 있음

INSERT INTO USER_FK VALUES(5, 'USER05', 'PW05', 50);
-- parent key not found 부모키인 USER_GRADE에 50이라는 값이 없어서 넣을 수 없음

INSERT INTO USER_GRADE VALUES (00, '임시회원'); 
--> 정수에서 맨 앞의 0은 사라짐
--> 따라서 휴대폰 번호를 기입할 때는 VARCHAR를 써서 010이 모두 들어갈 수 있게 설정

SELECT * FROM USER_GRADE;

-- 만약 USER1이라는 회원이 일반 회원으로 지정되어 있는데 실수로 일반 회원을 없애려고 함
-- USER1 회원의 등급이 사라지기 때문에 마음대로 사라지게 할 수 없도록 처음부터 설정돼있음

DELETE FROM USER_GRADE WHERE GRADE_CODE = 10;
-- child record found : '10'을 참조하는 자식이 있으므로 삭제할 수 없음

-- CASCADE : 부모키 삭제시 참조하는 자식의 행도 모두 삭제

-- 삭제는 아니고 메뉴들을 NULL 값으로 변경하고 싶다면
-- NULL 적용

--------------------------------------------------------------------------------
/*
CREATE TABLE 부모테이블(
    컬럼1 자료형(10,0) PRIMARY KEY,
    컬럼2 자료형(30) NOT NULL
);

COMMIT;

CREATE TABLE 자식테이블(
    컬럼1 자료형(10,0) PRIMARY KEY,
    컬럼2 자료형(20) UNIQUE,
    컬럼3 자료형(30) NOT NULL,
    --(방법1) : 마음대로 삭제 못하게 함
    컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 부모테이블(부모컬럼1)
    --(방법2) : 부모키 삭제시 자식키를 NULL로 변경 : ON DELETE SET NULL
    컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 부모테이블(부모컬럼1) ON DELETE SET NULL
    --(방법3) : 부모키 삭제시 자식키 모두 삭제 : ON DELETE CASCADE
    컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 부모테이블(부모컬럼1) ON DELETE CASCADE
);
*/

/*
CHECK
    - 컬럼에 기록되는 값에 조건을 설정할 수 있음
    - CHECK (컬럼명 비교연산자 비교값)
    - 비교값은 변하는 값이나 함수 사용 불가
    - 사용 방법
        1. 따로 INDEX에 기록하지 않고 조건 설정만 할 경우
        컬럼명 자료형 CHECK(컬럼명 IN ('조건1', '조건2'));
        
        2. 따로 INDEX에 기록한 다음 조건 설정한 경우(한 줄 작성)
        컬럼명 자료형 CONSTRAINT 인덱스에기록할이름 CHECK(컬럼명 IN ('조건1', '조건2'));
        
        3. 따로 INDEX에 기록한 다음 조건 설정한 경우(여러 줄 작성)
        컬럼명 자료형,
        
        CONSTRAINT 인덱스에기록할이름 CHECK(컬럼명 IN ('조건1', '조건2'));
*/

CREATE TABLE USER_CHECK(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PW VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK (GENDER IN ('남', '여'))
);
-- 앞으로 GENDER 컬럼에는 '남'이나 '여'라는 글자만 들어갈 수 있음
INSERT INTO USER_CHECK VALUES (1, 'USER01', 'PW1', '홍길동', '남');
INSERT INTO USER_CHECK VALUES (2, 'USER02', 'PW2', '박철수', '남자');
-- ORA-02290: check constraint (KH_T.SYS_C007190) violated 제약조건에 걸리는 오류

INSERT INTO USER_CHECK VALUES (2, 'USER02', 'PW2', '박철수', '여');
INSERT INTO USER_CHECK VALUES (2, 'USER02', 'PW2', '박철수', '려');







