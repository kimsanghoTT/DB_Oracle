-- SUBQUERY 실습
-- 각 직원의 급여가 부서 평균 급여보다 높은 직원들의 이름, 급여 조회
--1)부서 평균 급여 구하기
SELECT AVG(SALARY) FROM EMPLOYEE E; -- WHERE DEPT_CODE = E.DEPT_CODE;

--2)직원들의 이름과 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY > 3089820;

--3)서브쿼리 이용해서 한 번에 쿼리 작성하기
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 최대 급여를 받는 직원의 이름과 급여
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

-- D5 부서의 평균 급여보다 높은 급여를 받는 직원들의 이름 조회
SELECT DEPT_CODE, EMP_NAME FROM EMPLOYEE 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5');

-- 급여가 300만원 이상인 직원 중에서 가장 낮은 급여를 받는 직원의 이름과 급여 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE WHERE SALARY >= 3000000);
--> 서브 쿼리를 통해 특정 조건을 만족하는 최저 급여를 찾고, 조건에 맞는 급여를 받는 직원을 메인 쿼리에서 조회

/*
서브 쿼리
SELECT MIN(SALARY) -> 컬럼 최소값 선택
FROM EMPLOYEE WHERE -> 찾을 데이터 테이블 선택
SALARY >= 3000000 -> 급여가 300만원 이상인 행들만 최소값 계산

메인 쿼리
SELECT EMP_NAME, SALARY -> 최종으로 보여줄 컬럼 선택
FROM EMPLOYEE -> 테이블 선택
WHERE SALARY = (서브쿼리); -> 급여기 서브쿼리에서 반환된 최소 급여와 같은 것만 골라서 보여줌
*/

-- SELECT를 활용한 서브쿼리 실습
-- 부서별로 보너스율이 0.2 이상인 직원 수
SELECT DEPT_TITLE, 
(SELECT COUNT(*) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID AND E.BONUS >= 0.2) AS "BONUS COUNT" FROM DEPARTMENT D;

-- 부서별로 최고 급여와 최소 급여 조회
SELECT DEPT_TITLE, 
(SELECT MAX(SALARY) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID) AS "최고 급여", 
(SELECT MIN(SALARY) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID) AS "최저 급여"
FROM DEPARTMENT D;

-- 부서별 직원 수 조회
SELECT DEPT_TITLE, (SELECT COUNT(*) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID) "직원 수" FROM DEPARTMENT D;

-- 부서별 직원수가 5명 이상인 부서의 부서명과 직원 수
SELECT DEPT_TITLE, (SELECT COUNT(*) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID) "직원 수"
FROM DEPARTMENT D WHERE (SELECT COUNT(*) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID) >= 5;






