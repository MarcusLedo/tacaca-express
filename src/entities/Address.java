package entities;

public class Address {
	private String streetAddress;
	private String streetAddress2;
	private String borough;
	private String city;
	private String state;
	private String zipCode;
	
	
	
	public Address(String streetAddress, String streetAddress2, String borough, String city, String state, String zipCode) {
		this.streetAddress = streetAddress;
		this.streetAddress2 = streetAddress2;
		this.borough = borough;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}
	
	
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getStreetAddress2() {
		return streetAddress2;
	}
	public void setStreetAddress2(String streetAddress2) {
		this.streetAddress2 = streetAddress2;
	}
	public String getBorough() {
		return borough;
	}
	public void setBorough(String borough) {
		this.borough = borough;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	
	
}
