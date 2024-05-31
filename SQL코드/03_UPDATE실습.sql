-- UPDATE 실습

-- D1 인사관리부 -> 인사팀
UPDATE department2 SET DEPT_TITLE = '인사팀' WHERE DEPT_ID = 'D1';
SELECT * FROM department2 WHERE DEPT_ID = 'D1';

-- D3 마케팅부 -> 마케팅팀
UPDATE department2 SET DEPT_TITLE = '마케팅팀' WHERE DEPT_ID = 'D3';
SELECT * FROM department2 WHERE DEPT_ID = 'D3';

-- D8 기술지원부 -> 기술지원팀
UPDATE department2 SET DEPT_TITLE = '기술지원팀' WHERE DEPT_ID = 'D8';
SELECT * FROM department2 WHERE DEPT_ID = 'D8';

COMMIT;

-- EMPLOYEE2 테이블에서 BONUS를 받지 않은 사원의 BONUS를 0.1로 변경
-- 변경 후 이름, 보너스 조회
UPDATE EMPLOYEE2 SET BONUS = '0.1' WHERE BONUS IS NULL;
SELECT EMP_NAME, BONUS FROM EMPLOYEE2;
ROLLBACK;

-- EMPLOYEE2 모든 직원의 기본 급여 인상
UPDATE EMPLOYEE2 SET SALARY = SALARY+1000000;
ROLLBACK;
SELECT SALARY FROM employee2;

-- EMPLOYEE2 D9 부서의 모든 직원의 보너스율 0.4로 수정
UPDATE EMPLOYEE2 SET BONUS = '0.4' WHERE DEPT_CODE = 'D9';
SELECT BONUS FROM employee2 WHERE DEPT_CODE = 'D9'; 

-- DEPT_CODE가 NULL인 직원은 D3 부서로 이동
UPDATE employee2 SET DEPT_CODE = 'D3' WHERE DEPT_CODE IS NULL;
SELECT * FROM employee2 WHERE DEPT_CODE = 'D3';

-- 2000년 1월 1일 이후 입사한 직원의 급여 수정
UPDATE employee2 SET SALARY = SALARY+1000000 WHERE hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');
SELECT SALARY FROM employee2 WHERE hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');
SELECT SALARY FROM employee WHERE hire_date > TO_DATE('2000-01-01', 'YYYY-MM-DD');

-- 입사일이 1997-09-12인 사람 퇴사 처리
UPDATE employee2 SET ENT_YN = 'Y' WHERE ENT_DATE > TO_DATE('1997-09-12', 'YYYY-MM-DD');
SELECT * FROM employee2 WHERE ENT_DATE > TO_DATE('1997-09-12', 'YYYY-MM-DD');

ROLLBACK;

-- 특정 도메인 주소 변경
UPDATE employee2 SET EMAIL = REPLACE(EMAIL, 'or.kr', 'kh.kh');
select emp_name, email from employee2;

-- 전화번호 010 뒤에 - 붙여서 변경
UPDATE employee2 SET PHONE = REPLACE(PHONE, '010', '010-') WHERE PHONE LIKE '010%';
SELECT EMP_NAME, PHONE FROM EMPLOYEE2;
-- LIKE -> 중간에 010이 있을 경우에도 바뀔 수 있기 때문에 무조건 맨 처음 자리만 바꿀 수 있게 설정
ROLLBACK;

-- 입사일 변경
UPDATE employee2 SET hire_date = TO_DATE('2000-01-02', 'YYYY-MM-DD') WHERE hire_date = TO_DATE('1999-09-09', 'YYYY-MM-DD');

COMMIT;

SELECT * FROM department2;
UPDATE department2 SET DEPT_TITLE = '인사팀';
SELECT *FROM department2;
ROLLBACK;

-- 한 번에 여러 컬럼 업데이트
-- 테이블 복사
CREATE TABLE EMPLOYEE3 AS SELECT * FROM EMPLOYEE;

-- EMP_ID가 200인 직원의 이메일, 전화번호 업데이트
UPDATE employee3 SET email = 'wqewt@naver.com', phone = '01012126434' where emp_id = 200;
select emp_id, email, phone from employee3 where emp_id = 200;
rollback;

-- d9 부서의 모든 직원 급여 *1.1, 보너스 =0.2 변경
update employee3 set salary = salary*1.1, bonus = 0.2 where dept_code = 'D9';
select emp_name, salary, bonus from employee3 where dept_code = 'D9';

-- j3 직무코드 직원의 직무코드(j5), 부서코드(d5) 변경
update employee3 set job_code = 'J5', dept_code = 'D5' where job_code = 'J3';
select emp_name, job_code, dept_code from employee3 where job_code = 'J5';

-- 송은희 직원의 이름(송은휘), 이메일(songsong@or.kr) 변경
update employee3 set emp_name = '송은휘', email = 'songsong@or.kr' where emp_name = '송은희';
select emp_name, email from employee3 where emp_name = '송은휘';

rollback;

-- 차태연 직원의 이름(차태형), 급여(8000000) 변경
UPDATE employee3 SET EMP_NAME = '차태형', SALARY = 8000000 WHERE EMP_NAME = '차태연';
SELECT EMP_NAME, SALARY FROM EMPLOYEE3 WHERE EMP_NAME = '차태형';

-- EMPLOYEE3의 모든 직원의 이메일 도메인과 부서코드(D4)변경
UPDATE employee3 SET EMAIL = REPLACE(EMAIL, 'or.kr', 'co.kr'), DEPT_CODE = 'D4';
SELECT EMP_NAME, EMAIL, DEPT_CODE FROM employee3;

ROLLBACK;

-- 테이블 삭제
delete from employee2;
commit;
-- 완전 삭제 -> commit
-- 되돌리기 -> rollback





