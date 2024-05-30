/*
SELECT, WHERE절

WHERE : 조건을 걸어 선택한 조건에 해당하는 행만 볼 수 있도록 설정
    WHERE 원하는컬럼 = '해당하는조건';
    
    만약 NULL값을 조회하길 원한다면
    WHERE 원하는컬럼 IS NULL;
    
    만약 NULL값이 아닌 값만 보길 원한다면
    WHERE 원하는컬럼 IS NOT NULL;

    이상, 이하, 미만, 초과를 사용할 때는 부등호를 사용
    WHERE 원하는컬럼 >= 원하는값;
    
    특정 값과 값 사이를 조회하길 원한다면
    WHERE BETWEEN 값1 AND 값2;
    EX) WHERE BETWEEN 사당 AND 의정부;
    
ORDER BY (WHERE절 X)
    오름차순 : ASC
    내림차순 : DESC
*/

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

-- 보너스가 없는 사원의 이름과 보너스를 조회
select emp_name, bonus from employee where bonus is null;

-- 급여등급이 s5인 사원의 이름과 급여 조회
select emp_name, salary from employee where sal_level = 'S5';

-- 사원번호가 210인 사원의 모든 정보 조회
select * from employee where emp_id = '210';

-- 이메일 주소가 null이 아닌 사원의 이름과 이메일 조회
select emp_name, email from employee where email is not null;

-- 보너스가 0.2 이상인 사원의 이름과 보너스 조회
SELECT EMP_NAME, BONUS FROM EMPLOYEE WHERE BONUS >= '0.2';

-- 급여가 3000000 ~ 4000000 사이인 사원의 이름과 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN '3000000' AND '4000000';

-- 급여가 높은 순서대로 사원의 이름과 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

-- 사원의 이름을 오름차순으로 정렬해서 조회
-- 글자체계의 오름차순 : ㄱ~ㅎ, A~Z 순서 / 내림차순 : ㅎ~ㄱ, Z~A 순서
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME ASC;

-- 급여가 3000000을 초과하는 사원의 사번, 이름, 급여, 부서코드 조회
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE SALARY > '3000000';

-- 연봉이 5천만원 이하인 사원의 사번, 이름, 연봉, 조회. 연봉은 연봉으로 표기
SELECT EMP_ID, EMP_NAME, SALARY*12 AS "연봉" FROM EMPLOYEE WHERE SALARY*12 <= '50000000';

-- 부서가 D9가 아닌 사원들의 이름, 부서코드, 전화번호 조회
SELECT EMP_NAME, DEPT_CODE, PHONE FROM EMPLOYEE WHERE DEPT_CODE != 'D9';

-- 부서코드가 D6인 사원 중에서 급여가 300만원을 초과하는 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' AND SALARY > '3000000';

-- 부서코드가 D6이고 직급코드가 J3인 사원의 이름과 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D6' AND JOB_CODE = 'J3';

-- 날짜범위 비교
-- 입사일이 2000-01-01 ~ 2000-12-31 사이인 사원의 이름, 입사일 조회
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE 
WHERE HIRE_DATE BETWEEN TO_DATE('2000-01-01','YYYY-MM-DD') AND TO_DATE('2000-12-31', 'YYYY-MM-DD'); 

-- 입사일이 2000년 이후 입사한 사원의 이름과 입사일 조회
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('2000-01-01', 'YYYY-MM-DD');
