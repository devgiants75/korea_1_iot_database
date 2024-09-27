### b_트리거02 ###

# 트리거 예제 #

use market_db;

# singer 테이블: member 테이블에서 데이터를 가져옴
create table singer (
	select 
		mem_id, mem_name, mem_number, addr 
    from 
		`member`
);

-- 백업 테이블
-- : 변동 사항을 기록할 테이블
create table backup_singer (
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    mem_number int not null,
    addr char(2) not null,
    
    modType char(2), -- 변경된 타입 (수정 | 삭제)
    modDate date, -- 변경된 날짜
    modUser varchar(30) -- 변경한 사용자
);



