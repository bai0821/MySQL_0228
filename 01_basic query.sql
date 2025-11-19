-- basic query
-- show the databases in the  current RDBMS
show databases;

-- create new database
create database my_database;

-- delete database (dangerous!!!)
-- drop database my_database;

-- comment
-- single line comment
-- 1. -- 前面需要空格
-- 2. # 可直接打

-- multi lines comment
/*
drop database my_database;
*/

-- use
-- 快捷鍵 crtl+enter 執行
use my_database;
use world;
use sakila;

-- 古董
select database()