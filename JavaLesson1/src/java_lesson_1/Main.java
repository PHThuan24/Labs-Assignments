package java_lesson_1;

import java.util.Date;

public class Main {
	public static void main(String[] args) {
		System.out.println("Hello World!");
		Account account = new Account();
		account.userName = "nguyenvana";
		account.fullName = "Nguyen Van A";
		account.gender = Gender.MALE;
		account.email = "nguyenvana@gmail.com";
		Department department = new Department();
		account.department = department;
		//account.department =  new Department();
		
		Group group1 = new Group();
		Group group2 = new Group();
		Group[] groups = {group1, group2};
		account.groups = groups;
		
		System.out.println("User name: " +account.userName);
		System.out.println("Full name: " +account.fullName);
		System.out.println("Gender: " +account.gender);
		
		account.createdDate = new Date("2023/12/24");
		System.out.println("Created date1: " +account.createdDate);
	}
}
