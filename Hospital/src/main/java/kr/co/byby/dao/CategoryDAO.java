package kr.co.byby.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.CategoryVO;

@Repository
public class CategoryDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<CategoryVO> getCategory(CategoryVO category) {
		return sqlSession.selectList("CategoryVO.selectCategory", category);
	}
	
	public List<CategoryVO> getSymCategory(CategoryVO category) {
		return sqlSession.selectList("CategoryVO.selectSymCategory", category);
	}
}
