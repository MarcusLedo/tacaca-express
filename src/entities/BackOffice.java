package entities;

public class BackOffice extends Unity{
	
	private String nature;
	
	public BackOffice(Integer branch, String name, Integer companiesHouseId, Email email, PhoneNumber phone, String nature) {
		super(branch, name, companiesHouseId, email, phone);
		this.nature = nature;
	}


	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}
	
	
	
}
