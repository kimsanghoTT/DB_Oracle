/*
TCL (Transaction Control Language) : 트랜잭션 제어 언어

    transaction : 업무, 처리
    변경된 사항을 묶어서 하나의 트랜잭션에 처리
    트랜잭션에서 데이터 변경 대상 : INSERT, UPDATE, DELETE(DML)
    
    EX)
        INSERT INTO 값 추가 -> DB 반영 X
        INSERT INTO 값 추가 -> 트랜잭션에 추가 -> COMMIT -> DB 반영 O
        INSERT INTO 10번 값 추가 -> 1개 트랜잭션에 10개 추가 -> 롤백 -> DB 반영 X
        
    1) COMMIT : 메모리 트랜잭션에 임시 저장된 데이터를 DB에 완전히 추가
    2) ROLLBACK : 메모리 트랜잭션에 임시 저장된 데이터를 삭제하고 마지막 커밋 상태로 돌아감
    3) SAVEPOINT : 메모리 트랜잭션에 저장 지점을 정의. ROLLBACK 수행시 
                    전체 작업을 삭제하는 게 아닌 저장 지점까지만 일부 ROLLBACK
*/
-- 복제 테이블 DEPARTMENT2
CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPARTMENT2;

-- 1) COMMIT 예제
--> D0 경리부 L2 삽입
INSERT INTO DEPARTMENT2 VALUES ('D0', '경리부', 'L2');

SELECT * FROM DEPARTMENT2;

--> D9 부서의 이름, 지역코드를 전략기획팀 L3로 수정
UPDATE DEPARTMENT2 SET DEPT_TITLE = '전략기획팀', LOCATION_ID ='L3'
WHERE DEPT_ID = 'D9';

SELECT * FROM department2;

-- 추가와 수정된 사항들을 최종 저장
COMMIT; --> 저장 완료

ROLLBACK; --> 완벽히 저장이 된 상태에서 롤백을 진행할 경우 커밋이 완료된 시점으로 돌아감
--> 이 롤백은 36~38 사이에 일어난 INSERT, UPDATE, DELETE를 했을 때 효과를 발동함
SELECT * FROM DEPARTMENT2;

-- 2) ROLLBACK 예제
-- DEPT_ID가 D0인 행을 삭제
DELETE FROM DEPARTMENT2 WHERE DEPT_ID = 'D0';

SELECT * FROM DEPARTMENT2;

-- DELETE DEPT_ID D9인 행 삭제
DELETE FROM DEPARTMENT2 WHERE DEPT_ID = 'D9';

-- DEPT_ID D8인 행 삭제 후 모두 되돌리기
DELETE FROM DEPARTMENT2 WHERE DEPT_ID = 'D8';
ROLLBACK;

-- 3) SAVEPOINT 예제
-- SAVEPOINT 작성해준 후 저장지점 이름 설정
-- DEPT_ID D0 행 삭제
DELETE FROM DEPARTMENT2 WHERE DEPT_ID = 'D0';
SAVEPOINT "SP1"; -- SP1 이라는 저장 지점 설정

-- DEPT_ID D9 행 삭제
DELETE FROM DEPARTMENT2 WHERE DEPT_ID = 'D9';

SAVEPOINT "SP2"; -- SP2 이라는 저장 지점 설정

--DEPARTMENT2 전체 삭제
DELETE FROM DEPARTMENT2;

SELECT * FROM DEPARTMENT2;
ROLLBACK;
-- SP2까지 롤백
ROLLBACK TO "SP2"; -- SP2 시점으로 저장된 DB내역이 돌아옴
ROLLBACK TO "SP1"; -- SP1 시점으로 저장된 DB내역이 돌아옴

-- 모든 내역 SP1이전으로 되돌리기
ROLLBACK;





