package assignmentone;

import java.time.LocalDate;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;

public class TestingSystemAssignment3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
//		E1Question1();
//		E1Question2();
//		E1Question3();
//		System.out.println(E1Question4());
//		
//		E2Question1();
//		
//		E3Question1();
//		E3Question2();
//		E3Question3();
//		
//		E4Question1();
//		E4Question2();
//		E4Question3();
//		System.out.println(E4Question3("Pham  Hong Thuan   "));
//		E4Question4();
//		E4Question5();
//		E4Question6();
//		E4Question7A();
//		E4Question7B();
		
//		System.out.println(IsReverse("OK123", "321KO"));
////		IsReverse("OK", "KO");
		
//		System.out.println(countA("Count special Character"));
//		System.out.println(Reverse("Pham Hong Thuan"));
//		System.out.println(ReplaceChar("VTI Academy", 'e', '*'));
		System.out.println(ReverseString("Pham Hong Thuan"));
	}
	
	
	
	/*
	 * Exercise 1 (Optional): Datatype Casting
	 * */
	/*
	 * Question 1:
	Khai báo 2 số lương có kiểu dữ liệu là float.
	Khởi tạo Lương của Account 1 là 5240.5 $
	Khởi tạo Lương của Account 2 là 10970.055$
	Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
	Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
	 * */
	public static void E1Question1() {
		float account1 = 2540.5f;
		float account2 = 10970.055f;
		int account1s = (int) account1;
		int account2s = (int) account2;
		System.out.println("Account 1: >>>float: " +account1 +"   >>>int: "+account1s);
		System.out.println("Account 2: >>>float: " +account2 +"   >>>int: "+account2s);
	}
	
	/*
	 * Question 2:
		Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
		có số 0 ở đầu cho đủ 5 chữ số)
	 * */
	public static void E1Question2() {
		int random = ThreadLocalRandom.current().nextInt(0, 100000); //0 -> 99999
		System.out.println(random);
		while (random < 10000) {
			random = random * 10;
		}
		System.out.println(random);
	}
	
	
	/*
	 * Question 3:
		Lấy 2 số cuối của số ở Question 2 và in ra.
		Gợi ý:
		Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
		Cách 2: chia lấy dư số đó cho 100
	 * 
	 * */
	
	public static void E1Question3() {
		int random = ThreadLocalRandom.current().nextInt(0, 100000); //0 -> 99999
		int q3 = random % 100;
		System.out.println(q3);
		String q3s = String.valueOf(random);
		System.out.println(q3s.substring(3, 5));
	}
	
	
	
	/*
	 * Question 4:
		Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
	 * */
	public static double E1Question4() {
		int a;
		int b;
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter a: ");
		a = scanner.nextInt();
		System.out.print("Enter b: ");
		b = scanner.nextInt();
		float result = (float) a/b;
		return result;
	}
	
	/*
	 * Exercise 2 (Optional): Default value
		Question 1:
		Không sử dụng data đã insert từ bài trước, tạo 1 array Account và khởi
		tạo 5 phần tử theo cú pháp (sử dụng vòng for để khởi tạo):
		 Email: "Email 1"
		 Username: "User name 1"
		 FullName: "Full name 1"
		 CreateDate: now
	 * */
	
	public static void E2Question1() {
		Account[] accounts = new Account[5];
		int accLength = accounts.length;
		for (int i = 0; i < accLength; i++) {
			accounts[i] = new Account();
			accounts[i].email = "Email " +(i+1);
			accounts[i].userName = "User name " +(i+1);
			accounts[i].fullName = "Full name " +(i+1);
			accounts[i].createdDate = LocalDate.now();
		}
		
		for (Account account : accounts) {
			System.out.println("Email: " +account.email);
			System.out.println("Username: " +account.userName);
			System.out.println("FullName: " +account.fullName);
			System.out.println("CreateDate: " +account.createdDate);
		}
	}
	
	/*
	 * Exercise 3(Optional): Boxing & Unboxing
		Question 1:
		Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
		Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
		float có 2 số sau dấu thập phân)
	 * */
	
