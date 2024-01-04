package java_lesson_4.Exercise5;

public class CongNhan extends CanBo{
	private byte level; //1->10
	
	public void setLevel(byte level) {
		this.level = level;
	}
	
	public byte getLevel() {
		return this.level;
	}
	
	
	public CongNhan() {
		
	}
	
	public CongNhan(String fullName, int age, Gender gender, String address, byte level) {
		super(fullName, age, gender, address);
		this.level = level;
	}
}
