CREATE DATABASE employeeMybatis;

USE employeemybatis;

CREATE TABLE employee
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	
	name VARCHAR(50) NOT NULL,
	
	email VARCHAR(50) NOT NULL,
	
	gender VARCHAR(50) NOT NULL,
	
	hobbies VARCHAR(50) NOT NULL,
	
	country VARCHAR(50) NOT NULL,
	
	address VARCHAR(50) NOT NULL
);