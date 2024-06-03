-- ORDER BY 실습
-- EMPLOYEE에서 모든 직원의 정보를 이름(오름차순)으로 조회
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME;

-- EMPLOYEE에서 모든 직원의 정보를 급여(내림차순)으로 조회
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC;

-- 사번(AS 사번), 이름(AS 이름, 내림차순) 조회
SELECT EMP_ID "사번", EMP_NAME "이름" FROM EMPLOYEE ORDER BY "이름" DESC;

-- 아이디, 이름, 급여(AS 월급, 내림차순) 조회
SELECT EMP_ID, EMP_NAME, SALARY AS "월급" FROM EMPLOYEE ORDER BY "월급" DESC;

-- 모든 직원의 보너스(AS 보너스, 내림차순) SALARY(AS 월급, 오름차순) 정렬
SELECT BONUS "보너스", SALARY "월급" FROM EMPLOYEE ORDER BY "보너스" DESC, "월급" ASC;

-- EMPLOYEE에서 모든 직원의 이메일(AS 이메일, 오름차순), 전화번호(AS 전화번호, 내림차순) 조회
SELECT EMAIL "이메일", PHONE "전화번호" FROM EMPLOYEE ORDER BY "이메일", "전화번호" DESC;

-- EMPLOYEE에서 모든 직원의 이름(AS 직원명, 내림차순), 입사일(AS 입사일자, 오름차순) 조회
SELECT EMP_NAME "직원명", HIRE_DATE "입사일자" FROM EMPLOYEE ORDER BY "직원명" DESC, "입사일자"; 