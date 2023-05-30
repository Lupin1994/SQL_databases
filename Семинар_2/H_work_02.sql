/*
1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
*/
create database H_work_2;

use H_work_2;

create table IF NOT EXISTS sales
(
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_date Date not null,
    count_product int unsigned
);

insert sales(order_date,count_product)
values(date '2022-01-01',156),(date '2022-01-02',180),
(date '2022-01-03',21),(date '2022-01-04',124),(date '2022-01-05',341);

select * from sales;
/*
2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/
select
	id as "id заказа", 
		if(count_product < 100, "Маленький заказ",
		if(count_product between 100 and 300, "Средний заказ",
		if(count_product > 300,"Большой заказ","")))
	as "Тип заказа"
from sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями
Выберите все заказы. В зависимости от поля order_status 
выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; 
CANCELLED - «Order is cancelled»
*/

create table IF NOT EXISTS orders
(
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id varchar(25) ,
    amount float unsigned,
    order_status varchar(25) not null
);
insert orders(employee_id, amount, order_status)
values ('e03',15.00,'OPEN'),('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),('e02',22.18 ,'OPEN'),('e04 ',9.50 ,'CANCELLED');

select * from orders;

select *,
	if(order_status = 'OPEN', 'Order is in open state',
    if(order_status = 'CLOSED', 'Order is closed',
    if(order_status = 'CANCELLED', 'Order is cancelled','')))
    as full_order_status
from orders;
/*
4. Чем 0 отличается от NULL?
В MySQL значение NULL означает неизвестное. 
Значение NULL отличается от нуля (0) или пустой строки ». 
Значение NULL не равно ни к чему, даже сам по себе.
*/


