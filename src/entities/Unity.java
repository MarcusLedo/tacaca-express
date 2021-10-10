package entities;

import java.util.ArrayList;
import java.util.List;

public abstract class Unity {
	private Integer branch;
	private String name;
	private Integer companiesHouseId;
	private Email email;
	private PhoneNumber phone;
	private List<Employee> employees = new ArrayList<>(); 
	private List<ExpenditureCharge> expenditure = new ArrayList<>();
	private List<MonthlyUnityExpenditure> monthlyExpenditure = new ArrayList<>();
	
	


	public Unity(Integer branch, String name, Integer companiesHouseId, Email email, PhoneNumber phone,
			List<Employee> employees, List<ExpenditureCharge> expenditure,
			List<MonthlyUnityExpenditure> monthlyExpenditure) {
		this.branch = branch;
		this.name = name;
		this.companiesHouseId = companiesHouseId;
		this.email = email;
		this.phone = phone;
		this.employees = employees;
		this.expenditure = expenditure;
		this.monthlyExpenditure = monthlyExpenditure;
	}



	public Unity(Integer branch, String name, Integer taxPayerIdNumber, Email email) {
		this.branch = branch;
		this.name = name;
		this.companiesHouseId = taxPayerIdNumber;
		this.email = email;
	}

	
	
	public PhoneNumber getPhone() {
		return phone;
	}

	public void setPhone(PhoneNumber phone) {
		this.phone = phone;
	}



	public Integer getBranch() {
		return branch;
	}

	public void setBranch(Integer branch) {
		this.branch = branch;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCompaniesHouseId() {
		return companiesHouseId;
	}

	public void setCompaniesHouseId(Integer taxPayerIdNumber) {
		this.companiesHouseId = taxPayerIdNumber;
	}
	
	
	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public void printUnits(ArrayList<Unity> unity) {
		
	}
	
	public void addUnity(Unity unity) {
		
	}
	
	public void addEmployee(Employee employee) {
		employees.add(employee);
	}
	
	public void addExpenditure(ExpenditureCharge expenditure) {
		this.expenditure.add(expenditure);
	}



	public List<ExpenditureCharge> getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(List<ExpenditureCharge> expenditure) {
		this.expenditure = expenditure;
	}
	

	
	public List<MonthlyUnityExpenditure> getMonthlyExpenditure() {
		return monthlyExpenditure;
	}



	public void setMonthlyExpenditure(List<MonthlyUnityExpenditure> monthlyExpenditure) {
		this.monthlyExpenditure = monthlyExpenditure;
	}



	public void addMonthlyUnityExpenditure(MonthlyUnityExpenditure expenditure) {
		monthlyExpenditure.add(expenditure);
	}
}
