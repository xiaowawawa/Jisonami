# 建表操作
create table t_user(
	id varchar(50) primary key,
	name varchar(20) not null,
	password varchar(20) not null
);
create table t_blog(
	id varchar(50) primary key,
	title varchar(20) not null,
	content clob not null,
	author varchar(20) not null,
	blogType varchar(20),
	publishTime date,
	editTime date
);

# 删表
# drop table t_user;
# drop table t_blog;