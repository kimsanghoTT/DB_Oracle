/*
LOWER / UPPER / INITCAP

    - 컬럼의 문자 또는 문자여을 소문자, 대문자, 첫 글자만 대문자로 변환해서 반환
*/
-- LOWER : 모두 소문자로 변환
SELECT LOWER('WELCOME TO MY WORLD') FROM DUAL;
-- 결과 : welcome to my world

-- UPPER
SELECT UPPER('welcome to my world') FROM DUAL;
-- 결과 : WELCOME TO MY WORLD

-- INICAP
SELECT INITCAP('welcome to my world') from dual;
-- 결과 : Welcome To My World

/*
문자 처리 함수 CONCAT
    - 컬럼의 문자 혹은 문자열을 두 개 전달받아 하나로 합친 후 반환
    - 작성법
        CONCAT(STRING, STRING)
*/
SELECT CONCAT('가나다라', 'ABCD') FROM DUAL;
SELECT '가나다라' || 'ABCD' FROM DUAL;

/*
함수 CONCAT과 연산자 || 차이점

CONCAT : 두 개의 문자열을 결합하고 두 개 이상은 불가능 -> 성+이름 붙일 때 사용
    CONCAT(STRING1, STRING2)
    
|| : 두 개 이상의 문자열을 결합할 때 사용
    STRING1 || STRING2 || STRING3 ||... 
*/





















