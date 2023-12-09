USE Training;

-- -----------------------Exercise 1: Join-----------------------
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT * FROM Account;
SELECT * FROM Department;
SELECT * FROM `Position`;
SELECT A.id ID, A.user_name 'User Name', A.full_name 'Full Name', A.email 'Email', 
A.gender 'Gender', D.name 'Department', P.name 'Position', A.salary 'Salary'
FROM Account A
INNER JOIN Department D ON A.department_id = D.id
INNER JOIN `Position` P ON A.position_id = P.id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2020
SELECT * FROM Account;

SELECT * FROM Account
WHERE created_date > '2020-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các 'Staff'
SELECT * FROM Account;
SELECT * FROM `Position`;

SELECT A.id ID, A.user_name 'User Name', A.full_name 'Full Name', A.email 'Email', 
A.gender 'Gender', P.name 'Position', A.salary 'Salary'
FROM Account A
INNER JOIN `Position` P ON A.position_id = P.id
WHERE P.name = 'Staff';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.name 'Department has more than 3 Accounts'
FROM Account A
INNER JOIN Department D ON A.department_id = D.id
INNER JOIN `Position` P ON A.position_id = P.id
GROUP BY A.department_id
HAVING COUNT(P.id) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT EQ.question_id, COUNT(EQ.exam_id)  FROM EXAMQUESTION EQ
GROUP BY EQ.question_id
ORDER BY COUNT(exam_id) ASC
LIMIT 3;


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT Q.category_id, C.category, COUNT(*)  FROM Question Q
INNER JOIN Category C ON C.id = Q.category_id
GROUP BY category_ID;


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT * FROM examquestion;
SELECT * FROM question;
SELECT * FROM exam;

SELECT question_id, COUNT(exam_id) 
FROM ExamQuestion
GROUP BY question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT question_id, COUNT(*) AS numberOfAnwser FROM Anwser
GROUP BY question_id
ORDER BY numberOfAnwser ASC
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT group_id 'Group ID', COUNT(account_id) 'Number Of Account' 
FROM GroupMember
GROUP BY group_id;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT position_id, COUNT(id) FROM ACCOUNT
GROUP BY position_id
ORDER BY COUNT(id) 
LIMIT 1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT D.name 'Department', P.name 'Position', COUNT(*) 
FROM Account A
INNER JOIN Department D ON A.department_id = D.id
INNER JOIN `Position` P ON A.position_id = P.id
GROUP BY position_id, department_id;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT Q.content 'Câu hỏi', T.type 'Loại câu hỏi', 
Ac.full_name 'Người tạo ra câu hỏi', A.content 'Câu trả lời'
FROM Question Q
INNER JOIN QuestionType T ON Q.type_id = T.id
INNER JOIN Anwser A ON A.question_id = Q.id
INNER JOIN Account Ac ON Ac.id = Q.creator_id;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
-- Question 14:Lấy ra group không có account nào
SELECT * FROM `GROUP`;
SELECT * FROM ACCOUNT;

SELECT * FROM `Group`
LEFT JOIN GroupMember
ON `Group`.id = GroupMember.group_id
WHERE GroupMember.account_id IS NULL;

-- Question 15: Lấy ra question không có answer nào
SELECT * FROM Question Q
LEFT JOIN Anwser A
ON Q.id = A.question_id
WHERE A.id IS NULL;

 -- ------------------------------------------------- 
--  Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT * FROM ACCOUNT A
INNER JOIN GroupMember G ON a.id = G.account_id
WHERE G.group_id = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT * FROM ACCOUNT A
INNER JOIN GroupMember G ON a.id = G.account_id
WHERE G.group_id = 2;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT DISTINCT a.id, a.user_name, A.full_name, A.email,
A.gender, A.salary, G.group_id FROM ACCOUNT A
INNER JOIN GroupMember G ON a.id = G.account_id
WHERE G.group_id = 1
UNION
SELECT a.id, a.user_name, A.full_name, A.email,
A.gender, A.salary, G.group_id FROM ACCOUNT A
INNER JOIN GroupMember G ON a.id = G.account_id
WHERE G.group_id = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT DISTINCT G.id, G.name, G.creator_id, G.created_date FROM `Group` G
INNER JOIN GroupMember GM ON GM.group_id = G.id
GROUP BY GM.group_id
HAVING COUNT(account_id)  > 5;
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT DISTINCT G.id, G.name, G.creator_id, G.created_date FROM `Group` G
INNER JOIN GroupMember GM ON GM.group_id = G.id
GROUP BY GM.group_id
HAVING COUNT(account_id)  < 7;
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT DISTINCT G.id, G.name, G.creator_id, G.created_date FROM `Group` G
INNER JOIN GroupMember GM ON GM.group_id = G.id
GROUP BY GM.group_id
HAVING COUNT(account_id)  > 5
UNION
SELECT DISTINCT G.id, G.name, G.creator_id, G.created_date FROM `Group` G
INNER JOIN GroupMember GM ON GM.group_id = G.id
GROUP BY GM.group_id
HAVING COUNT(account_id)  < 7