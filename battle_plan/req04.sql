SELECT *
FROM (
VALUES
('a', 3),
('b', 3),
('b', 1),
('c', 1)
) AS answers(question, choice);
