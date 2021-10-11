package application;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import entities.Address;
import entities.BackOffice;
import entities.BusinessUnity;
import entities.Employee;
import entities.Unity;
import ui.Menu;
import utilities.AutoInput;

public class Main {
	public static void main(String[] args) throws ParseException {
		Scanner sc = new Scanner(System.in);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		AutoInput.loadUnityInput();
		AutoInput.loadEmployeeInput();
		List<Unity> unity = AutoInput.getUnity();

		do {
			Menu.printMainMenu();
			System.out.printf("-> Enter an option: ");
			Menu.setOption(sc.nextInt());
			System.out.println("___________________________________________________\n");
			switch (Menu.getOption()) {
			case 1:
				do {
					Menu.printUnityMenu();
					System.out.printf("-> Enter an option: ");
					Menu.setOption(sc.nextInt());
					System.out.println("");
					switch (Menu.getOption()) {
					case 11:
						System.out.println("\n--- ADD UNITY ---\n");
						// ************************ BASIC DATA ************************
						System.out.print("\n-> Branch: ");
						Integer branch = sc.nextInt();
						sc.nextLine();
						System.out.print("\n-> Name: ");
						String name = sc.nextLine();
						System.out.print("\n-> Companies house Id: ");
						String companiesHouseId = sc.nextLine();

						// ************************ EMAIL DATA ************************
						sc.nextLine();
						System.out.print("\n-> Email name: ");
						String eName = sc.nextLine();

						// ************************ PHONE NUMBER DATA ************************
						System.out.print("\n-> Phone number: ");
						String phoneNumber = sc.nextLine();

						// ************************ UNITY TYPE ************************
						System.out.println("");
						int uType;
						System.out.println("What will be the unity type?");
						System.out.println("0 - Business");
						System.out.println("1 - Back Office");
						uType = sc.nextInt();

						if (uType == 0) {
							System.out.print("\n-> Unity size: ");
							Integer size = sc.nextInt();
							unity.add(new BusinessUnity(branch, name, companiesHouseId, eName, phoneNumber, size));
						} else {
							System.out.print("\n-> Unity nature: ");
							String nature = sc.nextLine();
							unity.add(new BackOffice(branch, name, companiesHouseId, eName, phoneNumber, nature));
						}
						System.out.println("\nUnity Created.\n");
						break;
					case 12:
						System.out.println("\n--- UPDATE UNITY ---\n");

						break;
					case 13:
						System.out.println("\n--- DISABLE UNITY ---\n");
						break;
					case 14:
						System.out.println("\n--- LIST UNITIES ---\n");
						for (Unity x : unity) {
							System.out.println(x);
							System.out.println("____________________________________________________\n");
						}
					}
				} while (Menu.getOption() != 9);

				break;
			case 2:
				do {
					Menu.printEmployeeMenu();
					System.out.printf("-> Enter an option: ");
					Menu.setOption(sc.nextInt());
					System.out.println("");
					switch (Menu.getOption()) {
					case 22:
						System.out.println("\n--- HIRE A NEW EMPLOYEE ---\n");
						int flag = 0;
						System.out.print("\n-> Enter the unity branch that you desire to hire this employee: ");
						int branch = sc.nextInt();

						for (Unity x : unity) {
							if (x.getBranch() == branch) {
								flag = 1;
								System.out.print("\n-> Employee ID: ");
								Integer empId = sc.nextInt();
								sc.nextLine();
								System.out.print("\n-> Name: ");
								String name = sc.nextLine();
								System.out.print("\n-> Gender: ");
								String gender = sc.nextLine();

								// ************************ ADDRESS DATA ************************
								System.out.print("\n-> Street Address 1: ");
								String streetA1 = sc.nextLine();
								System.out.print("\n-> Street Address 2: ");
								String streetA2 = sc.nextLine();
								System.out.print("\n-> Borough: ");
								String borough = sc.nextLine();
								System.out.print("\n-> City: ");
								String city = sc.nextLine();
								System.out.print("\n-> State: ");
								String state = sc.nextLine();
								System.out.print("\n-> Zip code: ");
								String zipCode = sc.nextLine();
								Address address = new Address(streetA1, streetA2, borough, city, state, zipCode);
								// ***************************************************************

								System.out.print("\n-> Family Name: ");
								String familyName = sc.nextLine();
								System.out.print("\n-> Email: ");
								String empEmail = sc.nextLine();
								System.out.print("\n-> Area code: ");
								String areaCode = sc.nextLine();
								System.out.print("\n-> Mobile: ");
								String mobile = sc.nextLine();
								System.out.print("\n-> Isurance Number: ");
								String insuranceNumber = sc.nextLine();
								System.out.print("\n-> Birth Place: ");
								String birthPlace = sc.nextLine();
								System.out.print("\n-> Father name: ");
								String fatherName = sc.nextLine();
								System.out.print("\n-> Mother Name: ");
								String motherName = sc.nextLine();

								System.out.print("\n-> Hiring date (dd/MM/yyyy): ");
								String date1 = sc.nextLine();
								Date hiringDate = (Date) sdf.parse(date1);
								System.out.print("\n-> Dismissal date (dd/MM/yyyy): ");
								String date2 = sc.nextLine();
								Date dimissalDate = (Date) sdf.parse(date2);
								System.out.print("\n-> Birth date (dd/MM/yyyy): ");
								String date3 = sc.nextLine();
								Date birthDate = (Date) sdf.parse(date3);

								System.out.print("\n-> Martial Status: ");
								String martialStatus = sc.nextLine();
								System.out.print("\n-> Children: ");
								Integer children = sc.nextInt();
								sc.nextLine();
								System.out.print("\n-> Disabled Person (true/false): ");
								boolean disPerson = sc.nextBoolean();
								System.out.print("\n-> Health Plan (true/false): ");
								boolean healthPlan = sc.nextBoolean();
								System.out.print("\n-> License type: ");
								String dLicenseType = sc.nextLine();

								Employee employee = new Employee(empId, name, gender, address, familyName, empEmail,
										areaCode, mobile, insuranceNumber, birthPlace, fatherName, motherName,
										hiringDate, dimissalDate, birthDate, martialStatus, children, disPerson,
										healthPlan, dLicenseType, x.getBranch());

								x.addEmployee(employee);
							}
							if (flag == 0)
								System.out.println("Unity not found!");
							else
								System.out.println("Employee Hired!");
						}

						break;
					case 23:
						System.out.println("\n--- DISMISS AN EMPLOYEE ---\n");
						break;
					case 24:
						System.out.println("\n--- UPDATE EMPLOYEE ---\n");
						break;
					case 25:
						System.out.println("\n--- CHANGE POSITION ---\n");
						break;
					case 26:
						System.out.println("\n--- LIST EMPLOYEES ---\n");
						flag = 0;
						System.out.print("\n-> Enter the unity branch that you desire to check: ");
						branch = sc.nextInt();
						for(Unity x : unity) {
							if (x.getBranch() == branch) {
								flag = 1;
								for(Employee y : x.getEmployees())
									System.out.println(y + "\n\n");
							}
						}
						if (flag == 0)
							System.out.println("Unity not found!");
						break;
					case 27:
						System.out.println("\n--- CHECK SALARY OF EMPLOYEE ---\n");
						break;
					case 28:
						System.out.println("\n--- CHECK SALARY COST OF AN UNITY ---\n");
					}
				} while (Menu.getOption() != 9);
				break;
			case 3:
				do {
					Menu.printLogisticsMenu();
					System.out.printf("-> Enter an option: ");
					Menu.setOption(sc.nextInt());
					System.out.println("");
					switch (Menu.getOption()) {
					case 31:
						System.out.println("\n--- ANNUAL WATER BILLS ---\n");
						break;
					case 32:
						System.out.println("\n--- ANNUAL ENERGY BILLS ---\n");
						break;
					case 33:
						System.out.println("\n--- ANNUAL GAS BILLS ---\n");
						break;
					case 34:
						System.out.println("\n--- MONTHLY EXPENDITURES OF AN UNITY ---\n");
						break;
					case 35:
						System.out.println("\n--- LIST PROVIDERS OF AN UNITY ---\n");
						break;
					case 36:
						System.out.println("\n--- MONTHLY TOTAL EXPENDITURESS ---\n");
						break;
					case 37:
						System.out.println("\n--- ANNUAL TOTAL EXPENDITURES ---\n");
					}
				} while (Menu.getOption() != 9);
			}
		} while (Menu.getOption() != 0);

		sc.close();
	}

}
