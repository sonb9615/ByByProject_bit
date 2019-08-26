package kr.co.byby.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="body")
public class HospitalItemsDTO {

	
	private List<HospitalItemDTO> items;
	
	@XmlElementWrapper(name="items")
    @XmlElement(name="item")
	public List<HospitalItemDTO> getItems() {
		return items;
	}

	public void setItems(List<HospitalItemDTO> items) {
		this.items = items;
	}
}
