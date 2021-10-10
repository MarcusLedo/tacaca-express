package entities;

import java.util.ArrayList;
import java.util.List;

public abstract class Unity {
	private Integer branch;
	private String name;
	private Integer taxPayerIdNumber;
	private List<Employee> employees = new ArrayList<>(); 
	
	
	
	public Unity(Integer branch, String name, Integer taxPayerIdNumber) {
		this.branch = branch;
		this.name = name;
		this.taxPayerIdNumber = taxPayerIdNumber;
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

	public Integer getTaxPayerIdNumber() {
		return taxPayerIdNumber;
	}

	public void setTaxPayerIdNumber(Integer taxPayerIdNumber) {
		this.taxPayerIdNumber = taxPayerIdNumber;
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
}
