
-- 1. Overdue Books Report
SELECT m.member_name, b.book_title, l.due_date
FROM overdue_books ob
JOIN loans l ON ob.book_title = l.book_id
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.due_date < CURRENT_DATE AND l.returned = FALSE;

-- 2. Currently Borrowed Books
SELECT * FROM current_loans;

-- 3. Loan History of Each Member
SELECT m.member_name, b.book_title, l.loan_date, l.due_date, l.returned
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
ORDER BY m.member_name, l.loan_date;

-- 4. Most Frequently Borrowed Books
SELECT b.book_title, COUNT(*) AS times_borrowed
FROM loans l
JOIN books b ON l.book_id = b.book_id
GROUP BY b.book_title
ORDER BY times_borrowed DESC;
