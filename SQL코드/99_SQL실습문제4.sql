-- JOIN 실습문제
-- 주민번호가 70년대생, 여자, '전'씨인 직원의 이름, 주민번호, 부서명, 직급명
SELECT E.EMP_NAME, E.EMP_NO, D.DEPT_TITLE, J.JOB_NAME FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE 
AND SUBSTR(E.EMP_NO, 1, 1) = 7 AND SUBSTR(E.EMP_NO, 8, 1) IN ('2', '4') AND SUBSTR(E.EMP_NAME, 1, 1) = '전';

-- 이름에 '형'자가 들어간 직원들의 사번, 이름, 직급명
SELECT E.EMP_ID, E.EMP_NAME, J.JOB_NAME FROM EMPLOYEE E JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
WHERE E.EMP_NAME LIKE '%형%';


-- 해외영업1부, 2부에 근무하는 사원의 이름, 직급명, 부서코드, 부서명
SELECT E.EMP_NAME, J.JOB_NAME, E.DEPT_CODE, D.DEPT_TITLE FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE AND D.DEPT_TITLE IN ('해외영업1부', '해외영업2부');

SELECT E.EMP_NAME, J.JOB_NAME, E.DEPT_CODE, D.DEPT_TITLE FROM EMPLOYEE E 
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE D.DEPT_TITLE IN ('해외영업1부', '해외영업2부');

-- 보너스를 받는 직원들의 이름, 보너스율, 부서명, 근무지역명
SELECT E.EMP_NAME, E.BONUS, D.DEPT_TITLE, L.LOCAL_NAME FROM EMPLOYEE E, DEPARTMENT D, LOCATION L
WHERE E.DEPT_CODE = D.DEPT_ID AND D.LOCATION_ID = L.LOCAL_CODE AND BONUS IS NOT NULL;

SELECT E.EMP_NAME, E.BONUS, D.DEPT_TITLE, L.LOCAL_NAME FROM EMPLOYEE E JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID) = L.LOCAL_CODE WHERE BONUS IS NOT NULL;

-- 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명
SELECT E.EMP_NAME, J.JOB_NAME, D.DEPT_TITLE, L.LOCAL_NAME FROM EMPLOYEE E, DEPARTMENT D, LOCATION L, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE AND D.LOCATION_ID = L.LOCAL_CODE AND E.DEPT_CODE IS NOT NULL;

-- 급여등급별 최소급여보다 많이 받는 직원들의 이름, 직급명, 급여, 연봉(보너스포함)
SELECT E.EMP_NAME, J.JOB_NAME, E.SALARY, E.SALARY*12*(1 + NVL(E.BONUS,0)) "연봉" FROM EMPLOYEE E, JOB J, SAL_GRADE S
WHERE E.JOB_CODE = J.JOB_CODE AND E.SAL_LEVEL = S.SAL_LEVEL AND E.SALARY > S.MIN_SAL;

-- 한국과 일본에 근무하는 직원들의 이름, 부서명, 지역명, 국가명
SELECT E.EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, N.NATIONAL_NAME FROM EMPLOYEE E, DEPARTMENT D, LOCATION L, NATIONAL N
WHERE E.DEPT_CODE = D.DEPT_ID AND D.LOCATION_ID = L.LOCAL_CODE AND L.NATIONAL_CODE = N.NATIONAL_CODE 
AND N.NATIONAL_NAME IN ('한국', '일본');
ROLLBACK;
-- 같은 부서에 근무하는 직원들의 이름, 부서코드, 동료이름
SELECT E.EMP_NAME, E.DEPT_CODE, EE.EMP_NAME "동료이름" FROM EMPLOYEE E, EMPLOYEE EE
WHERE E.DEPT_CODE = EE.DEPT_CODE AND E.EMP_NAME != EE.EMP_NAME ORDER BY E.EMP_NAME ASC, E.DEPT_CODE ASC;

-- 보너스 포인트가 없는 직원들 중에서 직급코드가 J4, J7인 직원들의 이름, 직급명, 급여
SELECT EMP_NAME, JOB_NAME, SALARY FROM EMPLOYEE JOIN JOB USING(JOB_CODE) WHERE JOB_CODE IN ('J4', 'J7') AND BONUS IS NULL;

