package java_lesson_4.Exercise4;

public class Student {
	private long id;
	private String name;
	private String hometown;
	private float point;
	
	public Student() {
		
	}
	
	public Student(String name, String hometown) {
		this.name = name;
		this.hometown = hometown;
		this.point = 0;
	}
	
	public long getId() {
		return this.id;
	}

	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getHometown() {
		return this.hometown;
	}
	
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	
	public float getPoint() {
		return this.point;
	}
	
	public void setPoint(float point) {
		this.point = point;
	}
	
	public float editPoint(float a) {
		return point+=a;
	}
	
	public void infoStudent() {
		System.out.println("Name: " +name);
		System.out.println("Point: " +point);
		
		if (point <= 4.0) {
			System.out.println("Học lực: Yếu");
		} else if (point > 4.0 && point <= 6.0) {
			System.out.println("Học lực: Trung binh");
		} else if (point > 6.0 && point <= 8.0) {
			System.out.println("Học lực: Kha");
		} else {
			System.out.println("Học lực: Gioi");
		}
	}
	
	public static void main(String[] args) {
		Student student1 = new Student("Pham Hong Thuan", "Da Nang");
		student1.infoStudent();
		student1.setPoint(8.4f);
		student1.infoStudent();
	}
}
