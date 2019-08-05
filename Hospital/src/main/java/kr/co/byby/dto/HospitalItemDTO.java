package kr.co.byby.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="item")
public class HospitalItemDTO {

	private String dutyAddr;
	private String dutyName;
	private String dutyTel1;
	
	public String getDutyAddr() {
		return dutyAddr;
	}
	public void setDutyAddr(String dutyAddr) {
		this.dutyAddr = dutyAddr;
	}
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	public String getDutyTel1() {
		return dutyTel1;
	}
	public void setDutyTel1(String dutyTel1) {
		this.dutyTel1 = dutyTel1;
	}
	
	public String toString() {
//		return "주소: " + dutyAddr +  "\n"+ "병원이름: " + dutyName +"\n"+"전화번호: " + dutyTel1 + "\n";
		return dutyName +  "," + dutyAddr + "," + dutyTel1;
	}
}