-- SUBQUERY 실습
-- 전지연 사원이 속해있는 부서원 조회, 전지연 제외
-- 사번, 이름, 전화번호, 입사일, 부서명
SELECT E.EMP_ID, E.EMP_NAME, E.PHONE, E.HIRE_DATE, D.DEPT_TITLE FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID AND E.DEPT_CODE = (SELECT E.DEPT_CODE FROM EMPLOYEE E WHERE E.EMP_NAME = '전지연')
AND E.EMP_NAME != '전지연';

-- 입사일이 2000년도 이후인 사원들 중에서 급여가 가장 높은 사원의 사번, 이름, 번호, 급여, 직급명
SELECT E.EMP_ID, E.EMP_NAME, E.PHONE, E.SALARY, J.JOB_NAME FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND E.SALARY = (SELECT MAX(E.SALARY) FROM EMPLOYEE E WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') >= 2000);

-- 노옹철 사원과 같은 부서, 같은 직급인 사원 조회, 노옹철은 제외
--사번, 이름, 부서코드, 직급코드, 부서명, 직급명
SELECT E.EMP_ID, E.EMP_NAME, E.DEPT_CODE, E.JOB_CODE, D.DEPT_TITLE, J.JOB_NAME FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE
AND E.DEPT_CODE =(SELECT E.DEPT_CODE FROM EMPLOYEE E WHERE E.EMP_NAME = '노옹철') 
AND E.JOB_CODE =(SELECT E.JOB_CODE FROM EMPLOYEE E WHERE E.EMP_NAME = '노옹철') 
AND E.EMP_NAME != '노옹철';

-- 2000년도에 입사한 사원과 부서, 직급이 같은 사원의 사번, 이름, 부서코드, 직급코드, 입사일
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2000') 
AND JOB_CODE = (SELECT JOB_CODE FROM EMPLOYEE WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2000');

SELECT E.EMP_ID, E.EMP_NAME, E.DEPT_CODE, E.JOB_CODE, E.HIRE_DATE FROM EMPLOYEE E JOIN EMPLOYEE EE 
ON E.DEPT_CODE = EE.DEPT_CODE AND E.JOB_CODE = EE.JOB_CODE
WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') = 2000 AND E.EMP_ID != EE.EMP_ID;
-- 2000년에 입사한 직원들을 찾고 동일한 부서와 직급을 가진 다른 직원 찾기
-- 2000년에 입사한 직원 E와 동일한 부서 및 직급의 다른직원 EE
-- 2000년에 입사한 직원 찾기

SELECT EE.EMP_ID, EE.EMP_NAME, EE.DEPT_CODE, EE.JOB_CODE, E.HIRE_DATE FROM EMPLOYEE E JOIN EMPLOYEE EE 
ON E.JOB_CODE = EE.JOB_CODE AND E.DEPT_CODE = EE.DEPT_CODE
WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') = 2000 AND E.EMP_ID != EE.EMP_ID;
-- E가 2000년에 입사한 직원을 기준으로 동일한 부서와 직급을 가진 다른 직원 E2 찾음
-- EE는 2000년에 입사한 직원과 동일한 부서와 직급을 가진 다른 직원

SELECT EE.EMP_ID, EE.EMP_NAME, EE.DEPT_CODE, EE.JOB_CODE, E.HIRE_DATE FROM EMPLOYEE E JOIN EMPLOYEE EE 
ON E.JOB_CODE = EE.JOB_CODE AND E.DEPT_CODE = EE.DEPT_CODE
WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') = 2000 AND EE.HIRE_DATE IS NOT NULL;


-- 77년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원의 사번,이름, 부서코드, 사수번호, 주민번호, 입사일
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, EMP_NO, HIRE_DATE FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 1, 2) = 77 AND SUBSTR(EMP_NO, 8, 1) = 2)
AND MANAGER_ID = (SELECT MANAGER_ID FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 1, 2) = 77 AND SUBSTR(EMP_NO, 8, 1) = 2);

/*SELECT EE.EMP_ID, EE.EMP_NAME, EE.DEPT_CODE, EE.MANAGER_ID, EE.EMP_NO, EE.HIRE_DATE FROM EMPLOYEE E JOIN EMPLOYEE EE
ON E.DEPT_CODE = EE.DEPT_CODE AND e.manager_id = EE.MANAGER_ID
WHERE EE.DEPT_CODE ;*/

