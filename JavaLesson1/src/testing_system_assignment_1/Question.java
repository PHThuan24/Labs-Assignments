package testing_system_assignment_1;

import java.util.Date;

public class Question {
	long id;
	String content;
	CategoryQuestion category;
	TypeQuestion type;
	Account creator;
	Date createDate;
	Answer[] answers;
	Exam[] exams;
}
