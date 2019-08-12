package kr.co.byby.dto;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class HospitalBoardVO {
	private int no;
	
	@Length(min=2, max=50, message="2글자 이상 50글자 이하로 입력하세요")
	@NotEmpty(message="필수항목입니다")
	private String title;
	private int ctg_no;
<<<<<<< HEAD
	
=======
	private String ctg_name;
>>>>>>> origin/yejin
	@NotEmpty(message="필수항목입니다")
	private String content;
	private int viewcnt;
	private String wrt_date;
	private String memberid;
	
	
	public HospitalBoardVO() {
		// TODO Auto-generated constructor stub
	}


<<<<<<< HEAD
	public HospitalBoardVO(int no, String title, int ctg_no, String content, int viewcnt, String wrt_date,
			String memberid) {
=======
	public HospitalBoardVO(int no, String title, int ctg_no, String ctg_name, String content, int viewcnt,
			String wrt_date, String memberid) {
>>>>>>> origin/yejin
		super();
		this.no = no;
		this.title = title;
		this.ctg_no = ctg_no;
<<<<<<< HEAD
=======
		this.ctg_name = ctg_name;
>>>>>>> origin/yejin
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


	public int getCtg_no() {
		return ctg_no;
<<<<<<< HEAD
	}


	public void setCtg_no(int ctg_no) {
		this.ctg_no = ctg_no;
=======
	}


	public void setCtg_no(int ctg_no) {
		this.ctg_no = ctg_no;
	}


	public String getCtg_name() {
		return ctg_name;
	}


	public void setCtg_name(String ctg_name) {
		this.ctg_name = ctg_name;
>>>>>>> origin/yejin
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
<<<<<<< HEAD
		return "HospitalBoardVO [no=" + no + ", title=" + title + ", category=" + ctg_no + ", content=" + content
				+ ", viewcnt=" + viewcnt + ", wrt_date=" + wrt_date + ", memberid=" + memberid + "]";
=======
		return "HospitalBoardVO [no=" + no + ", title=" + title + ", ctg_no=" + ctg_no + ", ctg_name=" + ctg_name
				+ ", content=" + content + ", viewcnt=" + viewcnt + ", wrt_date=" + wrt_date + ", memberid=" + memberid
				+ "]";
>>>>>>> origin/yejin
	}

	
}

