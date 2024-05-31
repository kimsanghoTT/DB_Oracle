/*
DML : 데이터 조작 언어
    테이블에 값을 삽입, 수정, 삭제하는 구문
    작성 후에 반드시 commit이나 rollback을 진행해야 함
    
    commit, rollback - 팀원이나 다른사람과 상의 후 진행
    
    insert : 삽입
    
    update : 수정
    
    delete : 삭제
*/
-- 테이블 복사
create table employee2 as select * from employee;
select * from employee2;
CREATE TABLE DEPARTMENT2 AS SELECT * FROM department;
-------------------------------------------------------------------------
/*
1. INSERT
    - 테이블에 새로운 행을 추가하는 구문
        INSERT INTO 테이블명 VALUES(데이터, 데이터, ...)
    
    - 테이블에 모든 컬럼에 대한 값을 삽입할 때 사용
    - INSERT하고자 하는 컬럼이 모든 컬럼일 경우 컬럼명 생략가능
    - 단 컬럼의 순서에 맞게 VALUES 값을 기입해야함
*/
-- 컬럼명 생략
INSERT INTO EMPLOYEE2 VALUES (800, '동그라미', '960321-1124124','qwgfsa@co.kr' ,'01076993423', 'D7','J7','S3', 4300000, 0.2, 200, SYSDATE, NULL, 'N');

commit;

select * from employee2 where emp_id = 800;

-- 동그라미씨 입사 신규 부서
insert into department2 values('D0', '개발운영부', 'L1');

-- 롤백하기
ROLLBACK;

-- INSERT에서 특정 부분을 선택해서 넣을 때는 컬럼명을 작성해서 넣어줌
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ..) VALUES(컬럼1값, 컬럼2값, ...);
--------------------------------------------------------------------------
/*
2. UPDATE 
    - 테이블에 기록된 컬럼의 값을 수정하는 구문
    - 업데이트를 사용하는 예제 : 회원정보 수정, 상품수정 등
        UPDATE 테이블명 SET 컬럼명 = 변경할값;
        WHERE 컬럼명 비교연산자 비교값; -> 필수 X
*/
-- DEPARTMENT2 테이블에서 DEPT_ID가 D9인 부서
SELECT * FROM department2 WHERE DEPT_ID ='D9';

-- DEPARTMENT2 테이블에서 D9를 전략기획팀으로 수정
UPDATE department2 SET DEPT_TITLE = '전략기획팀' WHERE DEPT_ID ='D9';

--SELECT 확인 
SELECT * FROM department2 WHERE DEPT_ID ='D9';

-- 저장을 원한다면 COMMIT; 작성
-- 되돌리기를 원한다면 ROLLBACK; 작성
ROLLBACK;

-- 조건을 설정하지 않고 모든 행의 컬럼 값 변경
-- UPDATE 테이블명 SET 컬럼명 = 변경할내용;

-- 여러 컬럼을 한 번에 수정할 경우 ','로 컬럼을 구분해서 수정
-- D2 -> D0, 회계관리부 -> 회계관리팀
UPDATE department2 SET DEPT_ID = 'D0', DEPT_TITLE = '회계관리팀' WHERE DEPT_ID ='D2';
ROLLBACK;

/*
삭제하기
    - 테이블 안에 존재하는 모든 값든을 삭제하는 구문
    
    1. DELETE
    - DELETE FROM 테이블명 WHERE 조건설정;
    - WHERE문을 설정하지 않으면 모든 행이 삭제됨
        -> DELETE FROM 테이블명;
        -> 테이블 안에 있는 내용 모두 삭제
        -> DELETE FROM 테이블명 WHERE 컬럼명 = '컬럼값';
        -> 테이블 안에서 특정 컬럼값을 가진 줄을 모두 삭제
    - 완전 삭제 -> COMMIT, 되돌리기 -> ROLLBACK
    - DELETE는 테이블 안에 있는 내용을 삭제
    - DROP은 테이블 자체를 삭제
DROP TABLE EMPLOYEE3;
*/
DELETE * FROM EMPLOYEE2;
DROP TABLE EMPLOYEE3;
COMMIT;