-- 부서별 입사일이 가장 빠른 사원의 사번, 이름, 부서명(NULL이면 소속 없음), 직급명, 입사일 조회
-- 입사일이 빠른 순으로 정렬하고 퇴사한 직원은 제외
SELECT E.EMP_ID, E.EMP_NAME, NVL2(E.DEPT_CODE,D.DEPT_TITLE,'소속 없음') "부서명", J.JOB_NAME, E.HIRE_DATE 
FROM EMPLOYEE E, DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE
AND E.HIRE_DATE = (SELECT MIN(E.HIRE_DATE) FROM EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID AND E.ENT_YN ='N') 
ORDER BY E.HIRE_DATE;

-- 직급별 나이가 가장 어린 직원의 사번, 이름, 직급명, 나이, 보너스 포함 연봉 조회
-- 나이순으로 내림차순 정렬, 연봉은 원 단위 기호 및 숫자 자릿수 표시


-- 춘대학교 실습
-- 1번
-- 학생이름과 주소지를 조회하시오
-- 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 정렬
SELECT STUDENT_NAME "학생 이름", STUDENT_ADDRESS "주소자" FROM tb_student ORDER BY 1; 

-- 2번
-- 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서 조회하시오.
SELECT STUDENT_NAME, STUDENT_SSN FROM TB_STUDENT WHERE absence_yn='Y' ORDER BY SUBSTR(student_ssn,1, 2) DESC;

-- 3번
-- 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 
-- 이름과 학번, 주소를 이름 오름차순으로 조회하시오.
-- 단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다.
SELECT STUDENT_NAME "학생 이름", STUDENT_NO "학번", STUDENT_ADDRESS "거주지 주소" FROM tb_student
WHERE SUBSTR(STUDENT_ADDRESS, 1, 3) IN ('강원도', '경기도') AND STUDENT_NO NOT LIKE 'A%' ORDER BY STUDENT_NAME;

-- 4번
-- 현재 법학과 교수의 이름, 주민등록 번호를 나이가 많은 순서부터 조회하시오.
-- ANSI
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor 
WHERE DEPARTMENT_NO = '005' ORDER BY SUBSTR(PROFESSOR_ssn,1, 2) ASC;
-- ORACLE


-- 5번
-- 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 조회하시오.
-- (참고) 소수점 아래 2자리까지 0으로 표현 : TO_CHAR(NUMBER, 'FM9.00')
-- (FM : 조회 결과 양쪽 공백 제거)
SELECT STUDENT_NO, TO_CHAR(AVG(POINT), 'FM9.00') FROM TB_GRADE  WHERE CLASS_NO = 'C3118100' group by STUDENT_NO
ORDER BY 2 DESC, STUDENT_NO ASC;

-- 6번
-- 학생 번호, 학생 이름, 학과 이름을 학생 이름 오름차순으로 조회하시오.
-- ANSI
SELECT S.STUDENT_NO, S.STUDENT_NAME, D.DEPARTMENT_NAME FROM TB_STUDENT S JOIN TB_DEPARTMENT D ON(S.DEPARTMENT_NO = D.DEPARTMENT_NO)
ORDER BY 1;
-- ORACLE
SELECT S.STUDENT_NO, S.STUDENT_NAME, D.DEPARTMENT_NAME FROM TB_STUDENT S, TB_DEPARTMENT D WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY 1;

-- 7번
-- 춘 기술대학교의 과목 이름, 해당 과목을 수업하는 학과 이름을 조회하시오.
-- ANSI
SELECT C.CLASS_NAME, D.DEPARTMENT_NAME FROM TB_CLASS C JOIN TB_DEPARTMENT D ON(C.DEPARTMENT_NO = D.DEPARTMENT_NO);
-- ORACLE
SELECT C.CLASS_NAME, D.DEPARTMENT_NAME FROM TB_CLASS C, TB_DEPARTMENT D WHERE C.DEPARTMENT_NO = D.DEPARTMENT_NO;

