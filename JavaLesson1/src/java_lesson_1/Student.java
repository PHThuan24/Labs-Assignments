package java_lesson_1;

import java.time.LocalDate;
import java.util.Date;

public class Student {
	byte age;
	float salary;
	char firstCharacter;
	String firstName;
	String fullName;	//fullName = "Nguyen Van A"
	String description;
	boolean isMale;
	Date dateOfBirth;
	LocalDate birthday;
	Gender gender;
	String[] fullNames; //fullNames = {"Nguyen Van A", "Nguyen Van B", "Nguyen Van C"}
	byte[] points;		//points	= {1, 2, 3, 4}
	
	
	public static void main(String[] args) {
		System.out.println("Hello World!");
	}
}
