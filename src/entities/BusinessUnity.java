package entities;

public class BusinessUnity extends Unity{

	private Integer size;
	
	public BusinessUnity(Integer branch, String name, Integer companiesHouseId, Email email, PhoneNumber phone, Integer size) {
		super(branch, name, companiesHouseId, email, phone);
		this.size = size;
	}
	

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}
		
}
