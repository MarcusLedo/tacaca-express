package entities;

import java.util.Date;

public class UnityPremises {
	
	private Integer id;
	private Integer branchId;
	private Date openingDate;
	private Date closingDate;
	private String ocupacao;
	private Address address;
	
	
	
	public UnityPremises(Integer id, Integer branchId, Date openingDate, Date closingDate, String ocupacao, Address address) {
		this.id = id;
		this.branchId = branchId;
		this.openingDate = openingDate;
		this.closingDate = closingDate;
		this.ocupacao = ocupacao;
		this.address = address;
	}
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBranchId() {
		return branchId;
	}
	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}
	public Date getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}
	public Date getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}
	public String getOcupacao() {
		return ocupacao;
	}
	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
	
}