//	Boxing
	public static void E3Question1() {
		int x = 5000;
		Float y = Float.valueOf(x);
		System.err.println(y);
	}
	
	/*
	 * Question 2:
	Khai báo 1 String có value = "1234567"
	Hãy convert String đó ra số int
	 * */
	public static void E3Question2() {
		String q2 = "1234567";
		try {
			int q2s = Integer.parseInt(q2);
			System.out.println("q2: " +q2 + " is of type " + q2.getClass().getSimpleName());
			System.out.println("q2s: " +q2s + " is of type " + ((Object)q2s).getClass().getSimpleName());
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	 * Question 3:
	Khởi tạo 1 số Integer có value là chữ "1234567"
	Sau đó convert số trên thành datatype int
	 * */
	public static void E3Question3() {
		Integer a = new Integer(5);
		int b = a.intValue();
		System.out.println(b + " is of type " + ((Object)b).getClass().getSimpleName());
	}
	
	
	/*
	 * Exercise 4: String
	 * Question 1:
	Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các từ có
	thể cách nhau bằng nhiều khoảng trắng );
	 * */
	public static void E4Question1() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter text: ");
		String inputText = scanner.nextLine();
		System.out.println(inputText);
		String[] arr = inputText.split(" ");
		System.out.println("Lenght of text: " +arr.length);
	}
	
	/*
	 * Question 2:
		Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
	 * */
	public static void E4Question2() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter s1: ");
		String s1 = scanner.nextLine();
		System.out.print("Enter s2: ");
		String s2 = scanner.nextLine();
		String s3 = s1.concat(" ").concat(s2);
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);
	}
	
	/*
	 * Question 3:
		Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chư
		viết hoa chữ cái đầu thì viết hoa lên
	 * */
	public static void E4Question3() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter Your Name: ");
		String yname = scanner.nextLine();
		String[] arr = yname.toLowerCase().split(" ");
		String result = "";
		for (int i = 0; i < arr.length; i++) {
			char tempChar = Character.toUpperCase(arr[i].charAt(0));
			String tempString = arr[i].replace(arr[i].charAt(0), tempChar);
			result  = result  + tempString + " ";
		}
		System.out.println(result);
//		char firstLetter = yname.charAt(0);
//		char capitalFirstletter = Character.toUpperCase(firstLetter);
//		String result = yname.replace(yname.charAt(0), capitalFirstletter);
//		System.out.println("Your name: "+result);
	}
	
	
	public static String E4Question3(String input) {
		String result = "";
		String[] arr = input.toLowerCase().split(" ");
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == "") {
				continue;
			}
			char tempChar = Character.toUpperCase(arr[i].charAt(0));
			String tempString = arr[i].replace(arr[i].charAt(0), tempChar);
			result  = result  + tempString + " ";
		}
