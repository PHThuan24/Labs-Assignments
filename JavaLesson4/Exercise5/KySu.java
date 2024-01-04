package java_lesson_4.Exercise5;

public class KySu extends CanBo{
	private String industry;
	
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	public String getIndustry() {
		return this.industry;
	}
	
	public KySu() {
		
	}
	
	public KySu(String fullName, int age, Gender gender, String address, String industry) {
		super(fullName, age, gender, address);
		this.industry = industry;
	}
}
