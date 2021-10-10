package ui;

public class Menu {
	
	private static Integer option;
	
	

	public static Integer getOption() {
		return option;
	}

	public static void setOption(Integer option) {
		Menu.option = option;
	}
	
	
	public static void printMainMenu() {
		System.out.println(">>> TCIMS - TACACÁ EXPRESS INTERNAL MANAGEMENT SYSTEM <<<");
		System.out.println("");
		System.out.println("1) UNITIES");
		System.out.println("2) EMPLOYEES");
		System.out.println("3) LOGISTICS");
		System.out.println("");
		System.out.println("0) EXIT");
		System.out.println("");
	}
	
	public static void printUnityMenu() {
		System.out.println(">>> TCIMS - UNITIES <<<");
		System.out.println("");
		System.out.println("11) ADD UNITY");
		System.out.println("12) UPDATE UNITY");
		System.out.println("13) DISABLE UNITY");
		System.out.println("14) LIST UNITIES");
		System.out.println("");
		System.out.println("9) BACK TO THE PREVIOUS MENU");
		System.out.println("0) EXIT");
		System.out.println("");
	}
	
	public static void printEmployeeMenu() {
		System.out.println(">>> TCIMS - EMPLOYESS <<<");
		System.out.println("");
		System.out.println("22) HIRE A NEW EMPLOYEE");
		System.out.println("23) DISMISS AN EMPLOYEE");
		System.out.println("24) UPDATE EMPLOYEE");
		System.out.println("25) CHANGE POSITION");
		System.out.println("26) LIST EMPLOYEES");
		System.out.println("27) CHECK SALARY OF EMPLOYEE");
		System.out.println("28) CHECK SALARY COST OF AN UNITY");
		System.out.println("");
		System.out.println("9) BACK TO THE PREVIOUS MENU");
		System.out.println("0) EXIT");
		System.out.println("");

	}
	
	public static void printLogisticsMenu() {
		System.out.println(">>> TCIMS - LOGISTICS <<<");
		System.out.println("");
		System.out.println("31) ANNUAL WATER BILLS");
		System.out.println("33) ANNUAL ENERGY BILLS");
		System.out.println("34 ) ANNUAL GAS BILLS");
		System.out.println("35) MONTHLY EXPENDITURES OF AN UNITY");
		System.out.println("36) LIST PROVIDERS OF AN UNITY");
		System.out.println("37) MONTHLY TOTAL EXPENDITURES");
		System.out.println("38) ANNUAL TOTAL EXPENDITURES");
		System.out.println("");
		System.out.println("9) BACK TO THE PREVIOUS MENU");
		System.out.println("0) EXIT");

	}
	
	
}
