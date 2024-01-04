package java_lesson_4.Exercise5;

public class NhanVien extends CanBo{
	private String work;
	
	public void setWork(String work) {
		this.work = work;
	}
	
	public String getWork() {
		return this.work;
	}
	
	public NhanVien() {
		
	}
	
	public NhanVien(String fullName, int age, Gender gender, String address, String work) {
		super(fullName, age, gender, address);
		this.work = work;
	}
}
