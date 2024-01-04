package java_lesson_4.Exercise5;

public class CanBo {
	private String fullName;
	private int age;
	private Gender gender;
	private String address;
	
	public CanBo() {
		
	}
	
	public CanBo(String fullName, int age, Gender gender, String address) {
		this.fullName = fullName;
		this.age = age;
		this.gender = Gender.UNKNOWN;
		this.address = address;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getFullName() {
		return this.fullName;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	
	public Gender getGender() {
		return this.gender;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
