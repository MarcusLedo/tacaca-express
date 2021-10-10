package entities;

public class ExpenditureType {
	private Integer id;
	private String expenditureType;
	
	
	
	public ExpenditureType(Integer id, String expenditureType) {
		super();
		this.id = id;
		this.expenditureType = expenditureType;
	}
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getExpenditureType() {
		return expenditureType;
	}
	public void setExpenditureType(String expenditureType) {
		this.expenditureType = expenditureType;
	}
	
}
