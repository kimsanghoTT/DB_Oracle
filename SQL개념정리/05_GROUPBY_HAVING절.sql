/*
SELECT문
순서    
5    SELECT 컬럼명, 컬럼명 AS "별칭", 컬럼명, .. 
1    FROM 테이블명 
2    WHERE (컬럼명 OR 함수식) 
3    GROUP BY 그룹을 묶을 컬럼명
4    HAVING 그룹함수식 비교연산자 비교값
5    ORDER BY (컬럼명 OR 별칭 OR 컬럼순번) 정렬방식

    //SELECT WHERE 절까지만 존재할경우
3    SELECT 컬럼명
1    FROM 테이블명
2    WHERE 조건식

    //SELECT ORDER BY절까지만 존재할경우 (WHERE X)
2    SELECT 컬럼명
1    FROM 테이블명
3    ORDER BY 정렬기준

    //SELECT ORDER BY절까지만 존재할경우 (WHERE O)
3    SELECT 컬럼명
1    FROM 테이블명
2    WHERE 조건식
4    ORDER BY 정렬기준
*/

/*
GROUP BY 절
    - 같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶은 것
    - 여러개의 값을 묶어서 하나로 처리할 목적으로 사용
    - 그룹으로 묶은 값에 대해 SELECT 절에서 그룹 함수를 사용
    
    - 그룹함수는 단 한 개의 결과 값만 산출하기 때문에 그룹이 여러개일 경우 오류 발생
    - 여러개의 결과 값을 산출하기 위해서는 그룹 함수가 적용된 그룹의 기준을 ORDER BY 절에 기술해서 사용
*/
-- EMPLOYEE에서 부서코드, 부서별 급여 합계 
SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;

/*
DEPT_CODE 부서코드와 각 부서의 급여 합계를 선택
GROUP BY DEPT_CODE : DEPT_CODE 기준으로 그룹을 생성. 동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
각 그룹의 월급 합(SUM(SALARY))을 적용해서 해당 부서의 모든 직원의 급여 합계를 계산한 것

(NULL)	5210000
D1	    7820000
D9	    17700000
D5	    15760000
D6	    10100000
D2	    6520000
D8	    6986240
*/
-- EMPLOYEE에서 부서코드와 부서별로 보너스를 받는 사원의 수 조회
SELECT DEPT_CODE, COUNT(*) AS "보너스를 받는 사원 수" 
FROM EMPLOYEE WHERE BONUS IS NOT NULL GROUP BY DEPT_CODE ORDER BY DEPT_CODE ASC;

/*
D1	    2
D5	    2
D6	    1
D8	    2
D9	    1
(NULL)	1
*/

-- EMPLOYEE에서 부서코드가 D5, D6인 부서의 평균 급여 조회
-- 버림(평균 급여)
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) "평균 급여" FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6') GROUP BY dept_code;

/*
    GROUP BY 사용시 주의해야할 점
    --> SELECT문에 GROUP BY절을 사용할 경우
    SELECT 절에 명시한 조회 컬럼 중 그룹 함수가 적용되지 않은 컬럼은 모두 GROUP BY절에 작성해야함
*/
-- EMPLOYEE에서 부서별로 같은 직급인 사원들의 급여 합계 조회, 부서코드 오름차순
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE, JOB_CODE ORDER BY DEPT_CODE;

/*
EMPLOYEE 테이블에서 부서코드, 직급코드에서 각 코드별로 급여 합계 계산해서 그룹화하고 부서코드 순서대로 정렬
D1  	J6	6440000
D1  	J7	1380000
D2	    J4	6520000
D5  	J3	3500000
D5  	J5	8460000
D5  	J7	3800000
D6  	J3	7300000
D6  	J4	2800000
D8  	J6	6986240
D9	    J1	8000000
D9	    J2	9700000
NULL	J6	2320000
NULL	J7	2890000

예를 들어 KH 테이블 안에 컬럼 T반,U반이 있을 때
T반의 성별에 따른 총 학생 수 알고 싶다면
SELECT T반, 성별, SUM(학생수) FROM KH GROUP BY T반, 성별 ORDER BY 가나다순 정렬
*/
--------------------------------------------------------------------------------
/*
WHERE 절 : 지정된 테이블에서 어떤 행만을 조회결과로 삼을 것인지 조건을 지정하는 구문
    -> 테이블 내에서 특정 컬럼만 뽑아서 사용하겠다는 뜻
    
HAVING 절 : 그룹 함수로 구해올 그룹에 대한 조건을 설정할 때 사용
    -> 그룹에 대한 조건, 어떤 그룹만 조회하겠다는 뜻
*/
-- 부서별 평균 급여가 300만 이상인 부서 조회하고 오름차순 정렬

SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE WHERE SALARY >= 3000000 GROUP BY DEPT_CODE ORDER BY DEPT_CODE;

-- 부서별 평균 급여가 300만 이상인 부서 조회하고 부서코드 오름차순 정렬
-- 모든 직원들을 대상으로 그룹화한 후 각 부서별로 평균 급여를 계산
-- HAVING 절을 이용해서 계산된 평균 급여가 300만원 이상인 부서만 필터링
-- 모든 급여를 고려해서 평균을 계산한 다음 조건에 맞는 결과만 필터링
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE HAVING AVG(SALARY) >= 3000000 ORDER BY DEPT_CODE ASC;

/*
D1	3660000
D5	3630000
D6	3650000
D9	5900000

D6	3366666.66666666666666666666666666666667
D9	5900000

WHERE절의 경우 조건에 맞는 값만 가지고 온 후에 보여준다면 HAVING의 경우 모든 값을 확인하고 조건에 부합하는 그룹만 보여줌
*/
/*
집계 함수(ROLLUP, CUBE)
    그룹 별 산출한 결과 값의 집계를 계산하는 함수
    GROUP BY 절에서만 작성할 수 있는 함수
        -> WHERE, ORDER, SELECT에서 사용하지 않음
    
    ROLLUP 함수 : 그룹별로 중간 집계를 처리하는 함수
    그룹별로 묶여진 값에 대한 '중간 집계'와 '총 집계'를 계산해서 자동으로 추가하는 함수
    * 인자로 전달받은 그룹 중에서 가장 먼저 지정한 그룹별 합계와 총합계를 구하는 함수
*/
-- EMPLOYEE에서 각 부서에 소속된 직급 별 급여 합, 부서별 급여 합, 전체 직원 급여 총합 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) ORDER BY DEPT_CODE;

/*
-> employee 테이블에서 DEPT_CODE와 JOB_CODE 기준으로 SALARY 합 구함
특정 그룹의 합계 전체 -> 소계
부서코드가 동일한 모든 행의 합계
 
D1	    J6	    6440000 - D1부서의 J6 직급 급여 합계
D1	    J7	    1380000 - D1부서의 J7 직급 급여 합계
D1	    총합	    7820000 - D1부서 전체의 급여 합계(소계)
D2	    J4	    6520000 - D2부서의 J4 직급 급여 합계
D2	    총합	    6520000 - D2부서 전체의 급여 합계(소계)
D5	    J3	    3500000 - D5부서의 J3 직급 급여 합계
D5	    J5	    8460000 - D2부서의 J5 직급 급여 합계
D5	    J7	    3800000 - D2부서의 J7 직급 급여 합계
D5	    총합	    15760000 - D5부서 전체의 급여 합계(소계)
D6	    J3	    7300000 - D6부서의 J3 직급 급여 합계
D6	    J4	    2800000 - D5부서의 J4 직급 급여 합계
D6	    총합	    10100000 - D6부서 전체의 급여 합계(소계)
D8	    J6	    6986240 - D8부서의 J6 직급 급여 합계
D8	    총합	    6986240 - D8부서 전체의 급여 합계(소계)
D9	    J1	    8000000 - D9부서의 J1 직급 급여 합계
D9	    J2	    9700000 - D9부서의 J2 직급 급여 합계
D9	    총합     17700000 - D9부서 전체의 급여 합계(소계)
null	J6	    2320000 - 부서 없는 J6 직급 급여 합계
null	J7	    2890000 - 부서 없는 J7 직급 급여 합계
null	총합	    5210000 - 부서 없는 사원 전체 급여 합계(소계)
총합     총합	    70096240 - 전체 사원 급여 합계(총계)
*/

/*
CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수
* 그룹으로 지정된 모든 그룹에 대한 집계와 총합계를 진행
*/
-- EMPLOYEE에서 각 부서 마다 직급 별 급여 합, 부서별 급여 합
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY CUBE(DEPT_CODE, JOB_CODE) ORDER BY DEPT_CODE;

