package entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Employee {
	private Integer idEmployee;
	private String name;
	private String gender;
	private Address address;
	private String familyName;
	private String email;
	private String areaCode;
	private String mobile;
	private String insuranceNumber;
	private String placeBirth;
	private String fatherName;
	private String motherName;
	private Date hiringDate;
	private Date dismissalDate;
	private Date birthDate;
	private String maritalStatus;
	private Integer children;
	private boolean disabledPerson;
	private boolean healthPlan;
	private String typeDriverLicense;
	private List<Career> career = new ArrayList<>();

	
	

	public Employee(Integer idEmployee, String name, String gender, Address address, String familyName, String email,
			String areaCode, String mobile, String insuranceNumber, String placeBirth, String fatherName,
			String motherName, Date hiringDate, Date dismissalDate, Date birthDate, String maritalStatus,
			Integer children, boolean disabledPerson, boolean healthPlan, String typeDriverLicense,
			List<Career> career) {
		this.idEmployee = idEmployee;
		this.name = name;
		this.gender = gender;
		this.address = address;
		this.familyName = familyName;
		this.email = email;
		this.areaCode = areaCode;
		this.mobile = mobile;
		this.insuranceNumber = insuranceNumber;
		this.placeBirth = placeBirth;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.hiringDate = hiringDate;
		this.dismissalDate = dismissalDate;
		this.birthDate = birthDate;
		this.maritalStatus = maritalStatus;
		this.children = children;
		this.disabledPerson = disabledPerson;
		this.healthPlan = healthPlan;
		this.typeDriverLicense = typeDriverLicense;
		this.career = career;
	}

	public Employee(Integer idEmployee, String name, String gender, Address address) {
		this.idEmployee = idEmployee;
		this.name = name;
		this.gender = gender;
		this.address = address;
	}

	public Employee(Integer idEmployee, String name, String gender) {
		this.idEmployee = idEmployee;
		this.name = name;
		this.gender = gender;
	}
	

	public List<Career> getCareer() {
		return career;
	}

	public void setCareer(List<Career> career) {
		this.career = career;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getInsuranceNumber() {
		return insuranceNumber;
	}

	public void setInsuranceNumber(String insuranceNumber) {
		this.insuranceNumber = insuranceNumber;
	}

	public String getPlaceBirth() {
		return placeBirth;
	}

	public void setPlaceBirth(String placeBirth) {
		this.placeBirth = placeBirth;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public Date getHiringDate() {
		return hiringDate;
	}

	public void setHiringDate(Date hiringDate) {
		this.hiringDate = hiringDate;
	}

	public Date getDismissalDate() {
		return dismissalDate;
	}

	public void setDismissalDate(Date dismissalDate) {
		this.dismissalDate = dismissalDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public Integer getChildren() {
		return children;
	}

	public void setChildren(Integer children) {
		this.children = children;
	}

	public boolean isDisabledPerson() {
		return disabledPerson;
	}

	public void setDisabledPerson(boolean disabledPerson) {
		this.disabledPerson = disabledPerson;
	}

	public boolean isHealthPlan() {
		return healthPlan;
	}

	public void setHealthPlan(boolean healthPlan) {
		this.healthPlan = healthPlan;
	}

	public String getTypeDriverLicense() {
		return typeDriverLicense;
	}

	public void setTypeDriverLicense(String typeDriverLicense) {
		this.typeDriverLicense = typeDriverLicense;
	}

	public Integer getIdEmployee() {
		return idEmployee;
	}

	public void setIdEmployee(Integer idEmployee) {
		this.idEmployee = idEmployee;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public void addCareer(Career career) {
		this.career.add(career);
	}

	@Override
	public String toString() {
		return idEmployee + " // " + name + " // " + gender;
	}
}