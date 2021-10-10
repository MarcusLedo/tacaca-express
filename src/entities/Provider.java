package entities;

public class Provider {
	private Integer id;
	private String companiesHouseId;
	private String company;
	private String areaCode;
	private String phone;
	private String email;
	
	
	public Provider(Integer id, String companiesHouseId, String company, String areaCode, String phone, String email) {
		this.id = id;
		this.companiesHouseId = companiesHouseId;
		this.company = company;
		this.areaCode = areaCode;
		this.phone = phone;
		this.email = email;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getCompaniesHouseId() {
		return companiesHouseId;
	}


	public void setCompaniesHouseId(String companiesHouseId) {
		this.companiesHouseId = companiesHouseId;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
}
