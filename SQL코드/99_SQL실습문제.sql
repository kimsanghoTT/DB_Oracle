
--`DEPT_CODE`가 'D5'가 아닌 사원의 이름과 부서 코드
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE != 'D5';

--`SALARY`가 3000000보다 크지 않은 사원의 이름과 급여
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY < '3000000';

--`JOB_CODE`가 'J3'가 아닌 사원의 이름과 직무 코드
SELECT EMP_NAME, JOB_CODE FROM EMPLOYEE WHERE JOB_CODE != 'J3';

--`BONUS`가 0.1이 아닌 사원의 이름과 보너스
SELECT EMP_NAME, BONUS FROM EMPLOYEE WHERE BONUS != '0.1';

--`MANAGER_ID`가 200이 아닌 사원의 이름과 매니저 ID
SELECT EMP_NAME, MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID != '200';

--`EMAIL`이 없는 사원의 이름과 이메일
SELECT EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL IS NULL;

--`PHONE`이 없는 사원의 이름과 전화번호
SELECT EMP_NAME,PHONE FROM EMPLOYEE WHERE PHONE IS NULL;

--`BONUS`가 없는 사원의 이름과 보너스
SELECT EMP_NAME, BONUS FROM EMPLOYEE WHERE BONUS IS NULL;

--`MANAGER_ID`가 없는 사원의 이름과 매니저 ID
SELECT EMP_NAME, MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NULL;

--`ENT_DATE`가 없는 사원의 이름과 종료일
SELECT EMP_NAME, ENT_DATE FROM EMPLOYEE WHERE ENT_DATE IS NULL;

--`EMAIL`이 있는 사원의 이름과 이메일
SELECT EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL IS NOT NULL;

--`PHONE`이 있는 사원의 이름과 전화번호
SELECT EMP_NAME, PHONE FROM EMPLOYEE WHERE PHONE IS NOT NULL;

--`BONUS`가 있는 사원의 이름과 보너스
SELECT EMP_NAME, bonus FROM EMPLOYEE WHERE bonus IS NOT NULL;

--`MANAGER_ID`가 있는 사원의 이름과 매니저 ID
SELECT EMP_NAME, manager_id FROM EMPLOYEE WHERE manager_id IS NOT NULL;

--`ENT_DATE`가 있는 사원의 이름과 종료일
SELECT EMP_NAME, ent_date FROM EMPLOYEE WHERE ent_date IS NOT NULL;

--`SALARY`가 2000000에서 3000000 사이인 사원의 이름과 급여
SELECT EMP_NAME, salary FROM EMPLOYEE WHERE salary between '2000000' and '3000000';

--`HIRE_DATE`가 2000년 1월 1일부터 2010년 12월 31일 사이인 사원의 이름과 입사일
SELECT EMP_NAME, hire_date FROM EMPLOYEE WHERE hire_date between TO_DATE('2000-01-01', 'YYYY-MM-DD') and TO_DATE('2010-12-31', 'YYYY-MM-DD');

--`EMP_ID`가 210에서 220 사이인 사원의 이름과 ID
SELECT EMP_NAME, EMP_ID FROM EMPLOYEE WHERE EMP_ID between '210' and '220';

--`BONUS`가 0.1에서 0.3 사이인 사원의 이름과 보너스
SELECT EMP_NAME, BONUS FROM EMPLOYEE WHERE BONUS between '0.1' and '0.3';

--`SAL_LEVEL`이 'S3'에서 'S5' 사이인 사원의 이름과 급여 수준
SELECT EMP_NAME, salary FROM EMPLOYEE WHERE sal_level between 'S3' and 'S5';

--`SALARY`가 2000000에서 3000000 사이가 아닌 사원의 이름과 급여
SELECT EMP_NAME, salary FROM EMPLOYEE WHERE salary NOT between '2000000' and '3000000';

--`HIRE_DATE`가 2000년 1월 1일부터 2010년 12월 31일 사이가 아닌 사원의 이름과 입사일
SELECT EMP_NAME, hire_date FROM EMPLOYEE WHERE hire_date NOT between TO_DATE('2000-01-01', 'YYYY-MM-DD') and TO_DATE('2010-12-31', 'YYYY-MM-DD');

--`EMP_ID`가 210에서 220 사이가 아닌 사원의 이름과 ID
SELECT EMP_NAME, EMP_ID FROM EMPLOYEE WHERE EMP_ID NOT between '210' and '220';

--`BONUS`가 0.1에서 0.3 사이가 아닌 사원의 이름과 보너스
SELECT EMP_NAME, BONUS FROM EMPLOYEE WHERE BONUS NOT between '0.1' and '0.3';

--`SAL_LEVEL`이 'S3'에서 'S5' 사이가 아닌 사원의 이름과 급여 수준
SELECT EMP_NAME, salary FROM EMPLOYEE WHERE sal_level NOT between 'S3' and 'S5';





