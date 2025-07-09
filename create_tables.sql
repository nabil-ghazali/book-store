-- Création des tables

CREATE TABLE theme (
    theme_id INT PRIMARY KEY,
    theme_name VARCHAR(100) NOT NULL
);



CREATE TABLE author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year YEAR
);

CREATE TABLE book (
   book_id INT PRIMARY KEY,
   title VARCHAR(50) NOT NULL,
   author_id VARCHAR(50) NOT NULL,
   price DECIMAL(15,2) NOT NULL,
   stock INT NOT NULL,
   publication_year DATE,
   theme_id VARCHAR(50) NOT NULL,
   FOREIGN KEY(theme_id) REFERENCES theme(theme_id),
   FOREIGN KEY(author_id) REFERENCES author(author_id)
);

 
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    join_date DATE
);

CREATE TABLE customer_order (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE review (
   review_id INT PRIMARY KEY,
   rating BYTE NOT NULL,
   comment TEXT,
   review_date DATE NOT NULL,
   book_id INT NOT NULL,
   customer_id INT NOT NULL,
   FOREIGN KEY(book_id) REFERENCES book(book_id),
   FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
