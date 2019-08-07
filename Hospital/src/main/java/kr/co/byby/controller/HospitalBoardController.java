package kr.co.byby.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.service.HospitalBoardService;

@Controller
public class HospitalBoardController {

	@Autowired
	private HospitalBoardService service;

	//전체병원리스트조회
	@RequestMapping("/hospitalboard")
	public ModelAndView list() {
		List<HospitalBoardVO> hospitalboardList = service.selectAllBoard();

		ModelAndView mav = new ModelAndView("board/hospitallist");

		mav.addObject("hospitalboardList", hospitalboardList);

		return mav;
	}

	//병원게시글 등록
	@RequestMapping(value = "/board/hospitalwrite2", method = RequestMethod.GET)
	public String writeForm2() {
		return "board/hospitalwrite2";
	}

	@RequestMapping(value = "/board/hospitalwrite2", method = RequestMethod.POST)
	public String write2(HospitalBoardVO hospitalboard) {

		service.insertBoard(hospitalboard);

		return "redirect:/hospitalboard";
	}

	//상세 병원게시글 조회
	@RequestMapping(value = "/board/hospitaldetail")
	public ModelAndView detail2(@RequestParam("no") int no) {

		HospitalBoardVO hospital = service.detailBoardByNo(no);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/hospitaldetail");
		mav.addObject("hospital", hospital);
		return mav;
	}

	@RequestMapping(value = "/board/{no}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("no") int no) {
		HospitalBoardVO hospital = service.detailBoardByNo(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/hospitaldetail");
		mav.addObject("hospital", hospital);
		return mav;
	}
	
	//병원게시글 삭제
	@RequestMapping("/board/remove/{no}")
	public String removeBoard(@PathVariable("no") int no) {
		System.out.println("삭제할 번호 : " + no);
		
		return "redirect:/hospitalboard";
	}
	
	//병원게시글 수정
	@RequestMapping(value = "/board/update/{no}", method = RequestMethod.GET)
	public ModelAndView updateget(@PathVariable("no") int no) {
		HospitalBoardVO hospital = service.detailBoardByNo(no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/hospitalupdate");
		mav.addObject("hospital", hospital);
		return mav;
	}
	
	@RequestMapping(value = "/board/update", method = {RequestMethod.POST,RequestMethod.GET})
	public String updatepost(HospitalBoardVO hospital) {
		service.update(hospital);
		return "redirect:/hospitalboard";
	}
	
}
