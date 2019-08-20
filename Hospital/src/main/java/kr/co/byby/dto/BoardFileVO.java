package kr.co.byby.dto;

public class BoardFileVO {
	private int no;
	private int file_no;
	private String file_name_key;
	private String file_name;
	private String file_path;
	private String file_size;
	private String del_yn;
	private String ins_user_id;
	private String ins_date;
	private String upd_user_id;
	private String upd_date;
	
	public BoardFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardFileVO(int no, int file_no, String file_name_key, String file_name, String file_path, String file_size,
			String del_yn, String ins_user_id, String ins_date, String upd_user_id, String upd_date) {
		super();
		this.no = no;
		this.file_no = file_no;
		this.file_name_key = file_name_key;
		this.file_name = file_name;
		this.file_path = file_path;
		this.file_size = file_size;
		this.del_yn = del_yn;
		this.ins_user_id = ins_user_id;
		this.ins_date = ins_date;
		this.upd_user_id = upd_user_id;
		this.upd_date = upd_date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getFile_name_key() {
		return file_name_key;
	}

	public void setFile_name_key(String file_name_key) {
		this.file_name_key = file_name_key;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getIns_user_id() {
		return ins_user_id;
	}

	public void setIns_user_id(String ins_user_id) {
		this.ins_user_id = ins_user_id;
	}

	public String getIns_date() {
		return ins_date;
	}

	public void setIns_date(String ins_date) {
		this.ins_date = ins_date;
	}

	public String getUpd_user_id() {
		return upd_user_id;
	}

	public void setUpd_user_id(String upd_user_id) {
		this.upd_user_id = upd_user_id;
	}

	public String getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(String upd_date) {
		this.upd_date = upd_date;
	}

	@Override
	public String toString() {
		return "BoardFileVO [no=" + no + ", file_no=" + file_no + ", file_name_key=" + file_name_key + ", file_name="
				+ file_name + ", file_path=" + file_path + ", file_size=" + file_size + ", del_yn=" + del_yn
				+ ", ins_user_id=" + ins_user_id + ", ins_date=" + ins_date + ", upd_user_id=" + upd_user_id
				+ ", upd_date=" + upd_date + "]";
	}


}
