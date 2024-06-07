/*
SYSNONYM(동의어)
    - 테이블, 뷰, 시퀀스, 프로시저와 같은 데이터베이스 객체에 대한 별칭을 생성하는 데 사용(자바 캡슐화)
    
    - 종류
        * PUBLIC : 데이터베이스의 모든 사용자가 접근할 수 있는 고용 별칭
        생성
        CREATE PUBLIC SYNONIM 별칭명 FOR 객체명;
        삭제
        DROP PUBLIC SYSNONIM 별칭명;
        
        * PRIVATE : 특정 사용자만 접근할 수 있는 개인 별칭
        생성
        CREATE SYSNONYM 별칭명 FOR 객체명;
        삭제
        DROP SYNONYM 별칭명;
        
    
*/