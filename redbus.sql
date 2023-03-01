create database redbus;

use redbus;


create table bus_type(bus_type_name varchar(30),
	bus_type_id int primary key auto_increment);

create table fares(fares_id int primary key auto_increment,
	start_loc varchar(30),
	end_loc varchar(30),
	bus_type_id int,
	fare_price int,
	foreign key(bus_type_id) references bus_type(bus_type_id),
	constraint unique_fair unique key(start_loc,end_loc,bus_type_id));
	
insert into bus_type values("mini bus",1),("volvo bus",2),("AC bus",3),("Non AC",4),("tempo traveller",5);

insert into fares values(1,"hyderabad","warangal",1,600),(2,"hyderabad","banglore",2,700),(3,"hyderabad","bidar",2,550),(4,"hyderabad","gulbargah",2,620);


create table bus(bus_id int primary key auto_increment,
	bus_plate_number int unique key not null,
	bus_type_id int not null,
	bus_capacity int,
	foreign key(bus_type_id) references bus_type(bus_type_id));

create table driver(driver_id int primary key auto_increment,
	driver_name varchar(30) not null,
	driver_contact bigint not null,
	salary float);

create table travel_schedule(schedule_id int primary key auto_increment,
	bus_id int not null,
	driver_id int not null,
	start_loc varchar(20) not null,
	end_loc varchar(20) not null,
	date_of_schedule date not null,
	start_time time not null,
	reach_time time,
	remarks varchar(20),
	foreign key(bus_id) references bus(bus_id),
	foreign key(driver_id) references driver(driver_id));

create table user_details(user_id int primary key auto_increment,
	name varchar(30) not null,
	email_id varchar(30) not null,
	contact_no bigint not null,
	user_name varchar(30) not null,
	user_password varchar(30) not null);

create table booking(booking_id int primary key auto_increment,
	user_id int not null,
	schedule_id int not null,
	no_of_persons int not null,
	fare_id int unique key,
	total_fare int not null,
	date_of_booking date not null,
	payment_status int not null,
	feedback varchar(30),
	selected_seats varchar(30),
	foreign key(user_id) references user_details(user_id),
	foreign key(schedule_id) references travel_schedule(schedule_id),
	foreign key(fare_id) references fares(fares_id),
	foreign key(payment_status) references payment(payment_status));


insert into booking values(1,1,1,3,1,1620,"2023-10-11","will give later","2,3,5"),
(2,2,2,1,2,1140,"2023-10-19","good","1");

create table payment(payment_status int primary key auto_increment,
	status varchar(20));

insert into payment values(1,"done"),(0,"pending");


create table rating(rating_id int primary key,
	rating varchar(20) not null);


insert into rating values(1,"terrible"),
	(2,"bad"),
	(3,"average"),
	(4,"good"),
	(5,"excellent");

create table feedback(feedback_id int primary key auto_increment,
	user_id int not null,
	rating_id int not null,
	comment varchar(30) not null,
	foreign key(user_id) references user_details(user_id),
	foreign key(rating_id) references rating(rating_id));


insert into bus values(1,7258,1,10),
	(2,5678,2,40),
	(3,9879,3,30),
	(4,1425,4,50),
	(5,9808,5,12);

insert into driver values(1,"anthony",9809124351,10000),
	(2,"raju",8795230165,15000),
	(3,"kiran",6390821489,null),
	(4,"joseph",6290765018,null),
	(5,"kumar",9796572901,20000);
	
insert into user_details values(1,"jack","jack@gmail.com",140288191029,"jack","Jack@123"),
	(2,"james","james@gmail.com",140821391029,"james","James@123"),
	(3,"ethan","ethan@gmail.com",140250819219,"ethan","Ethan@123"),
	(4,"noah","noah@gmail.com",14256212029,"noah","Noah@123");

insert into travel_schedule values(1,1,2,"hyderabad","warangal","2021-10-11","2021-10-11 00:00:01","2021-10-12 01:00:10","need bf"),
	(2,3,1,"delhi","hyderabad","2021-11-13","2021-11-13 12:00:01","2021-11-16 01:00:19","need bf");

insert into feedback values(1,1,5,"good"),(2,2,3,"needs improvement");

