create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(100)
);

create table car(
	car_id SERIAL primary key,
	make VARCHAR(50),
	color VARCHAR(20),
	model VARCHAR(30),
	year_ VARCHAR(4),
	status VARCHAR(10)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(100),
	city VARCHAR(50),
	zip_code VARCHAR(5),
	phone_number VARCHAR(10),
	car_id INTEGER,
	salesperson_id INTEGER,
	foreign key (car_id) references car (car_id),
	foreign key (salesperson_id) references salesperson (salesperson_id)
);

create table invoice(
	invoice_id SERIAL primary key,
	invoice_date DATE,
	customer_id INTEGER,
	salesperson_id INTEGER,
	foreign key (customer_id) references customer (customer_id),
	foreign key (salesperson_id) references salesperson (salesperson_id)
);