//		System.out.println(result);
		return result.trim();
	}
	
	/*
	 * Question 4:
		Viết chương trình để người dùng nhập vào tên in từng ký tự trong tên
		của người dùng ra
		VD:
		Người dùng nhập vào "Nam", hệ thống sẽ in ra
		"Ký tự thứ 1 là: N"
		"Ký tự thứ 1 là: A"
		"Ký tự thứ 1 là: M"
	 * */
	public static void E4Question4() {
		Scanner scanner = new Scanner(System.in);	
		System.out.print("Enter name: ");
		String name = scanner.nextLine();
		char[] arr = name.toUpperCase().toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == (char)(' ')) {
				continue;
			}
			System.out.println("Ký tự thứ "  +(i+1) +" là: " +arr[i]);
		}
	}
	
	/*
	Question 5:
	Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người
	dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
	 * */
	
	public static void E4Question5() {
		Scanner scanner = new Scanner(System.in);	
		System.out.print("Enter First name: ");
		String firstName = scanner.nextLine();
		System.out.print("Enter Last name: ");
		String lastName = scanner.nextLine();
		String fullName = firstName.concat(" ").concat(firstName);
		System.out.println("Full name: " +firstName +" " +lastName);
		System.out.println("Full name: " +fullName);
	}
	
	/*
	 * Question 6:
		Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
		sau đó hệ thống sẽ tách ra họ, tên , tên đệm
		VD:
		Người dùng nhập vào "Nguyễn Văn Nam"
		Hệ thống sẽ in ra
		"Họ là: Nguyễn"
		"Tên đệm là: Văn"
		"Tên là: Nam"
	 * */
	public static void E4Question6() {
		Scanner scanner = new Scanner(System.in);	
		System.out.print("Enter Full name: ");
		String fullName = scanner.nextLine();

		String[] arr = fullName.split(" ");
		int len = arr.length;
		String firstName = arr[0];
		String lastName = arr[len-1];
		String midName = "";
		for (int i = 1; i < len-1; i++) {
			midName = midName +arr[i] +" ";
		}
		System.out.println("Họ là: " +firstName);
		System.out.println("Tên đệm: " +midName);
		System.out.println("Tên là: " +lastName);
	}
	
	/*
	 * Question 7:
		Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
		chuẩn hóa họ và tên của họ như sau:
		a) Xóa dấu cách ở đầu và cuối và giữa của chuỗi người dùng nhập
		vào
		VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
		chuẩn hóa thành "nguyễn văn nam"
		b) Viết hoa chữ cái mỗi từ của người dùng
		VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
		chuẩn hóa thành "Nguyễn Văn Nam"
	 * */
	public static void E4Question7A() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter Full name: ");
		String fullName = scanner.nextLine();
		String newFullName = fullName.trim();
		System.out.println("Before: \"" +fullName +"\"");
		System.out.println(">After: \"" +newFullName +"\"");
	}
	
	public static void E4Question7B() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter Full name: ");
		String fullName = scanner.nextLine();
		System.out.println("Before: \"" +fullName +"\"");
		System.out.println(">After: \"" +E4Question3(fullName) +"\"");
	}
	
	/*
	 * Question 10 (Optional):
		Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không.
		Nếu có xuất ra “OK” ngược lại “KO”.
		Ví dụ “word” và “drow” là 2 chuỗi đảo ngược nhau.
	 * */
//	public static boolean IsReverse(String a, String b) {
//		boolean result = true;
//		char[] as = a.toCharArray();
//		char[] bs = b.toCharArray();
//		for (int i = 0; i < as.length; i++) {
//			for (int j = bs.length-1; j >= 0; j--) {
//				if (as[i] != bs[j]) {
//					result = false;
//					break;
//				}
//			System.out.println(as[i] + "  " +bs[j]);
//			}
//		}
//		return result;
//	}
	
	/*
	 * Question 11 (Optional): Count special Character
		Tìm số lần xuất hiện ký tự "a" trong chuỗi
	 * */
	public static int countA(String s) {
		int count = 0;
		char[] arr = s.toCharArray();
//		char temp = 'a';
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == 'a') {
				count+=1;
			}
		}
		return count;
	}
	
	/*
	 * Question 12 (Optional): Reverse String
		Đảo ngược chuỗi sử dụng vòng lặp
	 * */
	public static String Reverse(String a) {
		String result = "";
		char temp;
		for (int i = 0; i < a.length(); i++) {
			temp = a.charAt(i);
			result = temp + result;
		}
		return result;
	}
	
	/*
	 * Question 14 (Optional): Replace character
		Cho một chuỗi str, chuyển các ký tự được chỉ định sang một ký tự khác
		cho trước.
		Ví dụ:
		"VTI Academy" chuyển ký tự 'e' sang '*' kết quả " VTI Acad*my"
	 * */
	public static String ReplaceChar(String a, char b, char c) {
		String result = "";
		char[] arr = a.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] == b) {
				arr[i] = c;
				result += arr[i];
			} else {
				result += arr[i];
			}
		}
		return result;
	}
	
	/*
	 * Question 15 (Optional): Revert string by word
		Đảo ngược các ký tự của chuỗi cách nhau bởi dấu cách mà không dùng
		thư viện.
		Ví dụ: " I am developer " => "developer am I".
		Các ký tự bên trong chỉ cách nhau đúng một dấu khoảng cách.
		Gợi ý: Các bạn cần loại bỏ dấu cách ở đầu và cuối câu, thao tác cắt
		chuỗi theo dấu cách
	 * */
	public static String ReverseString(String a) {
		String result = "";
		String[] arr = a.trim().split(" ");
		for (int i = arr.length-1; i >= 0; i--) {
			result = result + " " +arr[i];
		}
		return result.trim();
	}
	
	
	
	//
}
