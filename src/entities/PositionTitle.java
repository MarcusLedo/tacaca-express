package entities;

public class PositionTitle {
	private Integer id;
	private String positionTitle;
	
	
	
	public PositionTitle(Integer id, String positionTitle) {
		this.id = id;
		this.positionTitle = positionTitle;
	}
	
	
	
	
	public PositionTitle(Integer id) {
		this.id = id;
	}




	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPositionTitle() {
		return positionTitle;
	}
	public void setPositionTitle(String positionTitle) {
		this.positionTitle = positionTitle;
	}
	
}
