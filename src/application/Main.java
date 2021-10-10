package application;

import java.util.Scanner;

import entities.*;
import ui.Menu;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Unity unityEx = new BusinessUnity(10, "unityEx", 000000003, 100);
		int i = 0;
		
		//Teste
		do {
			int id = i;
			System.out.println("Enter employee data: ");
			System.out.printf("\n ->Name: ");
			String name = sc.nextLine();
			System.out.printf("\n Gender: ");
			String gender = sc.nextLine();
			Employee eployee = new Employee(id, name, gender);
			unityEx.addEmployee(eployee);
			i++;
		}while(i < 3);
		
		for(Employee x : unityEx.getEmployees())
			System.out.println(x);
		//*********************************
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
