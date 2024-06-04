-- 춘 대학교
-- 춘 기술대학교 학과 이름, 계열 조회
-- 컬럼명 학과명, 계열로 표시
SELECT DEPARTMENT_NAME "학과명", CATEGORY "계열" FROM tb_department;

-- 학과의 학과 정원 조회
SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' FROM tb_department;

-- 국문학과에 다니는 여학생 중에 현재 휴학중인 여학생 조회
SELECT * FROM tb_student WHERE DEPARTMENT_NO = '001' AND SUBSTR(STUDENT_SSN, 8, 1) = '2' AND absence_yn ='Y';

-- 도서관에서 대출 도서 장기 연체자들의 학번을 바탕으로 대상자들을 찾는 쿼리 작성
SELECT STUDENT_NAME FROM TB_STUDENT WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513119');

-- 입학 정원이 20명이상 30명 이하인 학과들의 이름과 계열 조회
SELECT DEPARTMENT_NAME, CATEGORY FROM tb_department WHERE CAPACITY BETWEEN '20' AND '30';

-- 소속학과가 없는 총장의 이름을 알아내기
SELECT PROFESSOR_NAME FROM tb_professor WHERE department_no IS NULL;

-- 선수과목이 존재하는 과목들이 어떤 과목인지 과목번호 조회
SELECT CLASS_NO, CLASS_NAME FROM TB_CLASS WHERE preattending_class_no IS NOT NULL;

-- 어떤 카테고리들이 있는지 조회
SELECT DISTINCT CATEGORY FROM tb_department;

-- 영문학과 학생들의 학번, 이름, 입학년도를 년도가 빠른 순으로 표시
SELECT STUDENT_NO "학번", STUDENT_NAME "이름", TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') "입학년도" FROM TB_STUDENT 
WHERE DEPARTMENT_NO = '002' ORDER BY ENTRANCE_DATE ASC;

-- 이름이 세 글자가 아닌 교수들의 이름과 주민번호 조회
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor WHERE LENGTH(professor_name) != 3;
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor WHERE professor_name NOT LIKE '___';

-- 2000년 이후 입학생들의 학번은 앞에 A가 붙음. 그 이전에 입학한 학생들의 학번, 이름 조회
SELECT STUDENT_NO, STUDENT_NAME FROM tb_student WHERE STUDENT_NO NOT LIKE 'A%';

-- 학번이 A517178인 학생의 학점 총 평점 구하기
-- 평점 점수 반올림
SELECT STUDENT_NO, ROUND(AVG(POINT),1) "평점" FROM TB_GRADE WHERE STUDENT_NO = 'A517178' group by STUDENT_NO;
-- 소수점 자리수 표기
-- 소수점 1자리만 표기 ROUND(AVG(POINT),1)

-- 지도교수를 배정받지 못한 학생의 수 조회
SELECT COUNT(*) FROM TB_STUDENT WHERE coach_professor_no IS NULL;

-- 학번이 A112113인 김고은 학생의 년도별 평점
-- AS 년도, AS 년도 별 평점
-- 소수점 한 자리까지 반올림
SELECT SUBSTR(TERM_NO, 1, 4) "년도",ROUND(AVG(POINT),1) "년도별 평점" FROM TB_GRADE WHERE STUDENT_NO = 'A112113' 
GROUP BY SUBSTR(TERM_NO, 1, 4) ORDER BY SUBSTR(TERM_NO, 1, 4);

-- 동명이인 학생들의 이름, 수 조회
SELECT STUDENT_NAME "동일이름", COUNT(*) "동명인 수" FROM TB_STUDENT GROUP BY STUDENT_NAME HAVING COUNT(*)>1;


