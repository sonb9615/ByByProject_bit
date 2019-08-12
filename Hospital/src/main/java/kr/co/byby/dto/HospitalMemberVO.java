package kr.co.byby.dto;

import javax.validation.constraints.NotEmpty;

public class HospitalMemberVO {
	@NotEmpty(message="필수항목입니다.")
	private String memberid;
	@NotEmpty(message="필수항목입니다.")
	private String name;
	@NotEmpty(message="필수항목입니다.")
	private String password;
	private String emailId, emailDomain,
					tel1, tel2, tel3, type, regDate;

	public HospitalMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HospitalMemberVO(String memberid, String name, String password, String emailId, String emailDomain, String tel1,
			String tel2, String tel3, String type, String regDate) {
		super();
		this.memberid = memberid;
		this.name = name;
		this.password = password;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.type = type;
		this.regDate = regDate;
	}


	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "HospitalMemberVO [memberid=" + memberid + ", name=" + name + ", password=" + password + ", emailId="
				+ emailId + ", emailDomain=" + emailDomain + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3
				+ ", type=" + type + ", regDate=" + regDate + "]";
	}
	
}
