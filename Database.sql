Create Table payment_information(
credit_card_number numeric(16) NOT NULL PRIMARY KEY,
security_key numeric(4) NOT NULL, 
Expiration_date DATE NOT NULL
);

Create Table address(
street_number int NOT NULL, 
street_name varchar(30) NOT NULL, 
apt_number int, 
city varchar(50) NOT NULL, 
state char(2), 
zip_code varchar(15) NOT NULL, 
country char(2) NOT NULL,
PRIMARY KEY ( street_number, street_name, apt_number,  city, state, country)
);

Create Table airline(
airline_code char(2) NOT NULL PRIMARY KEY,
name varchar(20), 
country_of_origin char(2)
);

Create Table airport(
IATA char(3) NOT NULL PRIMARY KEY,
name varchar(20) NOT NULL, 
country char(2) NOT NULL, 
state char(2)
);

Create table flight(
flight_number int NOT NULL PRIMARY KEY,
miles int NOT NULL, 
departing_IATA char(3) NOT NULL, 
arriving_IATA char(3) NOT NULL, 
airline_code char(2) NOT NULL REFERENCES airline (airline_code),
FOREIGN KEY (departing_IATA) REFERENCES airport (IATA),
FOREIGN KEY (arriving_IATA) REFERENCES airport (IATA)
);

Create Table flight_instance(
Departure_date_and_time DATE NOT NULL,
Arrival_date_and_time DATE NOT NULL,
flight_number int NOT NULL,
max_1st_class_seats int NOT NULL, 
max_economy_seats int NOT NULL, 
cost_for_1st_class numeric(10,2) NOT NULL, 
cost_for_economy numeric(10,2) NOT NULL,
FOREIGN KEY (flight_number) REFERENCES flight(flight_number),
PRIMARY KEY (Departure_date_and_time, Arrival_date_and_time, flight_number)
);

Create table customer(
email_address varchar(50) NOT NULL PRIMARY KEY,
first_name varchar(20) NOT NULL, 
middle_name varchar(20), 
last_name varchar(20) NOT NULL, 
date_of_birth DATE NOT NULL, 
IATA char(3) NOT NULL REFERENCES airport (IATA)
);

Create table mileage_account(
mileage_number int PRIMARY KEY NOT NULL,
mile_count int NOT NULL,  
airline_code char(2) NOT NULL REFERENCES airline (airline_code),
email_address varchar(50) NOT NULL REFERENCES customer (email_address)
);

Create table booking(
booking_id numeric(16) NOT NULL PRIMARY KEY,
total_cost int, 
credit_card_number numeric(16) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
FOREIGN KEY (email_address) REFERENCES customer (email_address)
);

Create table flights_booked(
departure_date_and_time DATE NOT NULL,
arrival_date_and_time DATE NOT NULL,
flight_number int NOT NULL,
booking_id int NOT NULL,
class varchar(10) NOT NULL,
FOREIGN KEY (departure_date_and_time, arrival_date_and_time, flight_number) REFERENCES flight_instance (departure_date_and_time, arrival_date_and_time, flight_number),
FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
PRIMARY KEY (departure_date_and_time, arrival_date_and_time, flight_number, booking_id , class)
);

Create table payment_stored_to_account(
credit_card_number numeric(16) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
FOREIGN KEY (email_address) REFERENCES customer (email_address),
PRIMARY KEY (credit_card_number, email_address)
);

Create table address_in_profile(
street_number int NOT NULL,
street_name varchar(30) NOT NULL,
apt_number int,
city varchar(50) NOT NULL,
state char(2),
country char(2) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (street_number, street_name, apt_number,  city, state, country) REFERENCES address (street_number, street_name, apt_number,  city, state, country),
FOREIGN KEY (email_address) REFERENCES customer (email_address),
PRIMARY KEY (street_number, street_name, apt_number,  city, state, country, email_address)
);

Create table payment_address(
credit_card_number numeric(16,0) NOT NULL,
street_number int NOT NULL,
street_name varchar(30) NOT NULL,
apt_number int,
city varchar(50) NOT NULL,
state char(2),
country char(2) NOT NULL,
FOREIGN KEY (street_number, street_name, apt_number,  city, state, country) REFERENCES address (street_number, street_name, apt_number,  city, state, country),
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
PRIMARY KEY (credit_card_number, street_number, street_name, apt_number,  city, state, country)
);

email_address varchar(50) NOT NULL REFERENCES customer (email_address)
);

Create table booking(
booking_id numeric(16) NOT NULL PRIMARY KEY,
total_cost int,
credit_card_number numeric(16) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
FOREIGN KEY (email_address) REFERENCES customer (email_address)
);

Create table flights_booked(
departure_date_and_time TIMESTAMP NOT NULL,
arrival_date_and_time TIMESTAMP NOT NULL,
flight_number int NOT NULL,
booking_id int NOT NULL,
class varchar(10) NOT NULL,
FOREIGN KEY (departure_date_and_time, arrival_date_and_time, flight_number) REFERENCES flight_instance (departure_date_and_time, arrival_date_and_time, flight_number),
FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
PRIMARY KEY (departure_date_and_time, arrival_date_and_time, flight_number, booking_id , class)
);

Create table payment_stored_to_account(
credit_card_number numeric(16) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
FOREIGN KEY (email_address) REFERENCES customer (email_address),
PRIMARY KEY (credit_card_number, email_address)
);

Create table address_in_profile(
street_number int NOT NULL,
street_name varchar(30) NOT NULL,
apt_number int,
city varchar(50) NOT NULL,
state char(2),
country char(2) NOT NULL,
email_address varchar(50) NOT NULL,
FOREIGN KEY (street_number, street_name, apt_number,  city, state, country) REFERENCES address (street_number, street_name, apt_number,  city, state, country),
FOREIGN KEY (email_address) REFERENCES customer (email_address),
PRIMARY KEY (street_number, street_name, apt_number,  city, state, country, email_address)
);

Create table payment_address(
credit_card_number numeric(16,0) NOT NULL,
street_number int NOT NULL,
street_name varchar(30) NOT NULL,
apt_number int,
city varchar(50) NOT NULL,
state char(2),
country char(2) NOT NULL,
FOREIGN KEY (street_number, street_name, apt_number,  city, state, country) REFERENCES address (street_number, street_name, apt_number,  city, state, country),
FOREIGN KEY (credit_card_number) REFERENCES payment_information (credit_card_number),
PRIMARY KEY (credit_card_number, street_number, street_name, apt_number,  city, state, country)
);
