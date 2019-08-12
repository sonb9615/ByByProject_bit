package kr.co.byby.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.byby.dao.HospitalMemberDAO;
import kr.co.byby.dto.HospitalMemberVO;


//bean 객체 생성
@Service
public class HospitalMemberServiceImpl implements HospitalMemberService{

	@Autowired
	private HospitalMemberDAO memberDAO;
	
	@Override
	public void insertMember(HospitalMemberVO member) {
		
		memberDAO.insert(member);
		
	}

	@Override
	public int checkIdSignUp(String memberid) {
		
		int check = memberDAO.checkId(memberid);
		return check;
	}

}
