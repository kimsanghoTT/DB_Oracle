/*
kh_workbook에 만들 테이블 생성
*/

create table company(
    company_id number primary key,
    company_name varchar2(100) not null,
    company_address varchar2(55),
    company_phone varchar2(20)
);
-- 테이블 이름 변경
alter table company rename to compony;
alter table compony rename to company;

-- 시퀀스 생성
-- 방법1
create SEQUENCE company_seq
start with 1
increment by 1
nocache
nocycle
;
-- 방법2
create sequence company_sqe;
-- 위 설정값들은 모두 기본값이기 떄문에 생략 가능

-- 값 추가
insert into company values (company_seq.nextval, '햇에제과', '서울시 강남구', '02-1234-5678');
insert into company values (company_seq.nextval, '롯데제과', '서울시 중구', '02-2345-6789');
insert into company values (company_seq.nextval, '올이온', '서울시 용산구', '02-3456-7890');

create table SANCKS(
    snack_id number(10,0) primary key,
    snack_name varchar2(100) not null,
    price number(10,2) not null,
    company_id,
    constraint company FOREIGN key (company_id)
    references company(company_id) on delete cascade
);
ALTER TABLE SANCKS RENAME TO SNACKS;
-- 시퀀스 생성
CREATE SEQUENCE SNACK_SEQ;
/*
CREATE SEQUENCE SNNCK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
;
*/

INSERT INTO SNACKS VALUES (snack_seq.nextval, '오에스', 1500, 1);
INSERT INTO SNACKS VALUES (snack_seq.nextval, '칸조', 1220, 1);
INSERT INTO SNACKS VALUES (snack_seq.nextval, '배배로', 1100, 2);
INSERT INTO SNACKS VALUES (snack_seq.nextval, '조고파이', 2000, 2);

SELECT * FROM SNACKS;

-- 가격 1500 이상인 과자 조회
SELECT SNACK_NAME FROM SNACKS WHERE PRICE >= 1500;

-- 서울시 강남구에 위치한 회사 조회
SELECT COMPANY_NAME FROM COMPANY WHERE COMPANY_ADDRESS = '서울시 강남구';

-- 회사ID가 1인 과자 조회
SELECT SNACK_NAME FROM SNACKS WHERE COMPANY_ID = '1';

-- 회사 ID가 1이고 그 회사의 과자를 조회
SELECT C.COMPANY_NAME, S.SNACK_NAME, S.PRICE FROM SNACKS S, COMPANY C 
WHERE S.COMPANY_ID = C.COMPANY_ID AND C.COMPANY_ID = '1';

SELECT COMPANY_NAME, SNACK_NAME, PRICE FROM COMPANY JOIN SNACKS USING(COMPANY_ID) WHERE COMPANY_ID ='1';












