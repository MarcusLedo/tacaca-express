package application;

import java.util.Scanner;

import ui.Menu;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		do {
			Menu.printMenu();
			System.out.printf("\n-> Enter an option: ");
			Menu.setOption(sc.nextInt());
			switch (Menu.getOption()) {
			case 1:
				System.out.println("\n**************** ADD UNITY ****************\n");
				break;
			case 2:
				System.out.println("\n**************** ADD EMPLOYEE ****************\n");

				break;
			case 3:
				System.out.println("\n**************** REMOVE BRANCH ****************\n");

				break;
			case 4:
				System.out.println("\n**************** REMOVE EMPLOYEES ****************\n");

				break;
			case 5:
				System.out.println("\n**************** PRINT UNITS ****************\n");
				break;
			case 6:
				System.out.println("\n**************** PRINT EMPLOYYES ****************\n");

			}
		} while (Menu.getOption() != 0);

		sc.close();
	}

}
