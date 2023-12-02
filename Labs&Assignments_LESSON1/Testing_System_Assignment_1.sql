CREATE DATABASE ManagementExam;

USE ManagementExam;

CREATE TABLE Department(
	department_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name NVARCHAR(150) NOT NULL
);

CREATE TABLE Positions(
	position_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    position_name ENUM('Dev', 'Test', 'Scrum', 'Master', 'PM')
);

CREATE TABLE Accounts(
	account_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    user_name NVARCHAR(100) NOT NULL,
    full_name NVARCHAR(100),
    department_id BIGINT NOT NULL,
	position_id INT NOT NULL,
    create_date DATE,
	FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);


CREATE TABLE Groupss(
	group_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    group_name NVARCHAR(150) NOT NULL,
    creator_id BIGINT NOT NULL,
    create_date DATE,
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE GroupAccount(
    group_id BIGINT NOT NULL,
    account_id BIGINT NOT NULL,
	join_date DATE,
    PRIMARY KEY (group_id, account_id),
	FOREIGN KEY (group_id) REFERENCES Groupss(group_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);



CREATE TABLE TypeQuestion(
	type_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay', 'Multiple-Choice')
);

CREATE TABLE CategoryQuestion(
	category_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL
);

CREATE TABLE Question(
	question_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(250) NOT NULL,
    category_id BIGINT NOT NULL,
    type_id BIGINT NOT NULL,
    creator_id BIGINT NOT NULL,
    create_date DATE,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id),
    FOREIGN KEY (type_id) REFERENCES TypeQuestion(type_id),
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Answer(
	answer_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(500) NOT NULL,
    question_id BIGINT NOT NULL,
    is_correct BOOLEAN,
	FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

CREATE TABLE Exam(
	exam_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codes VARCHAR(50),
    title NVARCHAR(150),
    category_id BIGINT NOT NULL,
    duration TIME,
    creator_id BIGINT NOT NULL,
    create_date Date,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id),
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE ExamQuestion(
	exam_id BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES Question(question_id)
);
