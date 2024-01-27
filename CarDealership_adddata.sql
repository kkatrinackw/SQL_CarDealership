-- add data into car table
insert into car(car_id, make, color, model, year_, status)
values(1, 'Toyata', 'Red', 'Supra MA70', '1986', 'Used');

insert into car(car_id, make, color, model, year_, status)
values(2, 'Subaru', 'Black', 'Foester Premium', '2023', 'New');


-- add data into salesperson table
insert into salesperson(salesperson_id, first_name, last_name, phone_number)
values(1, 'Eva', 'Mills', 1233218794);

insert into salesperson(salesperson_id, first_name, last_name, phone_number)
values(2, 'Rafael', 'Sanders', 4564564567);


-- add data into customer table
insert into customer(customer_id, first_name, last_name, address, city, state, zip_code, phone_number, car_id, salesperson_id)
values(1, 'Victor', 'King', '8387 Robert St', 'Lady Lake' , 'FL', '32159', '1231231234',1,1);

insert into customer(customer_id, first_name, last_name, address, city, state, zip_code, phone_number, car_id, salesperson_id)
values(2, 'Kaylani', 'Watts', '679 Lew Lake', 'Floydmouth', 'MO', '23632', '3545817017',2,2);


-- add data into invoice table
insert into invoice(invoice_id, invoice_date, customer_id,salesperson_id)
values(1,NOW()::timestamp, 1, 1);

insert into invoice(invoice_id, invoice_date, customer_id,salesperson_id)
values(2, NOW()::timestamp,2, 2);


-- create a function to add data into invoice table
create or replace function add_new_invoice(
	_invoice_id INTEGER,
	_invoice_date TIMESTAMP without TIME zone, 
	_customer_id INTEGER,
	_salesperson_id INTEGER
)
returns void
as $$
begin 
	insert into invoice(invoice_id, invoice_date, customer_id, salesperson_id)
	values(_invoice_id, _invoice_date, _customer_id, _salesperson_id);
end;
$$
language plpgsql;

-- add data by using new function, add_new_function
select add_new_invoice(3,NOW()::timestamp,1,1);

select add_new_invoice(4,NOW()::timestamp,2,2 );

--checking
select * from invoice

