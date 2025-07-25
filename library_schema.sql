
-- Drop tables if they already exist (for reset purposes)
DROP TABLE IF EXISTS loans, books_authors, authors, books, members;

-- Create Members Table
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);

-- Create Books Table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    book_title VARCHAR(200) NOT NULL,
    genre VARCHAR(50),
    publication_year INT
);

-- Create Authors Table
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- Many-to-Many Relationship: Books ↔ Authors
CREATE TABLE books_authors (
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    author_id INT REFERENCES authors(author_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

-- Create Loans Table
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    book_id INT REFERENCES books(book_id),
    loan_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    returned BOOLEAN DEFAULT FALSE
);
