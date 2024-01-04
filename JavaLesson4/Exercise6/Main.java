package java_lesson_4.Exercise6;

public class Main {
	public static void main(String[] args) {
		VietnamesePhone phone = new VietnamesePhone();
        phone.insertContact("test1", "123.123.123");
        phone.insertContact("test2", "246.246.246");
        System.out.println(phone.searchContact("test2"));
	}
}
