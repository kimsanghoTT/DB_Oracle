/*
함수
    - 컬럼 값이나 지정된 값을 읽어 연산한 결과를 반환하는 것
    - 단일 행 함수 : N개의 행의 컬럼 값을 전달하여 N개의 결과가 반환
    - 그룹 함수 : N개의 행의 컬럼 값을 전달하여 1개의 결과가 반환
                그룹의 수가 늘어나면 그룹의 수 만큼 결과를 반환
    
    - 함수는 SELECT절, WHERE절, ORDER BY절, GROUPT BY절, HAVING절에서 사용 가능
        1. SELECT절 : 찾는 기준이 아닌 표기되는 총합, 계산 결과 등에 대한 것을 정리해 놓은 컬럼
                        -> 정리해서 보여주기
        
        2. WHERE절 : 찾는 조건이 되는 행을 작성해줌. 길이, 크기, 결과가 조건에 부합하는 것만 볼 수 있도록 설정
                        -> 정리의 기준을 제시. 내가 원하는 것만 보기
*/
--단일 행 함수
/*****문자열 관련 함수*****/
-- LENGTH(문자열 OR 컬럼명) : 문자열의 길이 반환
SELECT 'HELLO WORLD',LENGTH('HELLO WORLD') FROM DUAL;

-- EMPLOYEE 테이블에서 사원명, 이메일, 이메일 길이 조회
-- 이메일 길이 오름차순 조회
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL) AS "이메일 길이" 
FROM EMPLOYEE 
WHERE LENGTH(EMAIL) <=12 
ORDER BY "이메일 길이";

-- INSTR(문자열 OR 컬럼명, '찾을 문자열', 찾는 것을 시작할 위치, 순번)
-- 찾을 시작 위치부터 지정된 순번에 따라 찾은 문자열의 시작 위치를 반환

-- LIKE와 INSTR 차이점
/*
LIKE : 특정 문자가 들어갔는지 검색

INSTR : 특정 문자가 몇 번째에 있는지 검색


*/
-- EX) 문자열에서 맨 앞에 있는 B의 위치 조회
SELECT 'AAB AAC AA BB AA', INSTR('AAB AAC AA BB AA', 'B') FROM DUAL; -- DUAL은 추상적 테이블로 값을 테스트할 때 사용
-- 문자열을 처음부터 스캔했을 때 'B'가 첫 번째로 나타나는 위치를 반환

-- 문자열 5번째 자리부터 검색해서 처음 찾은 'B'의 위치 조회
SELECT 'AAB AAC AA BB AA', INSTR('AAB AAC AA BB AA', 'B', 5) FROM DUAL;
-- 5번째 문자(AAB 'A'AC ...) 'A'에서 시작해 처음 나타나는 'B'위치를 더함
-- 5 + 7 = 12

-- 문자열에서 5번째 자리부터 검색해서 2번째로 찾은 'B'의 위치 조회
SELECT 'AAB AAC AA BB AA', INSTR('AAB AAC AA BB AA', 'B', 5, 2) FROM DUAL;
-- 5번째 문자(AAB 'A'AC ...) 'A'에서 시작해 두 번째로 나타나는 'B'위치를 더함
-- 5 + 8 = 13

-- SUBSTR(문자열 OR 컬럼명, 시작위치, 길이)
-- 문자열을 시작 위치부터 지정된 길이만큼 잘라내서 반환
-- 길이를 작성하지 않은 경우 시작 위치부터 끝까지 반환

-- 시작위치, 자를 길이 지정
SELECT SUBSTR('ABCDE', 2, 3) FROM DUAL;
--> 2번째 위치 'B'부터 3개를 가져옴 'BCD'

-- 시작 위치만 지정하고 자를 길이는 미지정
SELECT SUBSTR('ABCDE', 2) FROM DUAL;
--> 2번째 위치 'B'부터 마지막까지 가져옴 'BCDE'

-- EMPLOYEE 테이블에서 사원명, 이메일에서 @ 앞에 있는 아이디만 가져오고 오름차순 조회
SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) AS "이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";
-- INSTR(EMAIL, '@')에서 '@' 위치를 받고, '-1'을 통해 '@'바로 앞 자리 까지 지정
--> 되도록 외우기

-- SUBSTR(EMAIL, 1)을 작성하게 되면 나타나는 결과
SELECT EMP_NAME, SUBSTR(EMAIL, 1) AS "이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";
--> 이메일이 전체 출력 됨

-- 전화번호의 마지막 4자리(AS 마지막_네_자리)
SELECT SUBSTR(PHONE, -4) AS "마지막_네_자리" FROM EMPLOYEE WHERE PHONE IS NOT NULL;
--> 앞에서 부터 시작점을 정할 때는 양수, 뒤에서부터 시작점을 정할 때는 음수를 작성


