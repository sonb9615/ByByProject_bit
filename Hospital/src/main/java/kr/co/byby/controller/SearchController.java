package kr.co.byby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	
	@RequestMapping(value = "/search")
	public String search() {
		return "search/search";
	}
	
	@RequestMapping(value = "/searchResult")
	public String searchResult() {
		return "search/searchResult";
	}

	@RequestMapping(value = "/mapResult")
	public String mapResult() {
		return "search/mapResult";
	}
}
