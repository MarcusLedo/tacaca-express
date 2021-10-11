package entities;

public class PositionTitle {
	private Integer id;
	private String positionTitle;
	private Double salary;
	
	
	
	public PositionTitle(Integer id, String positionTitle) {
		this.id = id;
		this.positionTitle = positionTitle;
	}
	
	
	
	
	public PositionTitle(Integer id) {
		this.id = id;
		switch(id) {
		case 1:
			this.positionTitle = "MANAGER";
			this.salary = 10000.0;
			break;
		case 2:
			this.positionTitle = "WAITER";
			this.salary = 4000.0;
			break;
		case 3:
			this.positionTitle = "HOST";
			this.salary = 3000.0;
			break;
		case 4:
			this.positionTitle = "BARTENDER";
			this.salary = 3000.0;
			break;
		case 5:
			this.positionTitle = "CHEF";
			this.salary = 8000.0;
			break;
		case 6:
			this.positionTitle = "COOK ASSISTANT";
			this.salary = 2000.0;
			break;
		case 7:
			this.positionTitle = "BUSSER";
			this.salary = 1500.0;
			break;
		case 8:
			this.positionTitle = "CLEANER";
			this.salary = 1400.0;
			break;
		case 9:
			this.positionTitle = "CASHIER";
			this.salary = 3500.0;
			break;
		case 10:
			this.positionTitle = "ANALYST";
			this.salary = 6000.0;
			break;
		case 11:
			this.positionTitle = "MANAGER ASSISTANT";
			this.salary = 4000.0;
			break;
		case 12:
			this.positionTitle = "SUPERINTEDENT";
			this.salary = 15000.0;
			break;
		case 13:
			this.positionTitle = "DIRECTOR";
			this.salary = 20000.0;
			break;
			default:
				this.positionTitle = "NOT REGISTERED";
				this.salary = 0.0;
		}
	}



	public Double getSalary() {
		return salary;
	}


	public void setSalary(Double salary) {
		this.salary = salary;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPositionTitle() {
		return positionTitle;
	}
	public void setPositionTitle(String positionTitle) {
		this.positionTitle = positionTitle;
	}
	
}
