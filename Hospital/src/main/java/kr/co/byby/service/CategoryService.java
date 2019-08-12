package kr.co.byby.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.byby.dao.CategoryDAO;
import kr.co.byby.dto.CategoryVO;

@Service
public class CategoryService {

	@Autowired
	CategoryDAO categorydao;
	
	public List<CategoryVO> getCategory(CategoryVO category) {
		return categorydao.getCategory(category);
	}
}
