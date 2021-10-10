package entities;

public class BusinessUnity extends Unity{
	
	private Integer size;
	
	
	public BusinessUnity(Integer branch, String name, Integer taxPayerIdNumber, Integer size, Email email) {
		super(branch, name, taxPayerIdNumber, email);
		this.size = size;
	}
	

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}
		
}
