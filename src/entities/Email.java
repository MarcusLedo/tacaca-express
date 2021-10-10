package entities;

public class Email {
	
	private Integer id;
	private String email;
	private String label;
	private Integer responsible;
	
	
	public Email(Integer id, String email, String label, Integer responsible) {
		this.id = id;
		this.email = email;
		this.label = label;
		this.responsible = responsible;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getLabel() {
		return label;
	}


	public void setLabel(String label) {
		this.label = label;
	}


	public Integer getResponsible() {
		return responsible;
	}


	public void setResponsible(Integer responsible) {
		this.responsible = responsible;
	}
	
	
	
}
