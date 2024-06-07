/*
ROWNUM
    - 쿼리의 결과 집합에서 각 행에 순차적으로 1부터 시작하는 번호를 부여
    - 결과 집합의 크기를 제한할 수 있음

*/
-- 상위 5개의 행만 선택하는 예제
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE WHERE ROWNUM <=5;

-- 급여가 높은 상위 5명의 직원 선택
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY FROM (SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <=5;

-- 5위 이후부터 번호매김이 하고싶을 때
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE WHERE ROWNUM > 5;
-- ROWNUM은 무조건 1부터 시작하기 때문에 5 이후는 불가능한 조건
-- 랭킹에 주로 쓰임

-- 월급이 가장 높은 3명
SELECT ROWNUM, EMP_NAME, SALARY FROM EMPLOYEE WHERE ROWNUM <= 3 ORDER BY SALARY DESC;
-- 월급 높은 순서대로 출력한 다음 제대로 가장 높은 3명이 나온 게 맞는지 확인
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC;
-- 수정
SELECT ROWNUM, EMP_NAME, SALARY FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

/*
NVL 
    - NULL로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
    - 사용방법
        NVL(컬럼명, 컬럼값이 NULL일때 변경할 값)
    
    - NULL이 아닌 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
    - NULL로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
        NUL2(컬럼명, NULL아닌컬럼을변경할값, NULL일때변경할 값);
    
*/
-- EMPLOYEE에서 사번, 이름, 전화번호 조회, 전화번호가 없으면 없음으로 표기
SELECT EMP_ID, EMP_NAME, NVL(PHONE, '없음') FROM EMPLOYEE;
-- 전화번호가 있으면 010******** 형식으로 변경해서 조회


-- EMPLOYEE에서 이름, 급여, 성과급(급여*보너스) 조회, 성과급이 없으면 0으로 표시
SELECT EMP_NAME, SALARY, SALARY*NVL(BONUS, '0') "성과급" FROM EMPLOYEE;

-- EMPLOYEE에서 사번, 이름, 전화번호 조회, 전화번호가 없으면 없음으로 표기
-- 전화번호가 있으면 010******** 형식으로 변경해서 조회
SELECT EMP_ID, EMP_NAME, NVL(REPLACE(PHONE, SUBSTR(PHONE, 4), '********'), '없음') FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, NVL2(PHONE, '010********' ,'없음') FROM EMPLOYEE;
