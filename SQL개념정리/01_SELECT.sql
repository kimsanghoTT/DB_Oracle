/*
SELECT(조회)
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL
    
    - 작성된 구문에 맞는 행, 열 데이터를 조회
        -> 조회된 결과 행의 집합 == RESULT SET (결과 집합)
        
    - RESULET SET은 0행 이상이 포함 가능함
        -> 조건에 맞지 않는 행이 있을 수도 있다는 점

    SELECT 작성법 (기초)
        SELECT 컬럼명, 컬럼명, ... FROM 테이블명;
        -> 지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
        
        테이블의 모든 행, 모든 컬럼 조회하는 방법
        *(ASTERISK) : 모든, 포함하다를 나타내는 기호
        
*/

-- EMPLOYEE 테이블에서 모든 행의 사번, 이름, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 행, 열의 정보 조회
SELECT * FROM EMPLOYEE;

/*
컬럼 값 산술 연산
    - 컬럼 값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
    - SELECT문에 산술 연산을 직접 작성하면 조회 결과(RESULT SET)에 연산 결과가 반영되어 조회됨
*/

-- EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여+100만원 조회
SELECT EMP_NAME, SALARY, SALARY+1000000 FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 연봉 조회
SELECT EMP_NAME, SALARY * 12 AS "연봉" FROM EMPLOYEE;

/*
SYSDATE, SYSTIMESTAMP
    - 시스템이 나타내고 있는 현재 시간
    
    - SYSDATE : 현재 시간(년,월,일,시,분,초) 조회
    - SYSTIMESTAMP : 현재 시간(년,월,일,시,분,초 MS+지역(LOCAL))조회
    
    - 회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
    - 컴퓨터에서 현재 시간을 기록할 때 사용
*/

/*
날짜 사용하기
    - DB에 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용
    - TO_DATE('문자열', '패턴');
        EX) 2024-05-01자 이후 회원가입 한 회원 조회
            TO_DATE('2024-05-01', 'YYYY-MM-DD');
*/

/*
컬럼명 별칭 지정
    1. 컬럼명 AS "별칭" : 문자, 띄어쓰기, 특수문자 모두 가능
    2. 컬럼명 "별칭" : 문자, 띄어쓰기, 특수문자 모두 가능
    3. 컬럼명 별칭 : 문자 가능 / 띄어쓰기, 특수문자 불가능
    4. 컬럼명 AS 별칭 : 문자 가능 / 띄어쓰기, 특수문자 불가능
*/

-- EMPLOYEE 테이블에서 이름, 이메일 조회. 이메일에 @포함 별칭
SELECT EMP_NAME, EMAIL AS "@ 포함" FROM EMPLOYEE;
SELECT EMP_NAME, EMAIL "@ 포함" FROM EMPLOYEE;
-- SELECT EMP_NAME, EMAIL @ 포함 FROM EMPLOYEE; -> 띄어쓰기, 특수문자 있어서 오류남
-- SELECT EMP_NAME, EMAIL AS @ 포함 FROM EMPLOYEE; -> 띄어쓰기, 특수문자 있어서 오류남

/*
DISTINCT(별개, 다른) : 중복 제거
    - 조회결과집합(RESULT SET)에서 지정된 컬럼값이 중복되는 경우 한 번만 표시할 때 사용
    
    사용 방법
    SELECT DISTINCT 중복제거할컬럼명1, 중복제거할컬럼명2, .... FROM 테이블명;
*/

-- EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

-- 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-->D3, D4, D7 부서는 사원이 없기 때문에 조회되지 않음

-- EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

/*
WHERE절
    - 테이블에서 조건을 충족하는 행을 조회할 때 사용
    - WHERE 절에는 조건식(TRUE / FALSE)만 작성
    
비교 연산자 : >, <, <=, >=, =, !=(같지않다), <>(같지않다)
논리 연산자 : AND, OR, NOT

    사용 방법
    SELECT 컬럼명 FROM 테이블명 WHERE 조건식;
    -> 지정된 테이블의 모든 행에서 컬럼명이 일치하는 컬럼값 조회
*/

