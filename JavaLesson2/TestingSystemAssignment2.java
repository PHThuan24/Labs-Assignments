package assignmentone;

import java.util.Date;

public class TestingSystemAssignment2 {

	public static void main(String[] args) {
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
		
//		---------------ACCOUNT---------------
		Account account1 = new Account();
		account1.id = 1;
		account1.email = "nguyenvana@gmail.com";
		account1.userName = "nguyenvana";
		account1.fullName = "Nguyen Van A";
		account1.department = department1;
		account1.position = position1;
		account1.createdDate = new Date();
		
		Account account2 = new Account();
		account2.id = 2;
		account2.email = "nguyenvanb@gmail.com";
		account2.userName = "nguyenvanb";
		account2.fullName = "Nguyen Van B";
		account2.department = department1;
		account2.position = position1;
		account2.createdDate = new Date();
		
		
//		Group[] groupOfAccount2 = {group1, group2};
//		account2.groups = groupOfAccount2;
//		Account[] accountOfGroup2 = {account1, account2, account4};
//		group2.accounts = accountOfGroup2;
		
		
		Account account3 = new Account();
		account3.id = 3;
		account3.email = "nguyenvanc@gmail.com";
		account3.userName = "nguyenvanc";
		account3.fullName = "Nguyen Van C";
		account3.department = department1;
		account3.position = position1;
		account3.createdDate = new Date();
		
		Account account4 = new Account();
		account4.id = 4;
		account4.email = "nguyenvand@gmail.com";
		account4.userName = "nguyenvand";
		account4.fullName = "Nguyen Van D";
		account4.department = department1;
		account4.position = position1;
		account4.createdDate = new Date();
		/*
		 * 
		System.out.println("ID: " +account1.id + "   Email: " +account1.email +"   User name: " +account1.userName
						+"   Full name: " +account1.fullName +"   Department Name: " +account1.department.name 
						+"   Position: " +account1.position.name +"   Create Date: " +account1.createdDate
				);
		System.out.println("ID: " +account2.id + "   Email: " +account2.email +"   User name: " +account2.userName
				+"   Full name: " +account2.fullName +"   Department Name: " +account2.department.name 
				+"   Position: " +account2.position.name+"   Create Date: " +account2.createdDate
		);
		System.out.println("ID: " +account3.id + "   Email: " +account3.email +"   User name: " +account3.userName
				+"   Full name: " +account3.fullName +"   Department Name: " +account3.department.name 
				+"   Position: " +account3.position.name+"   Create Date: " +account3.createdDate
		);
		System.out.println("ID: " +account4.id + "   Email: " +account4.email +"   User name: " +account4.userName
				+"   Full name: " +account4.fullName +"   Department Name: " +account4.department.name 
				+"   Position: " +account4.position.name+"   Create Date: " +account4.createdDate
		);
		 * */
		
//		---------------GROUP---------------
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Group 1";
		group1.creator = account1;
		Account[] accountOfGroup1 = {account1, account2, account3};
		group1.accounts = accountOfGroup1;
		group1.createdDate = new Date();
//		System.out.println("Group ID: " +group1.id +"   Group Name: " +group1.name +"   Creator Group: " +group1.creator.fullName
//				+"   Create Date: " +group1.createdDate +"   Account Of Group: " +group1.accounts
//				);
		
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Group 2";
		group2.creator = account2;
		Account[] accountOfGroup2 = {account1, account2, account4};
		group2.accounts = accountOfGroup2;
		group2.createdDate = new Date();
//		System.out.println("Group ID: " +group2.id +"   Group Name: " +group2.name +"   Creator Group: " +group2.creator.fullName
//				+"   Create Date: " +group2.createdDate +"   Account Of Group: " +group2.accounts
//				);
		
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Group 3";
		group3.creator = account3;
		Account[] accountOfGroup = {account4, account2, account3};
		group3.accounts = accountOfGroup;
		group3.createdDate = new Date();
//		System.out.println("Group ID: " +group3.id +"   Group Name: " +group3.name +"   Creator Group: " +group3.creator.fullName
//				+"   Create Date: " +group3.createdDate +"   Account Of Group: " +group3.accounts
//				);
		
		/*	Question 1:
			Kiểm tra account thứ 2
			Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
			"Nhân viên này chưa có phòng ban"
			Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là ..."
		 * 
		 */
		if(account2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		}else {
			System.out.println("Phòng ban của nhân viên này là " +account2.department.name);
		}
		
		/*	Question 3:
		 * 	Sử dụng toán tử ternary
		 */
		System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban" : "Phòng ban của nhân viên này là " +account2.department.name);
		/*
		 * Question 2:
		 * Kiểm tra account thứ 2
			Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
			Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
			này là Java Fresher, C# Fresher"
			Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người
			quan trọng, tham gia nhiều group"
			Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
			người hóng chuyện, tham gia tất cả các group"
		 */

		Group[] groupOfAccount2 = {group1, group2};
		account2.groups = groupOfAccount2;
//		System.out.println(account2.groups == null ? "1" : "2");
//		System.out.println(account2.groups.length);
		int lengthGroup;
		lengthGroup = account2.groups.length;
//		System.out.println(lengthGroup);
		
		if(lengthGroup == 0) {
			System.out.println("Nhân viên này chưa có group");
		}else if(lengthGroup == 1) {
			System.out.println("Group của nhân viên này là " +account2.groups[0].name);
		}else if(lengthGroup == 2) {
			System.out.println("Group của nhân viên này là " +account2.groups[0].name +", " +account2.groups[1].name);
		}else if(lengthGroup == 3) {
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
		}else {
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
		}
		
		/*
		 * Question 4:
			Sử dụng toán tử ternary để làm yêu cầu sau:
			Kiểm tra Position của account thứ 1
			Nếu Position = Dev thì in ra text "Đây là Developer"
			Nếu không phải thì in ra text "Người này không phải là Developer"
		 * */
		System.out.println(account1.position.name == "Developer" ? "Đây là Developer" : "Người này không phải là Developer");
		
		/*
		 * SWITCH CASE
		Question 5:
		Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
		Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
		Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
		Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
		Còn lại in ra "Nhóm có nhiều thành viên"
		 * */
		int accountsOfGroup1;
		accountsOfGroup1 = group1.accounts.length;
		System.out.println(accountsOfGroup1);
		switch(accountsOfGroup1) {
			case 1: 
				System.out.println("Nhóm có một thành viên");
				break;
			case 2: 
				System.out.println("Nhóm có hai thành viên");
				break;
			case 3: 
				System.out.println("Nhóm có ba thành viên");
				break;
			default: 
				System.out.println("Nhóm có nhiều thành viên");
		}
		
		/*
		Question 6:
			Sử dụng switch case để làm lại Question 2
		 * */
		switch(lengthGroup) {
			case 0: 
				System.out.println("Nhân viên này chưa có group");
				break;
			case 1:
				System.out.println("Group của nhân viên này là " +account2.groups[0].name);
				break;
			case 2:
				System.out.println("Group của nhân viên này là " +account2.groups[0].name +", " +account2.groups[1].name);
				break;
			case 3:
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
				break;
			default:
				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
		}
		
		
		/*
		Question 7:
			Sử dụng switch case để làm lại Question 4
		 * */
		switch(account1.position.name) {
		case "Developer":
			System.out.println("Đây là Developer");
			break;
		default:
			System.out.println("Người này không phải là Developer");
		}
		
		/*
		 * FOREACH
			Question 8:
			In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
			họ
			Question 9:
			In ra thông tin các phòng ban bao gồm: id và name
		 * */
		
		for(Account account : group1.accounts) {
			System.out.println("Email: " +account.email);
			System.out.println("Full Name: " +account.fullName);
			System.out.println("Department: " +account.department.name);
		}
		
		Department departments[] = {department1, department2, department3, department4};
		for(Department department : departments) {
			System.out.println("ID: " +department.id);
			System.out.println("Name: " +department.name);
		}
		
		/*
		 * FOR
			Question 10:
			In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
			họ theo định dạng như sau:
			Thông tin account thứ 1 là:
			Email: NguyenVanA@gmail.com
			Full name: Nguyễn Văn A
			Phòng ban: Sale
			Thông tin account thứ 2 là:
			Email: NguyenVanB@gmail.com
			Full name: Nguyễn Văn B
			Phòng ban: Marketting
		 * */
		Account accounts1[] = {account1, account2, account3, account4};
		int accLength;
		accLength = accounts1.length;
		System.out.println(accLength);
		for(int i=0; i<accLength; i++) {
			System.out.println("Thông tin account thứ " +(i+1) +" là:" );
			System.out.println("Email: " +accounts1[i].email);
			System.out.println("Full Name: " +accounts1[i].fullName);
			System.out.println("Phòng ban: " +accounts1[i].department.name);
		}
		
		/*
		 * Question 11:
			In ra thông tin các phòng ban bao gồm: id và name theo định dạng sau:
			Thông tin department thứ 1 là:
			Id: 1
			Name: Sale
			Thông tin department thứ 2 là:
			Id: 2
			Name: Marketing
		 * */
		for(int i=0; i<departments.length; i++) {
			System.out.println("Thông tin department thứ " +(i+1) +" là: ");
			System.out.println("ID: " +departments[i].id);
			System.out.println("Name: " +departments[i].name);
		}
		
		/*
		 * Question 12:
			Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		 * */
		for(int i=0; i<departments.length; i++) {
			if(i+1 > 2) {
				break;
			}
			System.out.println(">>>Thông tin department thứ " +(i+1) +" là: ");
			System.out.println("ID: " +departments[i].id);
			System.out.println("Name: " +departments[i].name);
		}
		
		/*
		 * Question 13:
		In ra thông tin tất cả các account ngoại trừ account thứ 2
		 * */
		for(int i=0; i<accLength; i++) {
			if(i+1 == 2) {
				continue;
			}
			System.out.println("Thông tin account thứ " +(i+1) +" là:" );
			System.out.println("Email: " +accounts1[i].email);
			System.out.println("Full Name: " +accounts1[i].fullName);
			System.out.println("Phòng ban: " +accounts1[i].department.name);
		}
		
	}
}
