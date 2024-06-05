/*
선택 함수
    - 여러가지 경우에 따라 알맞은 결과를 선택하는 함수
    - IF, SWITCH와 유사함
    
    DECODE(컬럼명 OR 계산식, 조건1, 결과1, 조건2, 결과2, ... [아무것도 만족하지 않음])
        컬럼명 OR 계산식의 값이 일치하는 조건이 있으면 해당 조건 오른쪽에 작성된 결과 반환
    
*/

-- 예제 1)
-- EMPLOYEE에서 모든 사원의 이름, 주민번호, 성별 조회
SELECT EMP_NAME, EMP_NO, 
DECODE(SUBSTR(EMP_NO,8,1), '1', '남자', '2', '여자', '기타') AS "성별"
FROM EMPLOYEE;
/*
선동일	621231-1985634	남자
송종기	631112-1548654	남자
*/

/*
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    ELSE 결과
END

DECADE : 계산식 OR 컬럼값이 딱 떨어지는 경우 사용 가능
CASE :

*/
-- 예제1
--EMPLOYEE에서 사번, 이름, 급여, 구분을 조회
-- 구분 : 받는 급여를 초급, 중급, 고급으로 나눠 조회
-- 500만 이상 고급, 300~ 500만 중급, 300만 미만 초급
SELECT EMP_ID, EMP_NAME, SALARY, 
    CASE                                    
        WHEN SALARY >= 5000000 THEN '고급'
        WHEN SALARY >= 3000000 THEN '중급'
        ELSE '초급'
    END
FROM EMPLOYEE;
/*
JAVA IF문 이라면
IF(SALARY >= 5000000){
    SYSTEM.OUT.PRINTLN("고급");
}
ELSE IF(SALARY >= 3000000){
    SYSTEM.OUT.PRINTLN("중급");
}
ELSE{
    SYSTEM.OUT.PRINTLN("초급");
}
*/






