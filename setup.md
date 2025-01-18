# PL/SQL Lab Setup

This README provides instructions for setting up your PL/SQL environment, including downloading the necessary database and client tools, as well as running the required SQL scripts to create tables and insert data for your lab exercises.

## Table of Contents
- [Download and Setup](#download-and-setup)
- [Client Tool](#client-tool)
- [SQL Scripts](#sql-scripts)
- [Further Reading](#further-reading)

## Download and Setup

To get started, download and set up the Oracle Database from the following link:

- [Download Oracle Database](https://drive.google.com/drive/folders/1fjwroJ7qFdPV5_lEJYHorGjZoSYwIC5F?usp=sharing)

## Client Tool

You will need a client tool to interact with your Oracle Database. You can download SQL Developer from Oracle:

- [Download SQL Developer](https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html)

## SQL Scripts

Run the following SQL scripts on your Oracle schema to create the necessary tables and insert sample data for your lab exercises.

### Create Tables

```sql
CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    MIDDLE_NAME VARCHAR2(50),
    ADDRESS_LINE1 VARCHAR2(80),
    ADDRESS_LINE2 VARCHAR2(80),
    CITY VARCHAR2(40),
    COUNTRY VARCHAR2(50),
    DATE_ADDED DATE,
    REGION VARCHAR2(10)
);

CREATE TABLE PRODUCT (
    PRODUCT_ID NUMBER,
    PRODUCT_NAME VARCHAR2(100),
    STANDARD_COST NUMBER(10,2),
    COLOR VARCHAR2(20),
    LIST_PRICE NUMBER(10,2),
    PRODUCT_SIZE NUMBER(8,2),
    WEIGHT NUMBER(10,2),
    PRODUCT_CATEGORY VARCHAR2(20)
);

CREATE TABLE SALES (
    SALES_DATE DATE,
    ORDER_ID NUMBER,
    PRODUCT_ID NUMBER,
    CUSTOMER_ID NUMBER(5,0),
    SALESPERSON_ID NUMBER(5,0),
    QUANTITY NUMBER(4,0),
    UNIT_PRICE NUMBER(10,2),
    SALES_AMOUNT NUMBER(10,2),
    TAX_AMOUNT NUMBER(10,2),
    TOTAL_AMOUNT NUMBER(10,2)
);

CREATE TABLE SALES_HISTORY (
    SALES_DATE DATE,
    ORDER_ID NUMBER,
    PRODUCT_ID NUMBER,
    CUSTOMER_ID NUMBER(5,0),
    SALESPERSON_ID NUMBER(5,0),
    QUANTITY NUMBER(4,0),
    UNIT_PRICE NUMBER(10,2),
    SALES_AMOUNT NUMBER(10,2),
    TAX_AMOUNT NUMBER(10,2),
    TOTAL_AMOUNT NUMBER(10,2)
);

CREATE TABLE SALESPERSON (
    SALESPERSON_ID NUMBER,
    JOB_TITLE VARCHAR2(80),
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    MIDDLE_NAME VARCHAR2(50),
    ADDRESS_LINE1 VARCHAR2(80),
    ADDRESS_LINE2 VARCHAR2(80),
    CITY VARCHAR2(40),
    COUNTRY VARCHAR2(50),
    DATE_ADDED DATE
);

CREATE TABLE AUDIT_TABLE (
    TABLE_NAME VARCHAR2(100),
    USERID VARCHAR2(100),
    OPERATION_DATE DATE,
    OPERATION VARCHAR2(100)
);

CREATE TABLE AUDIT_LOG (
    USERID VARCHAR2(100),
    OPERATION_DATE DATE,
    B_CUSTOMERID NUMBER,
    A_CUSTOMERID NUMBER,
    B_FIRSTNAME VARCHAR2(100),
    A_FIRSTNAME VARCHAR2(100)
);
