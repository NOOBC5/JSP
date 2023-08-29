create table tbl_player_info(
registration_code char(4) not null primary key,
name varchar2(18),
birth_day varchar2(8),
height number(3),
weight number(3)
);

create table tbl_hitter_info(
registration_code char(4) not null primary key,
game_numbers number(3),
appearance number(3),
hit_numbers number(3),
home_runs number(3),
put_out number(3),
double_play number(3),
error_count number(3)
);

insert into tbl_player_info values('A001', '김길동', '19900101', '180', '82');
insert into tbl_player_info values('A005', '이길동', '20000101', '190', '85');
insert into tbl_player_info values('B002', '홍길동', '19950101', '175', '75');
insert into tbl_player_info values('B006', '조길동', '19950101', '185', '80');

insert into tbl_hitter_info values('A001', '120', '330', '100', '20', '80', '27', '1');
insert into tbl_hitter_info values('A005', '110', '300', '110', '30', '60', '5', '2');
insert into tbl_hitter_info values('A002', '100', '270', '90', '5', '100', '10', '3');

select p.registration_code, p.name, h.game_numbers, h.appearance, h.hit_numbers, h.home_runs, round(((((h.hit_numbers + h.home_runs) / h.appearance) * 100) + home_runs), 2), h.put_out, h.double_play, h.error_count, h.put_out + (h.double_play * 2) - (h.error_count * 5) from tbl_player_info p, tbl_hitter_info h where p.registration_code = h.registration_code;

선수등록코드 선수명 생년월일 키 몸무게 소속 선수 등급

select h.registration_code, p.name, substr(p.birth_day, 1, 4), substr(p.birth_day, 5, 2), substr(p.birth_day, 7, 2), p.height, p.weight, substr(h.registration_code, 1, 1), round((((((h.hit_numbers + h.home_runs) / h.appearance) * 100) + h.home_runs) + (h.put_out + (h.double_play * 2) - (h.error_count * 5))) / 2, 0), rank() over(order by ((((h.appearance + h.home_runs) / h.hit_numbers) * 100) + h.home_runs) + (h.put_out + (h.double_play * 2) - (h.error_count * 5)) desc) from tbl_player_info p, tbl_hitter_info h where p.registration_code = h.registration_code;


select
rank() over(order by (((((h.hit_numbers + h.home_runs) / h.appearance) * 100) + h.home_runs) + (h.put_out + (h.double_play * 2) - (h.error_count * 5))) asc)
from tbl_player_info p, tbl_hitter_info h 
where p.registration_code = h.registration_code;