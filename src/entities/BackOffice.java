package entities;

public class BackOffice extends Unity{

	private String nature;
	
	public BackOffice(Integer branch, String name, Integer taxPayerIdNumber, String nature) {
		super(branch, name, taxPayerIdNumber);
		this.nature = nature;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}
	
	
	
}
