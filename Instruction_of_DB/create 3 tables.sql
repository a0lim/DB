-- 고객 테이블 생성
CREATE TABLE CUSTOMER (
    ID VARCHAR(20) NOT NULL,
    CUSTOMER_NAME VARCHAR(10) NOT NULL,
    AGE INT,
    GRADE VARCHAR(10) NOT NULL,
    JOB VARCHAR(20),
    POINT INT DEFAULT 0,
    PRIMARY KEY(ID)
);

-- 제품 테이블 생성
CREATE TABLE PRODUCT (
    NUM CHAR(3) NOT NULL,
    PRODUCT_NAME VARCHAR(20),
    STOCK INT,
    PRICE INT,
    COMPANY VARCHAR(20),
    PRIMARY KEY(NUM),
    CHECK (STOCK >= 0 AND STOCK <= 10000)
);

-- 주문 테이블 생성
CREATE TABLE ORDERS (
    NUM CHAR(3) NOT NULL,
    CUSTOMER VARCHAR(20),
    PRODUCT CHAR(3),
    COUNT INT,
    ADDRESS VARCHAR(30),
    DATE DATETIME,
    PRIMARY KEY(NUM),
    FOREIGN KEY(CUSTOMER) REFERENCES CUSTOMER(ID),
    FOREIGN KEY(PRODUCT) REFERENCES PRODUCT(NUM)
);
