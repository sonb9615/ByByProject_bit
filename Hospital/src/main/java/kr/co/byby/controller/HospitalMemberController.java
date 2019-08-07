package kr.co.byby.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.byby.dto.HospitalMemberVO;
import kr.co.byby.service.HospitalMemberService;


@Controller
public class HospitalMemberController {
	
	@Autowired
	private HospitalMemberService service;
	
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		
		HospitalMemberVO member = new HospitalMemberVO();
		
		model.addAttribute("memberVO", member);
		
		return "member/joinForm";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String join(@Valid HospitalMemberVO member, BindingResult result) {
		
		System.out.println(member);
		
		// 에러가 발생하면
		if(result.hasErrors()) {
			System.out.println("오류발생...");
			return "member/joinForm";
		}
		
		service.insertMember(member);
		
		return "redirect:/";
	}
	
	
}