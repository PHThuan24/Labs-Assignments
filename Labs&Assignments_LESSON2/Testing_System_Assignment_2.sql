USE ManagementExam;

-- -------------- Department --------------
INSERT INTO Department(department_name)
VALUES ('Human resouces department'),
('Accounting department'),
('Audit department'),
('Administrative department'),
('Marketing department');

SELECT * FROM Department;

-- -------------- Positions --------------
ALTER TABLE Positions
MODIFY COLUMN position_name NVARCHAR(100);

SHOW CREATE TABLE Positions;

-- CREATE TABLE `positions` (
--   `position_id` int NOT NULL AUTO_INCREMENT,
--   `position_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
--   PRIMARY KEY (`position_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO Positions(position_name)
VALUES ('Dev'), ('Test'), ('Scrum'), ('Master'), ('PM') ;

SELECT * FROM Positions;

-- -------------- Accounts --------------
ALTER TABLE Accounts
ADD CONSTRAINT email UNIQUE(email);

SHOW CREATE TABLE Accounts;

INSERT INTO Accounts(email, user_name, full_name, department_id, position_id, create_date)
VALUES ('thuanphamdn@gmail.com', 'Thuan Pham', 'Pham Hong Thuan', 1, 1, NOW()),
('hoangdat@gmail.com', 'Dat Hoang', 'Hoang Trong Dat', 4, 3, NOW()),
('trungnguyen123@gmail.com', 'Trung Hero', 'Nguyen Ba Trung', 2, 1, NOW()),
('hungdnpro6789@gmail.com', 'Hung Pham', 'Pham Quang Hung', 3, 2, NOW()),
('tranthianhhuyen@gmail.com', 'Huyen', 'Tran Thi Anh Huyen', 1, 3, NOW()),
('MyLeqn92@gmail.com', 'My Le', 'Nguyen Thi My Le', 4, 5, NOW());

SELECT * FROM Accounts;

-- -------------- Groupss --------------
INSERT INTO Groupss(group_name, creator_id, create_date)
VALUES ('Group No.1', 1, NOW()),
('Group No.2', 5, NOW()),
('Group No.3', 1, NOW()),
('Group No.4', 2, NOW()),
('Group No.5', 2, NOW());

SELECT * FROM Groupss;

-- -------------- GroupAccount --------------
INSERT INTO GroupAccount(group_id, account_id, join_date)
VALUES (1, 1, NOW()),
(2, 5, NOW()),
(3, 1, NOW()),
(4, 2, NOW()),
(5, 2, NOW());

INSERT INTO GroupAccount(group_id, account_id, join_date)
VALUES (2, 1, NOW());

SELECT * FROM GroupAccount;

-- -------------- TypeQuestion --------------
INSERT INTO TypeQuestion(type_name)
VALUES ('Essay'), ('Multiple-Choice');

SELECT * FROM TypeQuestion;

-- -------------- CategoryQuestion --------------
INSERT INTO CategoryQuestion(category_name)
VALUES ('Category 1'), ('Category 2'),
('Category 3'), ('Category 4'),
('Category 5'), ('Category 6');

SELECT * FROM CategoryQuestion;

-- -------------- Question --------------
INSERT INTO Question(content, category_id, type_id, creator_id, create_date)
VALUES ('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, 1, 3, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 2, 1, 4, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 4, 2, 1, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, 2, 5, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, 1, 3, NOW());

INSERT INTO Question(content, category_id, type_id, creator_id, create_date)
VALUES ('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 6, 1, 2, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 3, 1, 6, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, 2, 2, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 5, 2, 4, NOW()), 
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 4, 1, 5, NOW());

SELECT * FROM Question;

-- -------------- Answer --------------
INSERT INTO Answer(content, question_id, is_correct)
VALUES ('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, True),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 2, False),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 3, True),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 4, True),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 5, False),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 6, True),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, False),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 2, True);

INSERT INTO Answer(content, question_id, is_correct)
VALUES ('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 7, 0),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 1, 0),
('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 3, 1);

SELECT * FROM Answer;

-- -------------- Exam --------------
INSERT INTO Exam(codes, title, category_id, duration, creator_id, create_date)
VALUES ('CODE001', 'Title 1', 1, NOW(), 2, NOW()),
('CODE002', 'Title 2', 1, NOW(), 1, NOW()),
('CODE003', 'Title 3', 4, NOW(), 2, NOW()),
('CODE004', 'Title 4', 3, NOW(), 4, NOW()),
('CODE005', 'Title 5', 6, NOW(), 5, NOW()),
('CODE006', 'Title 6', 1, NOW(), 5, NOW()),
('CODE007', 'Title 7', 2, NOW(), 3, NOW());

SELECT * FROM Exam;

-- -------------- ExamQuestion --------------
INSERT INTO ExamQuestion(exam_id, question_id)
VALUES (1, 3),
(2, 1),
(4, 7),
(4, 3),
(3, 1),
(5, 2),
(3, 3),
(1, 5);

SELECT * FROM ExamQuestion;