-- EMPLOYEE 테이블에서 급여가 300만원 초과하는 사원의 이름, 급여, 부서코드
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE WHERE SALARY > '3000000';

-- EMPLOYEE 테이블에서 D9부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- EMPLOYEE 테이블에서 D9부서에 해당하지 않는 사원의 이름 조회
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE != 'D9';

/*
NULL, NOT NULL

컬럼값이 존재하지 않을 경우 "IS NULL;"
컬럼값이 존재할 경우 "IS NOT NULL;"
*/

-- EMPLOYEE 테이블에서 부서코드가 없는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;

-- EMPLOYEE 테이블에서 부서코드가 있는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;

/*
BETWEEN
    - 사용 방법
        1. 컬럼명 BETWEEN A AND B;
           컬럼 값이 A 이상 B 이하면 TRUE
        
        2. 컬럼명 NOT BETWEEN A AND B;
           컬럼 값이 A이상 B 이하면 FALSE
           컬럼의 값이 A미만 또는 B 초과시 TRUE
*/

-- 급여가 300이상 500이하
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN '3000000' AND '5000000';

-- 급여가 300미만 또는 500초과
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN '3000000' AND '5000000';

/*
컬럼명 IN(값1, 값2, 값3, ...)
    컬럼의 값이 ()값과 일치하면 TRUE
    
컬럼명 NOT IN(값1, 값2, 값3, ...)
    컬럼의 값이 ()값과 일치하면 FALSE
    컬럼의 값이 ()값과 불일치하면 TRUE
    
WHERE OR 사용해서 값1, 값2, 값3, .. 과 같은 표시를 하기도 함
*/

------------------
-- EMPLOYEE 테이블에서 부서코드가 D5, D6, D9인 사원의 이름, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY FROM employee WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D9';

SELECT EMP_NAME, DEPT_CODE, SALARY FROM employee WHERE DEPT_CODE IN ('D5','D6','D9');

-- EMPLOYEE 테이블에서 부서코드가 D5, D6, D9가 아닌 사원의 이름, 부서코드, 급여 조회

SELECT EMP_NAME, DEPT_CODE, SALARY FROM employee WHERE DEPT_CODE NOT IN ('D5','D6','D9');

/*
LIKE
    - 비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
    - 사용 방법
        WHERE 컬럼명 LIKE '패턴';
        
        % : 포함
        - %A : 앞은 어떤 문자열이든 포함하고 마지막은 A로 끝나는 문자열
            EX) %륨 : 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷
            
        - %A% : 앞과 뒤는 어떤 문자열이든 관계없이 중간에 A가 들어가는 문자열
            EX) %로% : 검색창에 로가 중간에 들어간 단어를 검색한 것과 비슷
            
        - A% : A로 시작하고 끝은 상관없는 문자열
            EX) 림% : 림으로 시작하는 단어를 검색한 것과 비슷
            
        글자 수
        - A_ : A뒤에 아무거나 한 글자만 있는 문자열
            EX)AB, A1, A가
               가_ : 가로 시작하는 두 글자 단어만 검색
               나__ : 나로 시작하는 세 글자 단어만 검색
        
        _A : A앞에 아무거나 한 글자만 있는 문자열
            EX)BA, 1A, 가A
               _가 : 가로 끝나는 두 글자 단어만 검색
               __나 : 나로 끝나는 세 글자 단어만 검색
*/

-- EMPLOYEE에서 성이 전씨인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '전%';

-- EMPLOYEE에서 이름이 수로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%수';

-- EMPLOYEE에서 이름에 하가 포함되는 사원의 사번 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '%하%';

-- EMPLOYEE에서 이름이 전으로 시작하고 돈으로 끝나는 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE EMP_NAME LIKE '전%돈';

