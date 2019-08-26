package kr.co.byby.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.HospitalMemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public HospitalMemberVO loin(HospitalMemberVO member) {
		
		HospitalMemberVO loginVO = sqlSession.selectOne("kr.co.byby.dao.HospitalMemberDAO.login", member);

		return loginVO;
	}

}
