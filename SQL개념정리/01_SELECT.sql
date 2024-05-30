/*
SELECT(조회)
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL
    
    - 작성된 구문에 맞는 행, 열 데이터를 조회
        -> 조회된 결과 행의 집합 == RESULT SET (결과 집합)
        
    - RESULET SET은 0행 이상이 포함 가능함
        -> 조건에 맞지 않는 행이 있을 수도 있다는 점

    SELECT 작성법 (기초)
        SELECT 컬럼명, 컬럼명, ... FROM 테이블명;
        -> 지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
        
        테이블의 모든 행, 모든 컬럼 조회하는 방법
        *(ASTERISK) : 모든, 포함하다를 나타내는 기호
        
*/

-- EMPLOYEE 테이블에서 모든 행의 사번, 이름, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 행, 열의 정보 조회
SELECT * FROM EMPLOYEE;

/*
컬럼 값 산술 연산
    - 컬럼 값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
    - SELECT문에 산술 연산을 직접 작성하면 조회 결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/

-- EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여+100만원 조회
SELECT EMP_NAME, SALARY, SALARY+1000000 FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 연봉 조회
SELECT EMP_NAME, SALARY * 12 AS "연봉" FROM EMPLOYEE;

/*
SYSDATE, SYSTIMESTAMP
    - 시스템이 나타내고 있는 현재 시간
    
    - SYSDATE : 현재 시간(년,월,일,시,분,초) 조회
    - SYSTIMESTAMP : 현재 시간(년,월,일,시,분,초 MS+지역(LOCAL))조회
    
    - 회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
    - 컴퓨터에서 현재 시간을 기록할 때 사용
*/

/*
날짜 사용하기
    - DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용
    - TO_DATE('문자열', '패턴');
        EX) 2024-05-01자 이후 회원가입 한 회원 조회
            TO_DATE('2024-05-01', 'YYYY-MM-DD');
*/

/*
컬럼명 별칭 지정
    1. 컬럼명 AS "별칭" : 문자, 띄어쓰기, 특수문자 모두 가능
    2. 컬럼명 "별칭" : 문자, 띄어쓰기, 특수문자 모두 가능
    3. 컬럼명 별칭 : 문자 가능 / 띄어쓰기, 특수문자 불가능
    4. 컬럼명 AS 별칭 : 문자 가능 / 띄어쓰기, 특수문자 불가능
*/

-- EMPLOYEE 테이블에서 이름, 이메일 조회. 이메일에 @포함 별칭
SELECT EMP_NAME, EMAIL AS "@ 포함" FROM EMPLOYEE;
SELECT EMP_NAME, EMAIL "@ 포함" FROM EMPLOYEE;
-- SELECT EMP_NAME, EMAIL @ 포함 FROM EMPLOYEE; -> 띄어쓰기, 특수문자 있어서 오류남
-- SELECT EMP_NAME, EMAIL AS @ 포함 FROM EMPLOYEE; -> 띄어쓰기, 특수문자 있어서 오류남

/*
DISTINCT(별개, 다른) : 중복 제거
    - 조회결과집합(RESULT SET)에서 지정된 컬럼값이 중복되는 경우 한 번만 표시할 때 사용
    
    사용 방법
    SELECT DISTINCT 중복제거할컬럼명1, 중복제거할컬럼명2, .... FROM 테이블명;
*/

-- EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

-- 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-->D3, D4, D7 부서는 사원이 없기 때문에 조회되지 않음

-- EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

/*
WHERE절
    - 테이블에서 조건을 충족하는 행을 조회할 때 사용
    - WHERE 절에는 조건식(TRUE / FALSE)만 작성
    
비교 연산자 : >, <, <=, >=, =, !=(같지않다), <>(같지않다)
논리 연산자 : AND, OR, NOT

    사용 방법
    SELECT 컬럼명 FROM 테이블명 WHERE 조건식;
    -> 지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
*/

-- EMPLOYEE 테이블에서 급여가 300만원 초과하는 사원의 이름, 급여, 부서코드
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE SALARY > '3000000';

-- EMPLOYEE 테이블에서 D9부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- EMPLOYEE 테이블에서 D9부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

컬럼값이 존재하지 않을 경우 "IS NULL;"
컬럼값이 존재할 경우 "IS NOT NULL;"
*/

-- EMPLOYEE 테이블에서 부서코드가 없는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

-- EMPLOYEE 테이블에서 부서코드가 있는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;













