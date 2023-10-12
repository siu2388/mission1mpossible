package dto;

public class Category {
	private int id;
	private String cat;

	public Category() {
	}

	public Category(int id, String cat) {
		this.id = id;
		this.cat = cat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

}
