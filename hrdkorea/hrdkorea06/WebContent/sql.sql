create table tbl_artist_201905(
artist_id char(4) not null primary key,
artist_name varchar2(20),
artist_birth char(8),
artist_gender char(1),
talent char(1),
agency varchar(30)
);

drop table tbl_artist_201905;

create table tbl_mento_201905(
	mento_id char(4) not null primary key,
	mento_name varchar2(20)
);

create table tbl_point_201905(
serial_no number(8) not null primary key,
artist_id char(4),
mento_id char(4),
point number(3)
);

insert into tbl_artist_201905 values('A001', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist_201905 values('A002', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist_201905 values('A003', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist_201905 values('A004', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist_201905 values('A005', '홍스타', '20010501', 'F', '2', 'F엔터테이먼트');

insert into tbl_mento_201905 values('J001', '함멘토');
insert into tbl_mento_201905 values('J002', '박멘토');
insert into tbl_mento_201905 values('J003', '장멘토');

insert into tbl_point_201905 values('201901', 'A001', 'J001', '78');
insert into tbl_point_201905 values('201902', 'A001', 'J002', '76');
insert into tbl_point_201905 values('201903', 'A001', 'J003', '70');
insert into tbl_point_201905 values('201904', 'A002', 'J001', '80');
insert into tbl_point_201905 values('201905', 'A002', 'J002', '72');
insert into tbl_point_201905 values('201906', 'A002', 'J003', '78');
insert into tbl_point_201905 values('201907', 'A003', 'J001', '90');
insert into tbl_point_201905 values('201908', 'A003', 'J002', '92');
insert into tbl_point_201905 values('201909', 'A003', 'J003', '88');
insert into tbl_point_201905 values('201910', 'A004', 'J001', '96');
insert into tbl_point_201905 values('201911', 'A004', 'J002', '90');
insert into tbl_point_201905 values('201912', 'A004', 'J003', '98');
insert into tbl_point_201905 values('201913', 'A005', 'J001', '88');
insert into tbl_point_201905 values('201914', 'A005', 'J002', '86');
insert into tbl_point_201905 values('201915', 'A005', 'J003', '86');

select artist_id, artist_name, substr(artist_birth, 1, 4), substr(artist_birth, 5, 2), substr(artist_birth, 7, 2), artist_gender, talent, agency from tbl_artist_201905;

select p.serial_no, p.artist_id, a.artist_name,substr(artist_birth, 1, 4), substr(artist_birth, 5, 2), substr(artist_birth, 7, 2), p.point, m.mento_name from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p where a.artist_id = p.artist_id and m.mento_id = p.mento_id order by p.serial_no asc;

select p.serial_no
from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p 
where a.artist_id = p.artist_id and m.mento_id = p.mento_id;

select a.artist_id, a.artist_name, sum(p.point), round(sum(p.point) / 3,2), rank() over (order by round(sum(p.point) / 3,2) desc) from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p where a.artist_id = p.artist_id and m.mento_id = p.mento_id group by a.artist_id, a.artist_name;