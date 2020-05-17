create table ex_memberinfo(
  id varchar2(20) primary key,
  passwd varchar2(20) not null,
  name varchar2(20) not null,
  email varchar2(50) not null,
  nickname varchar2(30) not null,
  reg_date date not null
);