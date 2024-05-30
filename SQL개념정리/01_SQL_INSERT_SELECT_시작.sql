/*
해당 값이 필수가 아니고 값을 넣고 싶지 않다면

INSERT에서 선택해서 넣을 수 있는 컬럼명을 지워준(또는 작성하지 않은) 후에,
VALUES 다음의 값을 넣는 공간에서도 값을 추가하지 않으면 됨

테이블을 만들 때 NULL 값이 들어갈 수 있도록 허용한 컬럼에서만 가능 -> '널이 아님'에 체크를 안한 컬럼만 가능

'널이 아님'에 체크를 해준 컬럼은 필수로 값을 넣어줘야함

EX)회원가입의 경우
아이디, 이름, 이메일, 번호, 주소 -> '널이 아님' 체크를 해서 주로 쓰이고
기념일 -> 별로 중요하지 않은 정보는 '널이 아님'에 체크하지 않음
*/



/* 공백이나 띄어쓰기 관계없이 원하는 SQL 구문만큼 실행해주면 됨 */

INSERT INTO kh_cafe (C_ID, c_name, c_address, c_phone, c_time)
VALUES (2, '빠나쁘레쏘', '서울시 강남구 역삼동', '02-5555-5555', '영업시간 : 12시 ~ 14시');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (3, '검포즈커피', '경기도 화남시 화남구', '031-3232-3333', '영업시간 : 평일 15시 ~ 18시');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (4, '활리스커피', '인천시 남동구 남동동', '032-8888-8888', '영업시간 : 평일 10시 ~ 17시');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_time)
VALUES (5, '커피빈', '서울시 역삼동', '영업시간 : 평일 10시 ~ 13시');

INSERT INTO kh_cafe (c_id, c_name, c_address,c_phone ,c_time)
VALUES (6, '스타벅스', '서울시 종로구 관철동','02-1111-2222' ,'영업시간 : 평일 8시 ~ 22시');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (7, '탐앤탐스', '서울시 동대문구 장안동','02-5555-6666' ,'영업시간 : 평일 10시 ~ 13시');

INSERT INTO kh_cafe (c_id, c_name, c_address, c_phone, c_time)
VALUES (8, '이디야커피', '서울시 송파구 잠실동','02-1234-6789' ,'영업시간 : 평일 9시 ~ 21시');

-- 저장된 내용 보기

SELECT * FROM KH_CAFE;

/*
SELECT : 저장된 데이터를 볼 때 사용
-> 로그인, 게시판 글 가져오기, 회원정보, 급여내역, 스터디 명단 블로그

사용 방법
SELECT 칼럼선택 FROM 테이블명;

모든 컬럼 보기
SELECT * FROM KH_CAFE;

특정 컬럼 보기
SELECT C_NAME FROM KH_CAFE;

특정 컬럼들 보기
SELECT C_NAME, C_ADDRESS FROM KH_CAFE;
*/

SELECT C_NAME FROM KH_CAFE;

SELECT C_NAME, C_ADDRESS FROM kh_cafe;

SELECT * FROM MEMBER;

SELECT M_NAME FROM MEMBER;

SELECT M_NAME, M_AGE FROM MEMBER;

SELECT M_NAME AS 멤버이름, M_PHONE AS 멤버번호 FROM MEMBER;
-- AS : ALIAS 별칭

SELECT C_NAME AS 카페이름, C_PHONE AS 카페번호 FROM kh_cafe;










