package kr.co.byby.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;
import kr.co.byby.dto.HospitalPageMaker;
import kr.co.byby.dto.ReplyHospitalVO;
import kr.co.byby.dto.ReplySymptomVO;
import kr.co.byby.dto.SymptomBoardVO;
import kr.co.byby.service.HospitalBoardService;
import kr.co.byby.service.SymptomBoardService;

@Controller
public class SymptomBoardController {

	@Autowired
	private SymptomBoardService service;


	// 증상게시판 게시물 전체조회_페이지
	@RequestMapping(value = "/symptomboard", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("cri") HospitalCriteria cri, ModelAndView mav) throws Exception {
		List<SymptomBoardVO> symptomboardList = service.listPage(cri);
		mav = new ModelAndView("symboard/symptomlist");
		
		HospitalPageMaker pageMaker = new HospitalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		mav.addObject("symptomboardList", symptomboardList);
		mav.addObject("pageMaker", pageMaker);	
		
		return mav;
	}

	// 증상게시글 등록
	@RequestMapping(value = "/symboard/symptomwrite2", method = RequestMethod.GET)
	public String writeForm2() {
		return "symboard/symptomwrite2";
	}

	@RequestMapping(value = "/symboard/symptomwrite2", method = RequestMethod.POST)
	public String write2(SymptomBoardVO symptomboard) {

		service.insertBoard(symptomboard);

		return "redirect:/symptomboard";
	}

	// 상세 증상게시글 조회
	@RequestMapping(value = "/symboard/{no}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("no") int no) {
		service.increaseViewcnt(no);

		SymptomBoardVO symptom = service.detailBoardByNo(no);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("symboard/symptomdetail");
		mav.addObject("symptom", symptom);
		  mav.addObject("replyVO", new ReplySymptomVO());

		return mav;
	}

	
	// 증상게시글 삭제
	@RequestMapping("/symboard/remove/{no}")
	public String removeBoard(@PathVariable("no") int no) {
		System.out.println("삭제할 번호 : " + no);

		return "redirect:/symptomboard";
	}

	// 증상게시글 수정
	@RequestMapping(value = "/symboard/update/{no}", method = RequestMethod.GET)
	public ModelAndView updateget(@PathVariable("no") int no) {
		SymptomBoardVO symptom = service.detailBoardByNo(no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("symboard/symptomupdate");
		mav.addObject("symptom", symptom);
		return mav;
	}

	@RequestMapping(value = "/symboard/update", method = { RequestMethod.POST, RequestMethod.GET })
	public String updatepost(SymptomBoardVO symptom) {
		service.update(symptom);
		return "redirect:/symptomboard";
	}
	
	// 증상게시판 카테고리 글목록 불러오기
    @RequestMapping(method = RequestMethod.GET, value = "/symCategory/{ctg_name}")
    public ModelAndView getCtgBoard(@ModelAttribute("cri")  HospitalCriteria cri, @PathVariable("ctg_name") String ctg_name) throws Exception{
       List<SymptomBoardVO> ctgBoardList = service.ctgBoard(cri);
       ModelAndView mav = new ModelAndView("symboard/symctgBoardList");
       
       HospitalPageMaker pageMaker = new HospitalPageMaker();
       pageMaker.setCri(cri);
       pageMaker.setTotalCount(service.listCgCount(ctg_name));
       mav.addObject("ctgBoard", ctgBoardList);
       mav.addObject("pageMaker", pageMaker);
       
       return mav;
    }
	
	
	/*
	 * @RequestMapping(value = "/symptomboard") public String search() { return
	 * "symboard/symptomlist"; }
	 */
	
}
