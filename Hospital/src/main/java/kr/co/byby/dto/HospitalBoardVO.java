package kr.co.byby.dto;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class HospitalBoardVO {
	private int no;
	
	@Length(min=2, max=50, message="2글자 이상 50글자 이하로 입력하세요")
	@NotEmpty(message="필수항목입니다")
	private String title;
	private String category;
	
	@NotEmpty(message="필수항목입니다")
	private String content;
	private int viewcnt;
	private String wrt_date;
	private String memberid;
	
	
	public HospitalBoardVO() {
		// TODO Auto-generated constructor stub
	}


	public HospitalBoardVO(int no, String title, String category, String content, int viewcnt, String wrt_date,
			String memberid) {
		super();
		this.no = no;
		this.title = title;
		this.category = category;
		this.content = content;
		this.viewcnt = viewcnt;
		this.wrt_date = wrt_date;
		this.memberid = memberid;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getViewcnt() {
		return viewcnt;
	}


	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}


	public String getWrt_date() {
		return wrt_date;
	}


	public void setWrt_date(String wrt_date) {
		this.wrt_date = wrt_date;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	@Override
	public String toString() {
		return "HospitalBoardVO [no=" + no + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", viewcnt=" + viewcnt + ", wrt_date=" + wrt_date + ", memberid=" + memberid + "]";
	}
	
	
	
	
}

