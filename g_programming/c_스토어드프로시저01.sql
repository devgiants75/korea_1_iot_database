### SQL 프로그래밍 ###

# 1. 스토어드 프로시저
# : MySQL에서 프로그래밍 기능이 필요로 할 때 사용하는 데이터베이스 개체

# 2. 스토어드 프로시저의 구조

-- 구분 문자: delimiter
# : 스토어드 프로시저의 코딩 부분을 일반 SQL문 종료와 구분하기 위해 
# : , 스토어드 프로시저의 구분 문자를 변경

-- 구분 문자 변경의 형태(권장)
# delimiter $$ -- 구분 문자 병경
# delimiter ;  -- 구분 문자 초기화

-- 스토어드 프로시저의 기본 형태
/*
	delimiter $$
    
    create procedure `스토어드 프로시저 절차명`
    begin
		SQL 프로그래밍 코딩
	end $$
    
    delimiter ; 
    
    call `스토어드 프로시저 절차명`;
*/

### SQL의 프로그래밍 종류 ###
# 1. if문
/*
	기본 형식
    if 조건식 then
		sql문장들...;
	end if;
*/

delimiter $$

create procedure if1()
begin
	if 100 = 100 then
		select '100은 100과 같습니다.';
	end if;
end $$

delimiter ;

call if1();
    
# if-else문
	
delimiter $$
create procedure if2()
begin
	# 프로시저의 변수 선언(declare)
    declare myNum int;
    set myNum = 200;
    if myNum = 100 then
		select '100입니다.';
	else
		select '100이 아닙니다.';
	end if;
end $$
delimiter ;
call if2();





