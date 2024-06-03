-- HAVING절 실습
-- 부서별 급여 합계 계산, 급여합계가 500이상인 부서만 조회
SELECT DEPT_CODE, SUM(SALARY) "급여합계" FROM EMPLOYEE group by DEPT_CODE 
HAVING SUM(SALARY)>=5000000 ORDER BY "급여합계" DESC;
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
-> WHERE절에서는 집계 함수(SUM, AVG, MAX, MIN, COUNT 등)을 사용할 수 없음
집계 함수는 HAVING이나 WHERE GROUP을 다른 형식으로 사용해야함
*/
-- 각 부서별 최대 급여 조회
SELECT DEPT_CODE, MAX(SALARY) "최대 급여" FROM EMPLOYEE GROUP BY DEPT_CODE;

-- 각 부서별 최소 급여 조회
SELECT DEPT_CODE, MIN(SALARY) "최소 급여" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY "최소 급여" ASC;

-- 각 부서별 보너스율 합계 내림차순 조회
SELECT DEPT_CODE, SUM(BONUS) "총 보너스율" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY "총 보너스율" DESC;

-- 직급별 사원 수 조회, 사원 수 기준으로 내림차순 조회
SELECT JOB_CODE, COUNT(*) "사원 수" FROM EMPLOYEE GROUP BY JOB_CODE ORDER BY "사원 수" DESC;

-- 각 급여 등급별 평균 보너스(내림차순) 조회
SELECT SAL_LEVEL, AVG(BONUS) "평균 보너스" FROM EMPLOYEE GROUP BY SAL_LEVEL ORDER BY "평균 보너스" DESC;

-- 각 부서별 사원들의 입사일이 가장 오래된 사원 오름차순 조회
SELECT DEPT_CODE, MIN(HIRE_DATE) "최초입사일" FROM EMPLOYEE GROUP BY DEPT_CODE ORDER BY "최초입사일" ASC;

-- 급여가 300이상인 사원들의 부서별 사원 수 조회
SELECT DEPT_CODE, COUNT(*) "급여300만이상" FROM EMPLOYEE WHERE SALARY >= 3000000 group by DEPT_CODE ORDER BY "급여300만이상" ASC;

-- 부서별 보너스율이 0.1 이상인 사원 수 조회
SELECT DEPT_CODE, COUNT(*) "보너스 받은 사원 수" FROM EMPLOYEE WHERE BONUS >= 0.1 GROUP BY DEPT_CODE ORDER BY "보너스 받은 사원 수" DESC;

-- 급여가 400만 이하인 사원들의 직급별 사원 수 내림차순
SELECT JOB_CODE, COUNT(*) "사원 수" FROM EMPLOYEE WHERE SALARY <= 4000000 GROUP BY JOB_CODE ORDER BY "사원 수" DESC;

-- 급여가 500만 이상인 사원들의 부서별 평균 급여 조회 내림차순
SELECT DEPT_CODE, AVG(SALARY) "평균 급여" FROM EMPLOYEE WHERE SALARY >= 5000000 GROUP BY DEPT_CODE ORDER BY "평균 급여" DESC;




