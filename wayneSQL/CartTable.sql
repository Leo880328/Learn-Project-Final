DROP TABLE  IF EXISTS Cart;
create table Cart(
	id int primary key identity(1,1),
	user_id int, 
	item_id int,
	itemName nvarchar(50) not null,
	count int,
	price Decimal(11,2) not null
	FOREIGN KEY (user_id ) REFERENCES member(user_id),
	--FOREIGN KEY (item_id ) REFERENCES course(course_id ) 
);


DROP TABLE  IF EXISTS Order_user;
create table Order_user(
	order_id nvarchar(50) primary key,
	user_id int, 
	date datetime not null,
	status int not null,
	totoalcount int,
	discount int ,
	totoalprice Decimal(11,2) not null
	FOREIGN KEY (user_id ) REFERENCES member(user_id),
	FOREIGN KEY (status) REFERENCES OrderStatus(id),
	FOREIGN KEY (discount) REFERENCES voucher(id)
);

ALTER TABLE Order_user ALTER COLUMN discount int;


alter table Order_user
add constraint discount
foreign key (discount) references voucher(id);



DROP TABLE  IF EXISTS OrderItem;
create table OrderItem(
	id int primary key identity(1,1),
	order_id nvarchar(50) ,
	item_id int,
	name nvarchar(50),
	count int,
	price Decimal(11,2) not null
	FOREIGN KEY (order_id ) REFERENCES Order_user(order_id),
	--FOREIGN KEY (item_id) REFERENCES course(course_id)
);

DROP TABLE  IF EXISTS OrderStatus;
create table OrderStatus(
	id int primary key identity(1,1),
	status nvarchar(50)
);
insert into OrderStatus values(N'未付款')
insert into OrderStatus values(N'已付款')
insert into OrderStatus values(N'待審核')
insert into OrderStatus values(N'完成訂單')
insert into OrderStatus values(N'已退款')
insert into OrderStatus values(N'已駁回')


DROP TABLE  IF EXISTS voucher;
create table voucher(
	id int primary key identity(1,1),
	number nvarchar(20) ,
	discount Decimal(3,2),
	status int
);

ALTER TABLE voucher
ALTER COLUMN number nvarchar(20)  COLLATE Chinese_PRC_CS_AS

ALTER TABLE voucher
ADD CONSTRAINT number UNIQUE(number) ;   

select * from voucher where status = 0;

DROP TABLE  IF EXISTS log;
create table log(
	logId nvarchar(200) primary key,
	userId int,
	type nvarchar(50) ,
	title nvarchar(50),
	remoteAddr nvarchar(50),
	requestUri nvarchar(1000),
	method nvarchar(50),
	params nvarchar(1000),
	exception nvarchar(50),
	operateDate datetime,
	timeout nvarchar(50),
	FOREIGN KEY (userId ) REFERENCES member(user_id)
);

select * from log order by operateDate desc;

truncate table Order_user;
truncate table Cart;
truncate table OrderItem;
truncate table voucher;
truncate table log;

select * from log order by operateDate desc;

select m.user_id , m.account, m.name , m.email,
o.order_id, o.date, o.status, o.totoalcount, o.discount, o.totoalprice 
from Order_user o join member m on  o.user_id = m.user_id　where o.user_id = 1;

select m.user_id , m.account, m.name , m.email,o.order_id, o.date, o.status, o.totoalcount, o.discount, o.totoalprice from Order_user o join member m on  o.user_id = m.user_id　
where m.account like '%%' or m.name like N'%%'　or o.order_id like ?;

select * from Order_user where user_id = 1 and status = 2