-- ESCAPE 옵션 : LIKE 의미를 벗어나 단순 문자열로 인식
--> 적용 범위 : 특수문자 뒤 한 글자
SELECT EMP_ID EMP_NAME, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '___#_%' ESCAPE '#';

/*
___ : 세 글자를 의미
ESCAPE '#' : 구분 기준 설정, ___LIKE 3글자만 찾으라는 의미로 구분짓는 것
_% -> _로 된 글자 찾기

___#_% __@%
_를 @ 처럼 사용하길 원해서 중간에 #를 넣어준 것

___#_% __돈%
_를 돈처럼 사용하길 원해서 중간에 #를 넣어준 것

LIKE '_#@%' ESCAPE '#' 에서 문자 그대로 @를 의미

구분짓고 싶을 때
LIKE '___^_%' ESCAPE '^';
LIKE '___*_%' ESCAPE '*';
*/

/*
DUAL(DUmmy tAbLe)
dummy : 실제로 사용되지 않는 데이터
* 더미테이블 : 실제로 존재하지는 않는 테이블
    -> 테이블을 만들기는 번거롭고, 테스트나 사용은 해봐야할 때
    -> 단순히 데이터를 조회하거나 확인할 때 사용
*/

-- 존재하지 않는 테이블을 이용해서 현재 시간 확인하기
select sysdate, systimestamp from dual;

-- WHERE절 별칭 사용 불가 확인
-- 부서코드 D6 확인
SELECT EMP_NAME, DEPT_CODE AS "부서코드" FROM EMPLOYEE WHERE 부서코드 ='D6';
ORA-00904: "부서코드": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
6행, 66열에서 오류 발생

-->부서코드, 컬럼이 존재하지 않음
-- 별칭은 사람의 눈에 들기 쉽게 작성하는 것일 뿐
-- WHERE절에서 찾는 용도로 사용할 수 없음

-- 다만 ORDER BY 절에서는 별칭이 사용 가능
SELECT EMP_NAME, SALARY*12 AS "연봉" FROM EMPLOYEE ORDER BY "연봉" DESC;

/*
ORDER BY는 값을 컬럼에서 찾아오는 게 아니라 나타난 정보를 정렬할 뿐이기 때문에 별칭을 사용 가능
*/

-- 이름, 부서코드, 급여를 부서코드 오름차순, 급여 내림차순으로 정렬, 조회
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE ORDER BY DEPT_CODE ASC, SALARY DESC;

-- 이름, 부서코드, 직급코드를 부서코드 오름차순, 직급코드 내림차순, 이름 오름차순으로 정렬, 조회
SELECT EMP_NAME "이름", DEPT_CODE "부서코드", JOB_CODE "직급코드" FROM EMPLOYEE ORDER BY 부서코드 ASC, 직급코드 DESC, 이름 ASC;

-- 사원의 이름과 이메일을 결합해서 조회
SELECT EMP_NAME || '(' ||EMAIL|| ')' FROM EMPLOYEE; 

-- 사원의 이름, 전화번호를 - 사용해서 조회
SELECT EMP_NAME || '-' || PHONE FROM EMPLOYEE;

-- 사번, 부서코드를 - 사용해서 조회
SELECT EMP_ID || '-'|| DEPT_CODE FROM EMPLOYEE;

-- 이름, 급여를 "이름 : 급여" 형식으로 조회. AS 이름 : 급여
SELECT EMP_NAME || ' : ' || SALARY "이름 : 급여" FROM EMPLOYEE;

-- 이름 - 연봉 형식으로 조회
SELECT EMP_NAME || '-' || SALARY*12 "이름 - 급여" FROM EMPLOYEE;

