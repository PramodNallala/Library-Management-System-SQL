
-- View for current borrowed books
CREATE OR REPLACE VIEW current_loans AS
SELECT m.member_name, b.book_title, l.due_date, l.returned
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.returned = FALSE;

-- View for overdue books
CREATE OR REPLACE VIEW overdue_books AS
SELECT m.member_name, b.book_title, l.due_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.returned = FALSE AND l.due_date < CURRENT_DATE;
