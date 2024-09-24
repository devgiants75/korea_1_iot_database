### b_제약조건 ###

### 제약조건(Constraint) ###
# 1. 제약조건의 개념
# : 데이터의 정확성, 일관성, 신뢰성, 무결성을 유지하기 위해 DB 시스템에 의해 강제되는 규칙

# 2. 제약조건 사용 목적
# : 데이터 무결성 보장
# : 오류 방지
# : 관계 유지 - 테이블 간에 정의된 관계가 지속적으로 유지
# : 응용 프로그램 수준에서의 복잡성 감소

# 3. 제약조건의 종류
# 1) Primary Key (기본 키)
# 2) Foriegn Key (외래 키)
# 3) UNIQUE (유니크)
# 4) CHECK (체크)
# 5) NOT NULL (널 아님)
# 6) DEFAULT (기본값)

/*
	1. PK, Primary Key (기본 키)
    : 테이블의 각 행을 고유하게 식별하는 열
    : 테이블의 레코드(행)를 고유하게 구분할 수 있는 식별자 역할

	- 고유성: 중복 될 수 X
    - Not Null: null 값이 될 수 X, 반드시 유효한 데이터를 포함
    - 유일성 제약
		: 하나의 테이블 당 하나의 기본 키만 지정 가능
        >> 테이블의 특성을 가장 잘 반영한 열 선택을 권장
        EX) members - member_id
			posts - post_id
            books - isbn
*/

# drop database example;
create database `example`;

use `example`;

# 기본 키 지정 방법
# 테이블 생성 시 
# 1) 컬럼명 데이터타입 Primary Key(제약조건)
create table `Students` (
	student_id int primary key,
    name varchar(100),
    major varchar(100)
);

# 2) 제일 마지막 부분에 제약 조건 작성
-- create table `Students` (
-- 	   student_id int,
--     name varchar(100),
--     major varchar(100),
--     # 제약 조건 (설정할 컬럼명)
--     primary key (student_id)
-- );

desc `Students`;

insert into `Students`
value 
	(1, '이승아', 'A전공'),
	(2, '이도경', 'A전공'),
	(3, '이승아', 'B전공');

-- insert into `Students`
-- value (1, '김다혜', 'C전공'); # Error(기본 키 충돌)

# 제약조건에 대한 수정 (alter)
# 1) 제약조건 삭제
alter table `Students`
drop primary key;

desc `Students`;

# 2) 제약조건 추가
alter table `Students`
add primary key (student_id);

desc `Students`;