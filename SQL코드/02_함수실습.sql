-- 함수 실습 코드

-- 1. LENGTH
-- 직원 이름의 길이(이름_길이) 조회
SELECT EMP_ID, EMP_NAME, LENGTH(EMP_NAME) AS "이름_길이" FROM EMPLOYEE;

-- 이메일 아이디의 길이 조회 이메일_길이로 작성
-- 아이디, 이름, 이메일, 이메일 길이
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EAMIL) AS "이메일_길이" FROM EMPLOYEE;

-- 전화번호 길이가 11자리인 직원 조회
-- 아이디 이름 번호
SELECT EMP_ID, EMP_NAME, PHONE FROM EMPLOYEE WHERE LENGTH(PHONE) = 11;

-- 이메일의 길이가 15자 이상인 직원
-- 아이디, 이름, 이메일, 이메일 길이
SELECT EMP_ID, EMP_NAME, EMAIL, LENGTH(EMAIL) FROM EMPLOYEE WHERE LENGTH(EMAIL) >= 12;

-- 2. INSTR
-- 부서코드가 2글자인 직원 조회 
-- 아이디, 이름, 부서코드
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE LIKE '__';

-- 전화번호에 010이 포함된 직원 조회
SELECT * FROM EMPLOYEE WHERE INSTR(PHONE, '010') = 1;
SELECT * FROM EMPLOYEE WHERE PHONE LIKE '010%';

-- 3. SUBSTR
-- 이름 3글자 (AS 이름_석자)
SELECT SUBSTR(EMP_NAME, 1, 3) "이름_석자" FROM EMPLOYEE;

-- 전화번호의 마지막 4자리(AS 마지막_네_자리)
SELECT SUBSTR(PHONE, -4) AS "마지막_네_자리" FROM EMPLOYEE WHERE PHONE IS NOT NULL;

-- 이름, 주민등록번호의 생년월일 추출(AS 생년월일)
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 6) AS "생년월일" FROM EMPLOYEE;

-- 전화번호의 앞 3자리 추출(AS 앞_세_자리)
SELECT SUBSTR(PHONE, 1, 3) AS "앞_세_자리" FROM EMPLOYEE WHERE PHONE IS NOT NULL;

-- 이메일 @ 뒤에 있는 도메인 추출
SELECT SUBSTR(EMAIL, INSTR(EMAIL, '@')+1) FROM EMPLOYEE; 

-- 4. AVG : 평균
-- 모든 사원의 평균 급여 조회
-- 올림
SELECT CEIL(AVG(SALARY)) "평균 급여" FROM EMPLOYEE;

-- 내림
SELECT FLOOR(AVG(SALARY)) "평균 급여" FROM EMPLOYEE;

-- 반올림
SELECT ROUND(AVG(SALARY)) "평균 급여" FROM EMPLOYEE;

-- 부서별 평균 급여 조회(AS 부서, AS 평균급여)
SELECT DEPT_CODE "부서", CEIL(AVG(SALARY)) "평균 급여" FROM EMPLOYEE group by DEPT_CODE;
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
56행, 8열에서 오류 발생
--> GROUP BY 구문을 써줘야함
*/
-- D5부서의 평균 급여 조회(AS D5부서 평균급여)
SELECT CEIL(AVG(SALARY)) "D5부서 평균 급여" FROM EMPLOYEE WHERE DEPT_CODE ='D5';


-- 5. COUNT
-- 전체 직원 수 조회(AS 총 직원 수)
SELECT COUNT(*) AS "총 직원 수" FROM EMPLOYEE;

-- D9 직원 수 조회(AS 직원 수)
SELECT COUNT(DEPT_CODE) AS "직원 수" FROM EMPLOYEE WHERE DEPT_CODE ='D9';

-- 보너스 받은 직원 수(AS 보너스 받은 직원들)
SELECT COUNT(BONUS) "보너스 받은 직원들" FROM EMPLOYEE;

-- 6. REPLACE
-- 이메일 주소에서 '.'을 '-'로 변경
-- 사번, 이메일(AS 수정된 이메일)
SELECT EMP_ID, REPLACE(EMAIL, '.', '-') "수정된 이메일" FROM EMPLOYEE;

-- 주민번호에서 모든 '-'을 문자열 ""로 변경
-- 사원이름, 주민번호(AS 수정된 번호)
SELECT EMP_NAME, REPLACE(EMP_NO, '-', '') "수정된 번호" FROM EMPLOYEE;

-- 이름에서 '김'을 'KIM'으로 변경
-- 이름(AS 수정된 이름)
SELECT REPLACE(EMP_NAME, '김', 'KIM') "수정된 이름" FROM EMPLOYEE;

-- 직무코드에서 J를 JOB으로 대체
-- 사번, 직무코드(AS 수정된 직무코드)
SELECT EMP_ID, REPLACE(JOB_CODE, 'J', 'JOB') "수정된 직무코드" FROM EMPLOYEE;


