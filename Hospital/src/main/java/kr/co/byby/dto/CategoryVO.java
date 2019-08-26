package kr.co.byby.dto;

public class CategoryVO {

	private int ctg_no;  //ctg_no
	private String ctg_name;	//ctg_name
	private int sort_no;		//sort_no
	
	
	
	public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CategoryVO(int ctg_no, String ctg_name, int sort_no) {
		super();
		this.ctg_no = ctg_no;
		this.ctg_name = ctg_name;
		this.sort_no = sort_no;
	}



	public int getCtg_no() {
		return ctg_no;
	}



	public void setCtg_no(int ctg_no) {
		this.ctg_no = ctg_no;
	}



	public String getCtg_name() {
		return ctg_name;
	}



	public void setCtg_name(String ctg_name) {
		this.ctg_name = ctg_name;
	}



	public int getSort_no() {
		return sort_no;
	}



	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}



	@Override
	public String toString() {
		return "CategoryVO [ctg_no=" + ctg_no + ", ctg_name=" + ctg_name + ", sort_no=" + sort_no + "]";
	}
	
	
	
}
