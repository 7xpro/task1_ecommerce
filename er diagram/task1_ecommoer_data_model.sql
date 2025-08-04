-- databae creation 
create database task1_ecommerce;

-- using created database
use task1_ecommerce;

--  table creation

create table customer(
customer_id int primary key,
fname varchar(30),
lname varchar(30),
mobile varchar(20),
emial varchar(150),
addres_id int);

insert into customer value
(1,'Rahul','Sharma','9876843210','rahul@example.com',1),
(2,'Piya','Verma','8765432109','priya@example.com',2),
(3,'Amit','Kumar','7654321098','amit@example.com',3);

CREATE TABLE address (
  address_id int PRIMARY KEY,
  country varchar(100),
  state varchar(50),
  city varchar(150),
  zip_code varchar(20),
  address_line varchar(150)
);

INSERT INTO address VALUES
(1, 'India', 'Maharashtra', 'Mumbai', '400001', '123 Marine Drive'),
(2, 'India', 'Karnataka', 'Bangalore', '560001', '456 MG Road'),
(3, 'India', 'Delhi', 'New Delhi', '110001', '789 Connaught Place');




CREATE TABLE product (
  prod_id int PRIMARY KEY,
  prod_name varchar(150),
  prod_description varchar(255),
  prod_price decimal(10,3),
  category_id int,
  stock_id int
);

INSERT INTO product VALUES
(1, 'Smartphone', 'Latest Android smartphone', 25000.500, 1, 1),
(2, 'T-Shirt', 'Cotton Round Neck T-Shirt', 499.999, 2, 2);


CREATE TABLE category (
  category_id int PRIMARY KEY,
  category_name varchar(50),
  category_description varchar(150)
);

INSERT INTO category VALUES
(1, 'Electronics', 'Devices like phones, laptops, etc.'),
(2, 'Apparel', 'Clothing items');

CREATE TABLE stock (
  stock_id int PRIMARY KEY,
  stock int,
  stock_location int
);

INSERT INTO stock VALUES
(1, 50, 1),
(2, 100, 2);


CREATE TABLE vendor (
  vendor_id int PRIMARY KEY,
  vendor_fname varchar(30),
  vendor_lname varchar(30),
  vendor_email varchar(150),
  vendor_mobile varchar(20),
  Address_id int,
  wharehouse_address_id int
);

INSERT INTO vendor VALUES
(1, 'Rakesh', 'Mehta', 'rakesh@vendor.com', '9123456780', 1, 1),
(2, 'Sneha', 'Patel', 'sneha@vendor.com', '9234567890', 2, 2);


CREATE TABLE vendor_address (
  vendor_address_id int PRIMARY KEY,
  country varchar(100),
  state varchar(50),
  city varchar(150),
  zip_code varchar(20),
  address_line varchar(150)
);

INSERT INTO vendor_address VALUES
(1, 'India', 'Gujarat', 'Ahmedabad', '380001', '12 Satellite Road'),
(2, 'India', 'Telangana', 'Hyderabad', '500001', '45 Banjara Hills');


CREATE TABLE vendor_wharehouse (
  wharehouse_id int PRIMARY KEY,
  country varchar(100),
  state varchar(50),
  city varchar(150),
  zip_code varchar(20),
  address_line varchar(150)
);

INSERT INTO vendor_wharehouse VALUES
(1, 'India', 'Gujarat', 'Surat', '395003', '100 Textile Market'),
(2, 'India', 'Telangana', 'Secunderabad', '500003', '200 Electronics Lane');


CREATE TABLE `order` (
  order_id int PRIMARY KEY,
  customer_id int,
  vendor_id int,
  order_item_id int,
  order_date datetime,
  total_amount int,
  status varchar(20)
);

INSERT INTO `order` VALUES
(1, 1, 1, 1, '2025-08-01 10:00:00', 25000, 'Delivered'),
(2, 2, 2, 2, '2025-08-03 15:30:00', 999, 'Shipped');

CREATE TABLE order_item (
  order_item_id int PRIMARY KEY,
  order_id int,
  quantity int,
  price decimal(10,3),
  product_id int
);

INSERT INTO order_item VALUES
(1, 1, 1, 25000.500, 1),
(2, 2, 2, 499.999, 2);


CREATE TABLE payment (
  payment_id int PRIMARY KEY,
  order_id int,
  payment_date datetime,
  amount decimal(10,3),
  payment_method varchar(20),
  payment_status varchar(20)
);

INSERT INTO payment VALUES
(1, 1, '2025-08-01 11:00:00', 25000.500, 'UPI', 'Success'),
(2, 2, '2025-08-03 16:00:00', 999.998, 'Credit Card', 'Success');


-- adding foreign key to tables


alter table customer add foreign key (address_id) references address (address_id);

alter table product add foreign key (category_id) references category (category_id);

alter table product add foreign key (stock_id) references stock (stock_id);

ALTER TABLE payment ADD FOREIGN KEY (order_id) REFERENCES `order` (order_id);

ALTER TABLE order_item ADD FOREIGN KEY (product_id) REFERENCES product (prod_id);

ALTER TABLE `order` ADD FOREIGN KEY (customer_id) REFERENCES customer (customer_id);

ALTER TABLE `order` ADD FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id);

ALTER TABLE `order` ADD FOREIGN KEY (order_item_id) REFERENCES order_item (order_item_id);

ALTER TABLE vendor ADD FOREIGN KEY (wharehouse_address_id) REFERENCES vendor_wharehouse (wharehouse_id);

ALTER TABLE vendor ADD FOREIGN KEY (Address_id) REFERENCES vendor_address (vendor_address_id);







