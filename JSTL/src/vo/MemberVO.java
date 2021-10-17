package vo;

public class MemberVO {
	private String name;
	private String age;
	private String gender;
	private String addr;
	private String favFood;
	
	public MemberVO(String name , String age, String gender, String addr, String favFood) {
		
		this.name=name;
		this.age=age;
		this.gender=gender;
		this.addr=addr;
		this.favFood=favFood;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getFavFood() {
		return favFood;
	}
	public void setFavFood(String favFood) {
		this.favFood = favFood;
	}
	
	
}