/******그룹 관련 함수*****/
/*
 COUNT : 행의 총 개수를 셀 때 사용하는 함수
 COUNT(*) : 조회된 모든 행의 개수 반환
 COUNT(컬럼명) : 지정된 컬럼에서 값이 NULL이 아닌 행의 개수 반환(NULL은 제외한 개수를 작성)
 COUNT(DISTINCT 컬럼명) : 지정된 컬럼에서 중복 값을 제외한 행의 반환

*/
--EMPLOYEE 테이블 전체 행의 개수
SELECT COUNT(*) FROM EMPLOYEE;

-- 전화번호가 있는 사원의 수
SELECT COUNT(*) FROM EMPLOYEE WHERE PHONE IS NOT NULL;
SELECT COUNT(PHONE) FROM EMPLOYEE;

-- AVG : 평균
-- 모든 사원의 평균 급여 조회
SELECT AVG(SALARY) FROM EMPLOYEE;
-- 1. 올림 CEIL
SELECT CEIL(AVG(SALARY)) FROM EMPLOYEE;
-- 2. 내림 FLOOR
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE;
-- 3. 반올림 ROUND
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;
-- 4. 버림 TRUNC
SELECT TRUNC(AVG(SALARY)) FROM EMPLOYEE;
-- FLOOR, TRUNC 차이
-- FLOOR : 주어진 숫자보다 작거나 가장 큰 정수를 반환. 소수 부분은 무조건 버림
SELECT FLOOR(5.7) FROM DUAL; -- 결과 5
SELECT FLOOR(-5.7) FROM DUAL; -- 결과 -6
SELECT FLOOR(5.6789,1) FROM DUAL; -- 에러. 소수 표현을 못함

-- TRUNC : 숫자의 소수점만 잘라내는 역할을 함. 자르고자 하는 자릿수를 지정할 수 있음. 기본값은 소수자리0
SELECT TRUNC(5.7) FROM DUAL; -- 결과 5
SELECT TRUNC(-5.7) FROM DUAL; -- 결과 -5
SELECT TRUNC(5.6789,1) FROM DUAL; -- 결과 5.6
SELECT TRUNC(5.6789,2) FROM DUAL; -- 결과 5.67

/***** 공백 관련 함수 *****/
-- TRIM([옵션] [문자열 OR 컬럼명] FROM [문자열 OR 컬럼명])
--  문자열의 앞쪽 OR 뒤쪽 OR 양쪽에 존재하는 지정된 문자열 제거

-- 옵션 : 앞쪽(LEADING), 뒤쪽(TRAILING), 양쪽(BOTH) -> 기본값

-- 앞쪽 공백 제거
SELECT '         점            심        ', 
TRIM(LEADING '  ' FROM '         점            심        ') FROM DUAL;
/*
ORA-30001: trim set should have only one character
30001. 00000 -  "trim set should have only one character"
*Cause:    Trim set contains more or less than 1 character. This is not
           allowed in TRIM function.

-> TRIM의 경우 문자 1개만 가능. '' 안에 스페이스바가 2번 들어가면 에러가 발생
*/
-- 뒤쪽 공백 제거, 육안상 공백 제거가 안 보일 수 있음
SELECT '         점            심        ', 
TRIM(TRAILING ' ' FROM '         점            심        ') FROM DUAL;

-- 양쪽 공백 제거
SELECT '         점            심        ', 
TRIM(BOTH ' ' FROM '         점            심        ') FROM DUAL;

-- 앞쪽, 뒤쪽, 양쪽 공백제거 한 번에 사용하기
SELECT '         점            심        ', 
TRIM(LEADING ' ' FROM '         점            심        '),
TRIM(TRAILING ' ' FROM '         점            심        '),
TRIM(BOTH ' ' FROM '         점            심        ')
FROM DUAL;

-- REPLACE : 특정 문자열을 대체할 때 사용
-- REPLACE(문자열 OR 컬럼명, 찾을 문자열, 바꿀 문자열)

-- NATIONAL 테이블에서 한국으로 적혀있는 글자를 대한민국으로 변경하기
SELECT * FROM national;
SELECT NATIONAL_CODE, REPLACE(NATIONAL_NAME, '한국', '대한민국') FROM NATIONAL;

-- TO_NUMBER
/*
ORACLE SQL에만 존재
문자열을 숫자 데이터 형식으로 변환하는 데 사용
추후 JAVA INT 값이 아니라 STRING 값으로 넘어오고 변환이 필요할 때 TO_NUMBER 사용할 일이 있을 수 있음
*/
-- 문자열을 숫자로 변환하는 코드
SELECT TO_NUMBER('12345') FROM DUAL;
















