-- 8번
-- 과목, 해당 과목 교수 이름을 조회하시오.
-- TB_CLASS_PROFESSOR : 과목별 교수의 정보를 저장한 테이블(과목 코드, 학과 코드)
-- ANSI
SELECT C.CLASS_NAME, P.PROFESSOR_NAME FROM tb_class_professor CP 
JOIN TB_CLASS C ON (C.CLASS_NO = CP.CLASS_NO)
JOIN TB_PROFESSOR P ON (CP.PROFESSOR_NO = P.PROFESSOR_NO);
-- TB_CLASS와  TB_PROFESSOR 테이블이 공통으로
-- DEPARTMENT_NO 컬럼을 가지고 있다 해서 이를 이용해서 JOIN을 하면 안됨!
-- ORACLE
SELECT C.CLASS_NAME, P.PROFESSOR_NAME FROM tb_class_professor CP, TB_CLASS C, TB_PROFESSOR P 
WHERE C.CLASS_NO = CP.CLASS_NO  AND CP.PROFESSOR_NO = P.PROFESSOR_NO;

-- 9번
-- 8번의 결과 중 '인문 사회' 계열에 속한 과목명, 교수이름을 과목명 오름차순으로 조회하시오.
-- ANSI
SELECT C.CLASS_NAME, P.PROFESSOR_NAME FROM tb_class_professor CP 
JOIN TB_CLASS C ON (C.CLASS_NO = CP.CLASS_NO)
JOIN TB_PROFESSOR P ON (CP.PROFESSOR_NO = P.PROFESSOR_NO) WHERE DEPARTMENT_NO <= 21;
-- ORACLE

                        
-- 10번
-- 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 조회하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)
-- ANSI
SELECT S.STUDENT_NO, S.STUDENT_NAME, ROUND(AVG(G.POINT),1) FROM TB_STUDENT S 
JOIN TB_GRADE G ON (S.STUDENT_NO = G.STUDENT_NO) WHERE S.DEPARTMENT_NO = '059' GROUP BY S.STUDENT_NO, s.student_name;

-- ORACLE
SELECT S.STUDENT_NO, S.STUDENT_NAME, ROUND(AVG(G.POINT),1) FROM TB_STUDENT S, TB_GRADE G 
WHERE S.STUDENT_NO = G.STUDENT_NO AND S.DEPARTMENT_NO = '059' GROUP BY S.STUDENT_NO, s.student_name;

-- 11번
-- 학번이 A313047인 학생의 학과이름, 학생이름, 지도교수 이름을 조회하시오.
-- ANSI
SELECT D.DEPARTMENT_NAME, S.STUDENT_NAME, P.PROFESSOR_NAME FROM TB_STUDENT S
JOIN tb_department D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
JOIN tb_professor P ON (S.COACH_PROFESSOR_NO = P.PROFESSOR_NO) WHERE S.STUDENT_NO = 'A313047';
-- ORACLE
SELECT D.DEPARTMENT_NAME, S.STUDENT_NAME, P.PROFESSOR_NAME FROM TB_STUDENT S, tb_department D, tb_professor P
WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO AND S.STUDENT_NO = 'A313047';

-- 12번
-- 2007년도에 '인간관계론' 과목을 수강한 학생을 찾아 
-- 학생이름과 수강학기를 조회하는 SQL을 작성하시오.
-- ANSI


-- ORACLE


-- 13번
-- 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 
-- 과목 이름, 학과 이름을 조회하시오.
SELECT C.CLASS_NAME, D.DEPARTMENT_NAME FROM TB_CLASS C 
JOIN TB_DEPARTMENT D ON (C.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE C.DEPARTMENT_NO BETWEEN '056' AND '063';
-- ANSI
-- ORACLE

-- 14번
-- 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 
-- 학생이름, 지도교수이름 학번이 높은 순서로 조회하는 SQL을 작성하시오.
-- 단, 지도교수가 없을 경우 "지도교수 미지정"으로 표시

-- ANSI
-- ORACLE


-- 15번
-- 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 
-- 학생의 학번, 이름, 학과, 이름, 평점을 조회하시오.

-- ANSI
-- ORACLE



-- 16번
-- 환경조경학과 전공과목들의 과목 별 평점을 조회하시오.
-- (평점은 TRUNC를 이용해 소수점 아래 둘째 자리까지 표시)
-- ANSI

-- ORACLE


-- 17번
-- 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 조회하시오.
       
  
-- 18번
-- 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 조회하시오


-- 19번
-- 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 
-- 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL문을 작성하시오
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고, 
-- 평점은 소수점 첫째자리까지만 반올림하여 표시

-- ANSI
-- ORACLE







