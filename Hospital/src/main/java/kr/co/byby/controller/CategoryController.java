package kr.co.byby.controller;

import java.util.List;

import org.jboss.logging.Logger;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.byby.dto.CategoryVO;
import kr.co.byby.service.CategoryService;

@Controller
public class CategoryController {
	
	private static final Logger logger = Logger.getLogger(CategoryController.class.getName());
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/category")
	public String getCategory() {
		return "/board/category";
	}
	
	//GET
	@RequestMapping(method = RequestMethod.GET, value = "/categoryData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getCategoryData() {
		logger.debug("CALL getCategory Method: ");
		CategoryVO category = new CategoryVO();
		List<CategoryVO> categoryList = categoryService.getCategory(category);
		String json = new Gson().toJson(categoryList);
		return json;
	}
}
