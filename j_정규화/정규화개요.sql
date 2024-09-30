# 정규화 #

drop database if exists `정규화`;
create database `정규화`;
use `정규화`;

# 정규화 개요
### 1. 정규화 개념
# : 테이블 간에 중복된 데이터를 허용하지 않는 것
# : 중복된 데이터를 허용하지 않음으로 무결성을 유지하는 방법

# cf) 데이터 중복
# : 동일한 정보가 여러 장소에 반복적으로 저장되는 현상
# 	EX) 학생 정보가 두 개 이상의 테이블에 저장 | 동일한 학생이 여러 행에 중복되는 경우

# cf) 이상 현상
# : 비정규화된 데이터베이스에서 발생할 수 있는 데이터의 무결성 문제
# > 삽입 이상, 갱신 이상, 삭제 이상

# 1) 삽입 이상: 새로운 데이터 삽입 시 비효율적이거나 불가능한 상황
# 2) 갱신 이상: 데이터의 일부를 수정할 때, 중복된 모든 데이터를 수정해야 하는 상황
# 3) 삭제 이상: 데이터 삭제 시, 그와 관련된 필요한 데이터까지 삭제되는 상황

### 2. 정규화 종류
# 정규형: 테이블이 정규화된 정도, normal form(nf)

# : 제1정규형(1nf), 제2정규형(2nf), 제3정규형(3nf), BCNF(Boyee-Codd 정규형) 등

create table `student_course` (
	student_id int,
    student_name varchar(50),
    course_id int,
    course_name varchar(50),
    professor_name varchar(50),
    # 복합 키: 두 개 이상의 컬럼을 PK키로 지정하는 제약조건
    # >> 지정된 여러 개의 컬럼이 결합되어 유일한 식별자로 존재
    # >> 해당 각각의 컬럼이 컬럼 내에서는 중복 가능하지만 둘을 합친 값은 테이블 내에서 고유
    #    : student_id와 course_id가 함께 기본 키 역할을 함.
    primary key(student_id, course_id)    
);

insert into `student_course`
values
	(1, '최소윤', 101, 'iot국비', '이승아'),
	(1, '최소윤', 105, '자바', '원신희'),
	(2, '최준혁', 105, '자바', '원신희'),
	(3, '정재원', 103, '파이썬', '윤준형');
	
# 이상 현상 예시
# 1) 삽입 이상
-- insert into `student_course` (course_id, course_name, professor_name)
-- values
-- 	(104, '앱개발', '김준일');

# 2) 갱신 이상
update `student_course`
set professor_name = '원신희강사님'
where
	professor_name = '원신희';
-- 오류 없이 수정이 이루어지지만 각 행에서 조건의 데이터를 찾아 일일이 변경을 해야하는 메모리 부담이 존재

select * from `student_course`;

# 3) 삭제 이상
delete from `student_course`
where
	student_id = 3;
-- '학생'에 대한 데이터가 존재하지 않을 경우 '강의'에 대한 정보도 사라짐

select * from `student_course`;












