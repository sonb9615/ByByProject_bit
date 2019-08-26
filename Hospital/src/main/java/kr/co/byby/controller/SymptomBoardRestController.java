package kr.co.byby.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.byby.service.HospitalBoardService;
import kr.co.byby.service.SymptomBoardService;

@RestController
public class SymptomBoardRestController {
	
	@Autowired
	private SymptomBoardService service;
	
	@RequestMapping(value="/symboard/{no}", method=RequestMethod.DELETE)
	public Map<String, Boolean> delete(@PathVariable("no") int no) {
		
		service.deleteBoardByNo(no);
		
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("flag", true);
		
		return result;
	}
	
	
}
