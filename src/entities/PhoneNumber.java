package entities;

public class PhoneNumber {

	private Integer id;
	private String areaCode;
	private String phone;
	
	
	public PhoneNumber(Integer id, String areaCode, String phone) {
		this.id = id;
		this.areaCode = areaCode;
		this.phone = phone;
	}
	
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