/*
CUBE는 ROLLUP보다 더 포괄적인 집계 결과를 생성
CUBE는 가능한 모든 것을 조합하고 조합에 대한 결과와 총합을 계산

D1	    J6	    6440000 - D1부서의 J6 직급 급여 합계
D1	    J7	    1380000 - D1부서의 J7 직급 급여 합계
D1	    총합	    7820000 - D1부서 전체의 급여 합계(소계)
D2	    J4	    6520000 - D2부서의 J4 직급 급여 합계
D2	    총합	    6520000 - D2부서 전체의 급여 합계(소계)
D5	    J3	    3500000 - D5부서의 J3 직급 급여 합계
D5	    J5	    8460000 - D2부서의 J5 직급 급여 합계
D5	    J7	    3800000 - D2부서의 J7 직급 급여 합계
D5	    총합	    15760000 - D5부서 전체의 급여 합계(소계)
D6	    J3	    7300000 - D6부서의 J3 직급 급여 합계
D6	    J4	    2800000 - D5부서의 J4 직급 급여 합계
D6	    총합	    10100000 - D6부서 전체의 급여 합계(소계)
D8	    J6	    6986240 - D8부서의 J6 직급 급여 합계
D8	    총합	    6986240 - D8부서 전체의 급여 합계(소계)
D9	    J1	    8000000 - D9부서의 J1 직급 급여 합계
D9	    J2	    9700000 - D9부서의 J2 직급 급여 합계
D9	    총합     17700000 - D9부서 전체의 급여 합계(소계)
null	J1	    8000000 - 모든 부서의 J1 직급 급여 합계
null	J2	    9700000 - 모든 부서의 J2 직급 급여 합계
null	J3	    10800000 - 모든 부서의 J3 직급 급여 합계
null	J4	    9320000 - 모든 부서의 J4 직급 급여 합계
null	J5	    8460000 - 모든 부서의 J5 직급 급여 합계
null	J6	    2320000 - 부서 없는 J6 직급 급여 합계
null	J6	    15746240 - 모든 부서의 J6 직급 급여 합계
null	J7	    2890000 - 부서 없는 J7 직급 급여 합계
null	J7	    8070000 - 모든 부서의 J7 직급 급여 합계
null	총합	    5210000 - 부서 없는 사원 전체 급여 합계(소계)
총합     총합	    70096240 - 전체 사원 급여 합계(총계)
*/

-- UNION INTERSECT MINUS

/*
집합 연산 (SET OPERATION)
    여러개의 SELECT 결과물을 하나의 쿼리로 만드는 연산자
    여러가지 조건이 있을 때 그에 해당하는 여러개의 결과값을 결합시키고 싶을 때 사용
    
    장점 : 초보자들이 사용하기 좋음(조건을 덜 생각해도 됨)
    주의할 점 : 집합 연산에 사용되는 SELECT문은 SELECT 절이 동일해야함
    
    UNION : OR같은 개념 -> 중복 제거
    INTERSECT : AND 같은 개념
    MINUS : 차집합 같은 개념
    UNION ALL : OR 결과 값에 AND 결과 값이 더해진 값 -> 중복이 제거되지 않은 채로 합쳐짐
*/

-- UNION : 여러개의 퀘리 결과를 하나로 합치는 연산자
-- 중복된 영역을 제외하여 하나로 합침

-- 부서코드가 D5 OR D6인 사원 이름, 부서코드 조회
-- 부서코드 D5
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D5'
UNION
-- 부서코드 D6
SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D6';

-- UNION ALL : 여러개의 쿼리 결과를 하나로 합치는 연산자
-- 중복 영역을 모두 포함하여 하나로 합침

-- 부서코드가 D5이거나 급여가 300만 초과하는 사원의 이름, 부서코드, 급여 조회(중복포함)
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D5'

UNION ALL

SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY > 3000000;

-- INTERSECT : 여러개의 SELECT한 결과 중에서 공통 부분만 결과로 추출

-- 부서코드가 D5면서 급여가 300만 초과하는 사원의 이름, 부서코드, 급여 조회
-- 부서코드가 D5
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D5' 

INTERSECT

-- 급여가 300만 초과
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY > 3000000;

-- INTERSECT를 안써도 GROUP BY나 WHERE 조건으로 구분 지을 수 있어서 많이는 안씀

-- MINUS : 선행 SELECT 결과에서 다음 SELECT 결과과 겹치는 부분을 제외한 나머지 부분 추출
-- 부서코드가 D5면서 급여가 300이하인 사원의 이름, 부서코드, 급여 조회
-- 부서코드가 D5
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE DEPT_CODE = 'D5' 

MINUS

-- 급여가 300만 초과
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY > 3000000;