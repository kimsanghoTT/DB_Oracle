/*
올림 : CEIL
반올림 : ROUND
내림 : FLOOR
오름차순 : ASC (ASCENDING)
내림차순 : DESC(DESCENDING)



자료형
    - NUMBER(정수, 실수) : 숫자형 // 실수 자리 : 최대 소수점 자리 지정
        NUMBER(2,2) -> 0.00 ~ 99.99까지 가능
        
    - CHAR(크기) : 고정길이 문자형 -> 현재 거의 사용하지 않음
    - VARCHAR : 이전버전. 거의 사용하지 않음
    - VARCHAR2 : 최신버전. 제일 많이 사용. 가변길이 문자형
    
    CHAR     vs.     VARCHAR2
    고정              가변
    
    EX) CHAR(10BYTE), VARCHAR(10BYTE) 일때
        CHAR = 1; -> 1하나를 넣는데 10BYTE를 모두 사용
        VERCHAR2 = 1; -> 1하나를 넣으면 나머지 9BYTE를 돌려줌
        VERCHAR2의 경우 공간 확보를 하되 사용하지 않은 크기는 돌려줌
        
    - DATE : 날짜 타입
    - CLOB : 메일, 항소문, 소설 등 VARCHAR2에서도 감당 못할 크기의 글 내용을 삽입할 때 사용
    - BLOB : 이미지, 동영상과 같은 파일 저장
    
영어, 숫자, 특수문자 == 1BYTE
이 외 문자 == 3BYTE
'ㄱ', '힣', '가' 모두 3BYTE
*/

/*
PRIMARY KEY (기본 키) 
    - 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
    - NOT NULL + UNIQUE(한 컬럼에서 똑같은 모양의 데이터는 존재하면 안됨)
    - 한 테이블에 한 개만 생성
    - 컬럼 레벨, 테이블 레벨 설정 가능함
*/

/*
|| : 연결 연산자
    - 문자열 이어쓰기. '+'나 ','로 연결하지 않고 '||'를 사용해서 연결
*/

SELECT EMP_ID || EMP_NAME FROM EMPLOYEE;

SELECT EMP_NAME || '의 월급은 ' || SALARY || '원 입니다.' FROM EMPLOYEE;

/*
테이블 복사
    테스트를 진행하거나 컬럼에 대한 설정을 변경한 후 특정 내용을 확인하길 원한다면 
    테이블을 복제해서 사용 가능(사본 만들기)
*/
-- 모두 동일하게 사본 만들기
-- CREATE TABLE 새로운테이블명 AS SELECT * FROM 복사할테이블명;
create table employee2 as select * from employee;


-- 복사한 테이블이 제대로 만들어졌는지 확인하기
-- SELECT * FROM 새로운테이블명;
select * from employee2;














