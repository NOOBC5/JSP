create table tbl_patient_202004(
	p_no char(4) not null primary key,
	p_name varchar2(20),
	p_birth char(8),
	p_gender char(1),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4),
	p_city char(2)
);

insert into tbl_patient_202004 values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into tbl_patient_202004 values('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
insert into tbl_patient_202004 values('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
insert into tbl_patient_202004 values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into tbl_patient_202004 values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into tbl_patient_202004 values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into tbl_patient_202004 values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');

create table tbl_lab_test_202004(
	t_code char(4) not null primary key,
	t_name varchar2(20)
);

insert into tbl_lab_test_202004 values('T001', '결핵');
insert into tbl_lab_test_202004 values('T002', '장티푸스');
insert into tbl_lab_test_202004 values('T003', '수두');
insert into tbl_lab_test_202004 values('T004', '홍역');
insert into tbl_lab_test_202004 values('T005', '콜레라');

create table tbl_result_202004(
	p_no char(4) not null,
	t_code char(4) not null,
	t_sdate date not null,
	t_status char(4),
	t_ldate date,
	t_result char(4),
	constraint tbl_result_202004 primary key (p_no, t_code, t_sdate)
);

insert into tbl_result_202004 values('1001', 'T001', '20200101', '1', '20200102', 'X');
insert into tbl_result_202004 values('1002', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_202004 values('1003', 'T003', '20200101', '2', '20200102', 'N');
insert into tbl_result_202004 values('1004', 'T004', '20200101', '2', '20200102', 'P');
insert into tbl_result_202004 values('1005', 'T005', '20200101', '2', '20200102', 'P');
insert into tbl_result_202004 values('1006', 'T001', '20200101', '2', '20200102', 'N');
insert into tbl_result_202004 values('1007', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_202004 values('1005', 'T003', '20200101', '2', '20200102', 'P');
insert into tbl_result_202004 values('1006', 'T004', '20200101', '2', '20200102', 'X');
insert into tbl_result_202004 values('1007', 'T005', '20200101', '2', '20200102', 'X');


select re.p_no, pa.p_name, la.t_name, re.t_sdate, re.t_status, re.t_ldate, re.t_result from tbl_patient_202004 pa, tbl_result_202004 re, tbl_lab_test_202004 la where pa.p_no =  re.p_no and la.t_code = re.t_code;

select pa.p_city, count(pa.p_city) from tbl_patient_202004 pa group by pa.p_city order by pa.p_city asc;