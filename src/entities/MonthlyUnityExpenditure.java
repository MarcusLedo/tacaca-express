package entities;

import java.util.Date;

public class MonthlyUnityExpenditure {
	private Integer id;
	private Date reference;
	private Double value;
	private ExpenditureType expendituretype;
	
	
	public MonthlyUnityExpenditure(Integer id, Date reference, Double value, ExpenditureType expendituretype) {
		this.id = id;
		this.reference = reference;
		this.value = value;
		this.expendituretype = expendituretype;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getReference() {
		return reference;
	}
	public void setReference(Date reference) {
		this.reference = reference;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}


	public ExpenditureType getExpendituretype() {
		return expendituretype;
	}


	public void setExpendituretype(ExpenditureType expendituretype) {
		this.expendituretype = expendituretype;
	}
	
	
	
	
}
