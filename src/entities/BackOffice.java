package entities;

import java.util.List;

public class BackOffice extends Unity{

	private String nature;
	

	
	
	public BackOffice(Integer branch, String name, String companiesHouseId, String email, String phone,
			UnityPremises premises, String nature) {
		super(branch, name, companiesHouseId, email, phone, premises);
		this.nature = nature;
	}
	
	
	

	public BackOffice(Integer branch, String name, String companiesHouseId, String email, String phone,
			List<Employee> employees, List<ExpenditureCharge> expenditure,
			List<MonthlyUnityExpenditure> monthlyExpenditure) {
		super(branch, name, companiesHouseId, email, phone, employees, expenditure, monthlyExpenditure);
		// TODO Auto-generated constructor stub
	}




	public BackOffice(Integer branch, String name, String companiesHouseId, String email, String phone,
			UnityPremises premises) {
		super(branch, name, companiesHouseId, email, phone, premises);
		// TODO Auto-generated constructor stub
	}




	public BackOffice(Integer branch, String name, String companiesHouseId, String email, String phone, String nature) {
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
