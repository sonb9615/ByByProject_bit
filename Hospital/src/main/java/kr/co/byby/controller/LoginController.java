package kr.co.byby.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.byby.dto.HospitalMemberVO;
import kr.co.byby.service.HospitalMemberService;
import kr.co.byby.service.LoginService;


@SessionAttributes({"loginVO"})
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	
	// 스프링 4.3 이상 => GetMapping, PostMapping, PutMapping...
	@GetMapping("/login")
	//@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		
		return "/login/login";
	}
	
	// spring에서 제공하는 session
	// sessionAttribute => login 객체만 request 영역이 아닌 session 영역에 올려달라고 DispatcherServlet에게 요청
	//@Controller 위에  @SessionAttributes({"loginVO"}) 해줘야됨.
	// 이 방식은 로그아웃이 안됨. session 안지워짐 removeAttribute 해도 안지워짐. session 공유영역에 올리는 방식과 다르게 유지하는것. 
	@PostMapping("/login")
	public String login(HospitalMemberVO member, Model model) {
				
		HospitalMemberVO loginVO = loginService.login(member);
				
		if(loginVO == null) {
			// 로그인 실패
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다");
			return "redirect:/login";
		} else {
			// 로그인 성공

			model.addAttribute("loginVO", loginVO);
			
			return "redirect:/";
		}
	}
	
	//세션 정보 삭제
	//SessionStatus객체의 setComplete() 메소드를 사용해서 해제해 주어야함.
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		// 로그아웃하면  before : false
		//		   after : true  뜬다
//		System.out.println("before : " + status.isComplete());
		status.setComplete();
//		System.out.println("after : " + status.isComplete());
		
		return "redirect:/";
	}
	
	

/*
 	// serlvet, jsp에서의 sesion
	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpServletRequest request) {
		
		
		MemberVO loginVO = loginService.login(member);
		
		//System.out.println("controller: " + loginVO);
		
		if(loginVO == null) {
			// 로그인 실패
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다");
			return "redirect:/login";
		} else {
			// 로그인 성공
			
			//setAttribute, getAttribute, removeAttribute
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginVO", loginVO);
			
			return "redirect:/";
		}
		
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		//remove는 하나씩 지우기
//		session.removeAttribute("loginVO");
		//아예 모든 session 완전히 삭제하기
		session.invalidate();
		
		return "redirect:/";
	}
	*/
	
	
	
}
