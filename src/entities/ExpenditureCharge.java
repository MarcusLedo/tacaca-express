package entities;

import java.util.Date;

public class ExpenditureCharge {
	private Integer id;
	private Integer expenditureTypeId;
	private Integer branchId;
	private Date startDate;
	private Date endDate;
	private Double dueCharge;
	private Provider provider;
	
	
	public ExpenditureCharge(Integer id, Integer expenditureTypeId, Integer branchId, Date startDate, Date endDate,
			Double dueCharge, Provider provider) {
		super();
		this.id = id;
		this.expenditureTypeId = expenditureTypeId;
		this.branchId = branchId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dueCharge = dueCharge;
		this.provider = provider;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getExpenditureTypeId() {
		return expenditureTypeId;
	}


	public void setExpenditureTypeId(Integer expenditureTypeId) {
		this.expenditureTypeId = expenditureTypeId;
	}


	public Integer getBranchId() {
		return branchId;
	}


	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public Double getDueCharge() {
		return dueCharge;
	}


	public void setDueCharge(Double dueCharge) {
		this.dueCharge = dueCharge;
	}


	public Provider getProvider() {
		return provider;
	}


	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	
	
	
	
}
