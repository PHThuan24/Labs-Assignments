package testing_system_assignment_1;

import java.util.Date;

public class Main {
	public static void main(String[] args) {
//		System.out.println("Hello World!");
//		Account account = new Account();
//		account.userName = "nguyenvana";
//		account.fullName = "Nguyen Van A";
//		account.gender = Gender.MALE;
//		account.email = "nguyenvana@gmail.com";
//		Department department = new Department();
//		account.department = department;
//		//account.department =  new Department();
//		
//		System.out.println("User name: " +account.userName);
//		System.out.println("Full name: " +account.fullName);
//		System.out.println("Gender: " +account.gender);
//		
//		account.createDate = new Date("2023/12/24");
//		System.out.println("Created date: " +account.createDate);
		
		
//		---------------DEPARTMENT---------------
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";
		
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketing";
		
		Department department3 = new Department();
		department3.id = 3;
		department3.name = "R&D";
		
		Department department4 = new Department();
		department4.id = 4;
		department4.name = "Accounting";
		
//		System.out.println("ID: " +department1.id +"     " +"Department Name: " +department1.name);
//		System.out.println("ID: " +department2.id +"     " +"Department Name: " +department2.name);
//		System.out.println("ID: " +department3.id +"     " +"Department Name: " +department3.name);
//		System.out.println("ID: " +department4.id +"     " +"Department Name: " +department4.name);
		
//		---------------POSITION---------------
		Position position1 = new Position();
		position1.id = 1;
		position1.name = "Staff";
		
		Position position2 = new Position();
		position2.id = 2;
		position2.name = "Manager";
		
		Position position3 = new Position();
		position3.id = 3;
		position3.name = "PM";
		
		Position position4 = new Position();
		position4.id = 4;
		position4.name = "Developer";
		
//		System.out.println("ID: " +position1.id +"     " +"Position: " +position1.name);
//		System.out.println("ID: " +position2.id +"     " +"Position: " +position2.name);
//		System.out.println("ID: " +position3.id +"     " +"Position: " +position3.name);
//		System.out.println("ID: " +position4.id +"     " +"Position: " +position4.name);
		
//		---------------ACCOUNT---------------
		Account account1 = new Account();
		account1.id = 1;
		account1.email = "nguyenvana@gmail.com";
		account1.userName = "nguyenvana";
		account1.fullName = "Nguyen Van A";
		account1.department = department1;
		account1.position = position1;
		account1.createDate = new Date();
		
		Account account2 = new Account();
		account2.id = 2;
		account2.email = "nguyenvanb@gmail.com";
		account2.userName = "nguyenvanb";
		account2.fullName = "Nguyen Van B";
		account2.department = department1;
		account2.position = position1;
		account2.createDate = new Date();
		
		Account account3 = new Account();
		account3.id = 3;
		account3.email = "nguyenvanc@gmail.com";
		account3.userName = "nguyenvanc";
		account3.fullName = "Nguyen Van C";
		account3.department = department1;
		account3.position = position1;
		account3.createDate = new Date();
		
		Account account4 = new Account();
		account4.id = 4;
		account4.email = "nguyenvand@gmail.com";
		account4.userName = "nguyenvand";
		account4.fullName = "Nguyen Van D";
		account4.department = department1;
		account4.position = position1;
		account4.createDate = new Date();
		System.out.println("ID: " +account1.id + "   Email: " +account1.email +"   User name: " +account1.userName
						+"   Full name: " +account1.fullName +"   Department Name: " +account1.department.name 
						+"   Position: " +account1.position.name +"   Create Date: " +account1.createDate
				);
		System.out.println("ID: " +account2.id + "   Email: " +account2.email +"   User name: " +account2.userName
				+"   Full name: " +account2.fullName +"   Department Name: " +account2.department.name 
				+"   Position: " +account2.position.name+"   Create Date: " +account2.createDate
		);
		System.out.println("ID: " +account3.id + "   Email: " +account3.email +"   User name: " +account3.userName
				+"   Full name: " +account3.fullName +"   Department Name: " +account3.department.name 
				+"   Position: " +account3.position.name+"   Create Date: " +account3.createDate
		);
		System.out.println("ID: " +account4.id + "   Email: " +account4.email +"   User name: " +account4.userName
				+"   Full name: " +account4.fullName +"   Department Name: " +account4.department.name 
				+"   Position: " +account4.position.name+"   Create Date: " +account4.createDate
		);
		
//		---------------GROUP---------------
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Group 1";
		group1.creator = account1;
		Account[] accountOfGroup1 = {account1, account2, account3};
		group1.accounts = accountOfGroup1;
		group1.createdDate = new Date();
		System.out.println("Group ID: " +group1.id +"   Group Name: " +group1.name +"   Creator Group: " +group1.creator.fullName
				+"   Create Date: " +group1.createdDate +"   Account Of Group: " +group1.accounts
				);
		
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Group 2";
		group2.creator = account2;
		Account[] accountOfGroup2 = {account1, account2, account4};
		group2.accounts = accountOfGroup2;
		group2.createdDate = new Date();
		System.out.println("Group ID: " +group2.id +"   Group Name: " +group2.name +"   Creator Group: " +group2.creator.fullName
				+"   Create Date: " +group2.createdDate +"   Account Of Group: " +group2.accounts
				);
		
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Group 3";
		group3.creator = account3;
		Account[] accountOfGroup = {account4, account2, account3};
		group3.accounts = accountOfGroup;
		group3.createdDate = new Date();
		System.out.println("Group ID: " +group3.id +"   Group Name: " +group3.name +"   Creator Group: " +group3.creator.fullName
				+"   Create Date: " +group3.createdDate +"   Account Of Group: " +group3.accounts
				);
	}
}
