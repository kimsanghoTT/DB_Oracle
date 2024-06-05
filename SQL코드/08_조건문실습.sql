-- DECODE 실습
-- 주어진 학생의 주민번호를 기준으로 성별 출력
SELECT STUDENT_NAME, STUDENT_SSN,
DECODE(SUBSTR(STUDENT_SSN, 8, 1), '1','남자','2','여자','기타')
FROM tb_student;

-- D1 ~ D4 부서명 출력
SELECT EMP_NAME, DEPT_CODE, 
DECODE(DEPT_CODE, 'D1', '인사관리부', 'D2', '회계관리부', 'D3', '마케팅부', 'D4', '국내영업부')
FROM EMPLOYEE;

-- J1~J7 직급명 출력
SELECT EMP_NAME, JOB_CODE, 
DECODE(JOB_CODE, 'J1', '대표', 'J2','부사장','J3','부장','J4','차장','J5','과장','J6','대리','J7','사원','알 수 없음') "직급"
FROM EMPLOYEE;

-- CASE WHEN THEN ELSE END 실습
-- 급여에 따라 등급 설정
-- 600이상 : S1, 500이상 : S2, 400이상 : S3, 나머지 S4 AS급여등급
SELECT EMP_NAME, SALARY,
    CASE
        WHEN SALARY >= 6000000 THEN 'S1'
        WHEN SALARY >= 5000000 THEN 'S2'
        WHEN SALARY >= 4000000 THEN 'S3'
        ELSE 'S4'
    END
FROM EMPLOYEE;

-- 근무 일 수에 따라 근속 기간 파악하는 CASE
SELECT EMP_NAME, HIRE_DATE, 
    CASE
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) >= 20 THEN '20년 이상'
        WHEN FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) >= 10 THEN '10년 이상'
        ELSE '근속기간 분류중'
    END
FROM EMPLOYEE;