/*
ORDER BY절
    SELECT 문의 조회 결과(RESULT SET)를 정렬할 때 사용하는 구문
    -> SELECT문에서 제일 마지막에 해석됨
    
    사용 방법
    SELECT 컬럼명, 컬럼명 AS "별칭", 컬럼명, ... FROM 테이블명 
    WHERE 조건식 ORDER BY (컬럼명 or 별칭 or 컬럼순서) ASC or DESC;
    
    컬럼 순서의 기본값은 오름차순.
    ASC : 오름차순
    DESC : 내림차순
*/
-- EMPLOYEE의 모든 사원의 이름, 급여(오름차순) 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY ASC;

-- EMPLOYEE의 모든 사원의 이름, 급여(내림차순) 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC;

-- EMPLOYEE의 부서코드가 D5, D6, D9인 사원의 사번, 이름, 부서코드(오름차순) 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE IN ('D5','D6','D9') ORDER BY DEPT_CODE;
-- 오름차순은 생략 가능

-- 컬럼 순서를 이용해서 정렬하는 방법
-- EMPLOYEE에서 급여가 300이상, 600이하인 사원의 사번, 이름(내림차순), 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN '3000000' AND '6000000' ORDER BY EMP_NAME DESC;

-- EMP_NAME 현재 2번쨰 자리에 위치하는 순서르 이용해서 ORDER BY
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN '3000000' AND '6000000' ORDER BY 2 DESC; -- 2 : EMP_NAME
-- 사번으로 정렬하길 윈한다면 ORDER BY '1'
-- 급여로 정렬하길 원한다면 ORDER BY '3'

-- ORDER BY절에 수식 적용
-- EMPLOYEE에서 이름, 연봉을 연봉 내림차순 조회
SELECT EMP_NAME, SALARY*12 FROM EMPLOYEE ORDER BY SALRY*12 DESC;
SELECT EMP_NAME, SALARY* 12 AS "연봉" FROM EMPLOYEE ORDER BY "연봉" DESC;
--> SELECT절 해석 이후 ORDER BY절이 해석되므로, SELECT절에서 해석된 별칭을 ORDER BY에서 사용 가능
--> 주의점 : ORDER BY에서는 별칭 사용이 가능하지만 WHERE절에서는 사용이 불가능
/*
WHERE은 결과를 나타내기 위해 찾는 조건문, ORDER BY는 결과를 가지고 결과 정리를 하는 표현방법
조건이 진행도 안됐는데 별칭을 붙이는 것은 불가능하기 때문
*/

/* ORDER BY로 정렬을 진행할 경우에는 SELECT절에 작성된 컬럼명 그대로 작성할 경우가 많음 */

/*
정렬 중첩
    먼저 작성된 정렬 기준을 깨지 않고 다음 작성된 정렬 기준 적용. 각각 다른 정렬 기준이 됨.
    ORDER BY 정렬기준1, 정렬기준2;
*/
-- EMPLOYEE에서 이름, 부서코드(오름차순), 급여(내림차순) 조회
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE ORDER BY DEPT_CODE, SALARY DESC;

-- EMPLOYEE에서 이름(오름차순), 부서코드(오름차순), 직급코드(내림차순) 조회
SELECT EMP_NAME, DEPT_CODE, JOB_CODE FROM EMPLOYEE ORDER BY DEPT_CODE, JOB_CODE DESC, EMP_NAME;

/*
부서코드 1번 정렬
제일 먼저 부서코드가 오름차순으로 정렬
D1 D2 D3 ~ D9

그 다음, 동일한 부서코드 내에서 직급코드가 내림차순으로 정렬
D1(J7, J7 ~), ~ D5(J7, J5, ~) ~

동일한 부서코드와 직급코드 내에서 이름을 오름차순으로 정렬
D1,(J6(전지연, 차태연))

컬럼 위치랑 관계 없이 ORDER BY 작성 순서대로 정렬 진행
*/
-- 위의 ORDER BY 순으로 컬럼을 보길 원할 때
SELECT DEPT_CODE "부서코드", JOB_CODE "직급코드", EMP_NAME "이름" FROM EMPLOYEE ORDER BY 부서코드 ASC, 직급코드 DESC, 이름 ASC;


