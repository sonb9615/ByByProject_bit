package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.HospitalMemberVO;

@Repository
public class HospitalMemberDAOImpl implements HospitalMemberDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void insert(HospitalMemberVO member) {
		
		session.insert("kr.co.byby.dao.HospitalMemberDAO.insertMember", member);  //parameterType은 MemberVO가된다
		
	}

	@Override
	public int checkId(String memberid) {
		
		int check = session.selectOne("kr.co.byby.dao.HospitalMemberDAO.checkId", memberid);

		return check;
	}


}
