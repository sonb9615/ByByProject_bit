package kr.co.byby;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.byby.dao.HospitalBoardDAO;
import kr.co.byby.dto.HospitalBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/**/*.xml" })
public class BoardTest {

	@Autowired
	private HospitalBoardDAO hospitalboardDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Ignore
	@Test
	public void 게시글등록테스트() throws Exception {
		HospitalBoardVO board = new HospitalBoardVO();
		board.setTitle("테스트입니다");
		board.setCategory("두통");
		board.setContent("내용입니다");
		board.setMemberid("ansguswls");

		session.insert("kr.co.byby.dao.HospitalBoardDAO.insert", board);

	}
	
	@Ignore
	@Test
	public void 게시글상세테스트() throws Exception{
		//namespace이름 + id속성
		HospitalBoardVO hospital = session.selectOne("kr.co.byby.dao.HospitalBoardDAO.selectByNo",42);
		System.out.println(hospital);
	}
	
	
	@Test
	public void 게시글상세DAO테스트() throws Exception{
		HospitalBoardVO result = hospitalboardDAO.selectByNo(42);
		System.out.println(result);
	}
	
}
