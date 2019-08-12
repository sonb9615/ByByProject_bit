package kr.co.byby.dto;

import java.util.Map;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="response")
public class HospitalResponseVO {


	private Map<String, String> header;
	private HospitalItemsDTO body;
	
	
	public Map<String, String> getHeader() {
		return header;
	}
	public void setHeader(Map<String, String> header) {
		this.header = header;
	}
	public HospitalItemsDTO getBody() {
		return body;
	}
	public void setBody(HospitalItemsDTO body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "HospitalResponseVO [header=" + header + ", body=" + body + "]";
	}
	
	
	
}
