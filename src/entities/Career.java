package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Career {
	private Integer id;
	private Integer branchId;
	private Date startDate;
	private Date endDate;
	private PositionTitle position;

	public Career(Integer id, Integer branchId, Date startDate, Date endDate, PositionTitle position) {
		this.id = id;
		this.branchId = branchId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.position = position;
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

	public PositionTitle getPosition() {
		return position;
	}

	public void setPosition(PositionTitle position) {
		this.position = position;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		
		return "Position: " + this.position.getPositionTitle() + "\n" + "Start date: " + sdf.format(this.getStartDate()) + "\n"
				+ "End date: " + sdf.format(this.getEndDate()) + "\n";
	}

}
