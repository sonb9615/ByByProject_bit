package kr.co.byby;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.byby.dao.HospitalBoardDAO;
import kr.co.byby.dao.HospitalMemberDAO;
import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalMemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/**/*.xml" })
public class MemberTest {

	@Autowired
	private HospitalMemberDAO hospitalMemberDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Test
	public void 멤버수정테스트() throws Exception{
		HospitalMemberVO member = new HospitalMemberVO();
		member.setName("rewrite2");
		member.setPassword("2222");
		member.setEmailId("rewrite2");
		member.setEmailDomain("mail.com");
		member.setTel1("010");
		member.setTel2("2222");
		member.setTel3("2222");
		
		hospitalMemberDAO.updateMem(member);
		session.update("kr.co.byby.dao.HospitalMemberDAO.updateMember", member);
		System.out.println("update!!!!!!");
	}
	
	      
	@Ignore 
	@Test
	public void 게시글등록테스트() throws Exception {
		HospitalBoardVO board = new HospitalBoardVO();
		board.setTitle("테스트입니다");
		board.setCtg_no(1);
		board.setContent("내용입니다");
		board.setMemberid("test1");

		session.insert("kr.co.byby.dao.HospitalBoardDAO.insert", board);

	}
	
	@Ignore
	@Test
	public void 게시글상세테스트() throws Exception{
		//namespace이름 + id속성
		HospitalBoardVO hospital = session.selectOne("kr.co.byby.dao.HospitalBoardDAO.selectByNo",42);
		System.out.println(hospital);
	}
	
	
	
	
	
}
