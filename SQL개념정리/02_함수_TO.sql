/*
형변환 TO_CHAR
EXTRACT : 날짜 뽑기
숫자 관련 함수 : CEIL, ROUND, FLOOR, TRUNC, ABS, MOD

IF CASE

CREATE
ALTER
*/

/*
형변환(PARSING) 함수
    - 문자열(CHAR, VARCHAR2) <-> 숫자(NUMBER)
    - 문자열(CHAR, VARCHAR2) <-> 날짜(DATE)
    - 숫자(NUMBER) <-> 날짜(DATE)
    
    TO_CHAR(날짜 OR 숫자 OR 포맷) : 문자열로 변환
    
    숫자 -> 문자열
        - 포맷
        - 9 : 숫자 한 칸 의미. 오른쪽 정렬
        - 0 : 숫자 한 칸 의미. 오른쪽 정렬, 빈 칸에 0을 추가
        - L : 현재 시스템이나 DB에 설정된 나라의 화폐 기호
        - , : 숫자의 자릿수 구분
*/
SELECT 1234, TO_CHAR(1234) FROM DUAL; -- 숫자를 문자열로 변경

SELECT 1234, TO_CHAR(1234, '9999999') FROM DUAL; -- 1234 앞에 공백 4칸 생성
-- 9를 사용하지 않으면 왼쪽 정렬이 기본. -> 9의 반대는 아예 작성하지 않는 것

SELECT 1234, TO_CHAR(1234, '0000000') FROM DUAL; -- 0001234 앞에 0이 4칸 생성

-- 숫자 -> 문자열 변환시 주의사항
-- 지정된 칸 수가 숫자 값보다 적다면 전부 #으로 변환돼서 출력
SELECT 1234, TO_CHAR(1234, '000') FROM DUAL; 
SELECT 1234, TO_CHAR(1234, '999') FROM DUAL; -- 지정된 자리값보다 변환해야하는 값의 길이가 더 크기때문에 ### 출력

-- 화폐 기호 + 자릿수 구분
SELECT TO_CHAR(123456789, 'L999999999'),
       TO_CHAR(123456789, '$999999999'),
       TO_CHAR(123456789, '$999,999,999') FROM DUAL;
       -- L의 경우 현재 시스템에서 사용하는 화폐 단위 기호 (한국 = ￦)
       
-- 모든 사원의 연봉 조회
SELECT TO_CHAR(SALARY*12, 'L99,999,999') "연봉" FROM EMPLOYEE;
       
-- 현재 날짜 YYYY-MM-DD
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 현재날짜 YYYY-MM-DD 요일
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;

-- 현재날짜 YYYY-MM-DD (요일)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY)') FROM DUAL;

-- 현재날짜 YYYY-MM-DD (요일) 오전 시 분 초
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY) AM HH:MI:SS') FROM DUAL;

-- 현재날짜 YYYY년 MM월 DD일 오전 00시 00분 00초
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" AM HH"시" MI"분" SS"초"') FROM DUAL;

/*
TO_DATE(문자열 OR 숫자 OR 포맷)
    - 문자열 또는 숫자를 날짜 형식으로 변환
*/
-- DUAL 가상 테이블 문자열이 날짜를 표현하는 형식이면 형식 지정없이 바로 변경 가능
SELECT TO_DATE ('2024-05-05') FROM DUAL;

-- 날짜 - 월 - 년 표기
SELECT TO_DATE ('06-05-2024', 'DD-MM-YYYY') FROM DUAL;
-- TO_DATE 형식으로 년/월/일로 변경. 06-05-2024 -> 24/05/06

SELECT TO_DATE('05월 27일 월요일 12시 50분', 'MM"월" DD"일" DAY HH"시" MI"분"') FROM DUAL;
-- TO_DATE 형식 (년/월/일)로 변경


SELECT TO_DATE(20240605, 'YYYYMMDD') FROM DUAL;
-- 20240605 -> 24/06/05

-- RR / YY 차이점
/*
년도가 두 자리만 작성이 되어있는 경우 
50 이상 = Y : 현재 세기(2000년대 기준) R : 이전 세기(1900년대 기준) 
50 미만 = Y, R 모두 누락된 연도 앞부분에 2000년대 세기를 추가
*/
-- 연도가 앞 두자리 누락, 50년대 기준
--1) 50년대 미만 확인
SELECT 
TO_DATE('49-12-01', 'YY-MM-DD') AS "YY",
TO_DATE('49-12-01', 'RR-MM-DD') AS "RR" FROM DUAL;
-- 둘 다 2049년

--2) 50년대 이상 확인
SELECT 
TO_DATE('50-12-01', 'YY-MM-DD') AS "YY",  -- 2050년
TO_DATE('50-12-01', 'RR-MM-DD') AS "RR"  -- 1950년
FROM DUAL;














