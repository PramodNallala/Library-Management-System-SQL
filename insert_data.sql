
-- Insert Members
INSERT INTO members (member_name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Davis', 'charlie@example.com');

-- Insert Authors
INSERT INTO authors (author_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Agatha Christie');

-- Insert Books
INSERT INTO books (book_title, genre, publication_year) VALUES
('Harry Potter and the Sorcerer's Stone', 'Fantasy', 1997),
('1984', 'Dystopian', 1949),
('Murder on the Orient Express', 'Mystery', 1934);

-- Link Books and Authors
INSERT INTO books_authors VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert Loan Records
INSERT INTO loans (member_id, book_id, due_date, returned) VALUES
(1, 1, CURRENT_DATE + INTERVAL '7 days', FALSE),
(2, 2, CURRENT_DATE - INTERVAL '3 days', FALSE),
(3, 3, CURRENT_DATE + INTERVAL '5 days', TRUE);
