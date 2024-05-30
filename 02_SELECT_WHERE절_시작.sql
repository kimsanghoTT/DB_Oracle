-- 모든 직원 정보 조회
select * from employee;

-- 모든 부서 정보 조회
select * from department;

-- 모든 직급 정보 조회
select * from job;

-- employee 테이블에서 이름, 입사일 조회
select emp_name, hire_date from employee;

/*
컬럼값 산술 연산
    컬럼값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값   
    SELECT문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과(RESULT SET)에 연산 결과가 반영됨   
*/

-- EMPLOYEE 테이블에 모든 사원의 이름, 급여, 급여 +100만 조회
SELECT EMP_NAME, SALARY, SALARY+1000000 FROM employee;

-- 급여 + 100에 AS 사용해서 100만원 인상 추가
-- AS의 경우 ""를 사용해서 표기
SELECT EMP_NAME, SALARY, SALARY+1000000 AS "급여_100만원_인상" FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 사번, 이름, 연봉(급여 *12) 조회
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY*12 AS "연봉" FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 사번, 이름, 상반기급여(급여 *6) 조회
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY*6 AS "상반기급여" FROM EMPLOYEE;

-- 특정 부서(D9)에 속한 사원의 이름과 이메일 조회
SELECT dept_code, EMP_NAME, EMAIL FROM employee WHERE dept_code = 'D9';

-- 특정 부서(D1)에 속한 사원의 이름과 이메일 조회
SELECT DEPT_CODE, EMP_NAME, EMAIL FROM EMPLOYEE WHERE DEPT_CODE = 'D1';

-- D4에 속한 사원의 이름과 이메일 조회
SELECT EMP_NAME, EMAIL FROM EMPLOYEE WHERE dept_code = 'D4';

-- WHERE에서 조건에 부합하는 값이 없으면 값이 나오지 않음 = 0
-- IS NULL을 사용하면 없는 값을 조회할 수 있음
SELECT dept_code, emp_name, email from employee where dept_code is null;

-- dept_code가 null인 사람들의 모든 정보 조회
select * from employee where dept_code is null;




