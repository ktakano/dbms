--  Sample employee database 
--  See changelog table for details
--  Copyright (C) 2007,2008, MySQL AB
--  
--  Original data created by Fusheng Wang and Carlo Zaniolo
--  http://www.cs.aau.dk/TimeCenter/software.htm
--  http://www.cs.aau.dk/TimeCenter/Data/employeeTemporalDataSet.zip
-- 
--  Current schema by Giuseppe Maxia 
--  Data conversion from XML to relational by Patrick Crews
-- 
-- This work is licensed under the 
-- Creative Commons Attribution-Share Alike 3.0 Unported License. 
-- To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to 
-- Creative Commons, 171 Second Street, Suite 300, San Francisco, 
-- California, 94105, USA.
-- 
--  DISCLAIMER
--  To the best of our knowledge, this data is fabricated, and
--  it does not correspond to real people. 
--  Any similarity to existing people is purely coincidental.
-- 
-- Edited by K. Takano

DROP DATABASE IF EXISTS myemp;
CREATE DATABASE IF NOT EXISTS myemp;
USE myemp;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS dept_emp,
                     dept_manager,
                     titles,
                     salaries, 
                     employees300000, 
                     employees200000, 
                     employees100000, 
                     employees50000, 
                     employees10000, 
                     employees1000, 
                     departments;

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;

CREATE TABLE employees300000 (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE employees200000 LIKE employees300000;
CREATE TABLE employees100000 LIKE employees300000;
CREATE TABLE employees50000 LIKE employees300000;
CREATE TABLE employees10000 LIKE employees300000;
CREATE TABLE employees1000 LIKE employees300000;

SELECT 'LOADING employees300000' as 'INFO';
source load_employees300000.dump ;

SELECT 'LOADING employees200000' as 'INFO';
source load_employees200000.dump ;

SELECT 'LOADING employees100000' as 'INFO';
source load_employees100000.dump ;

SELECT 'LOADING employees50000' as 'INFO';
source load_employees50000.dump ;

SELECT 'LOADING employees10000' as 'INFO';
source load_employees10000.dump ;

SELECT 'LOADING employees1000' as 'INFO';
source load_employees1000.dump ;

SELECT 'Copying to employees300000_idx' as 'INFO';
CREATE TABLE employees300000_idx SELECT * FROM employees300000;

SELECT 'Copying to employees200000_idx' as 'INFO';
CREATE TABLE employees200000_idx SELECT * FROM employees200000;

SELECT 'Copying to employees100000_idx' as 'INFO';
CREATE TABLE employees100000_idx SELECT * FROM employees100000;

SELECT 'Copying to employees50000_idx' as 'INFO';
CREATE TABLE employees50000_idx SELECT * FROM employees50000;

SELECT 'Copying to employees10000_idx' as 'INFO';
CREATE TABLE employees10000_idx SELECT * FROM employees10000;

SELECT 'Copying to employees1000_idx' as 'INFO';
CREATE TABLE employees1000_idx SELECT * FROM employees1000;

ALTER TABLE employees300000_idx ADD PRIMARY KEY (emp_no);
ALTER TABLE employees200000_idx ADD PRIMARY KEY (emp_no);
ALTER TABLE employees100000_idx ADD PRIMARY KEY (emp_no);
ALTER TABLE employees50000_idx ADD PRIMARY KEY (emp_no);
ALTER TABLE employees10000_idx ADD PRIMARY KEY (emp_no);
ALTER TABLE employees1000_idx ADD PRIMARY KEY (emp_no);
