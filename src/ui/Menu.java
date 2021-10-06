package ui;

public class Menu {
	
	private static Integer option;
	
	

	public static Integer getOption() {
		return option;
	}

	public static void setOption(Integer option) {
		Menu.option = option;
	}
	
	
	public static void printMenu() {
		System.out.println("**************** MENU ****************");
		System.out.println("1-) Add unity");
		System.out.println("2-) Add employee");
		System.out.println("3-) Remove unity");
		System.out.println("4-) Remove employee");
		System.out.println("5-) Print units");
		System.out.println("6-) Print employees");
		System.out.println("0-) Exit");
	}
}
