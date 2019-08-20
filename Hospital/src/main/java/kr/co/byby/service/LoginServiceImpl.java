package kr.co.byby.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.byby.dao.LoginDAO;
import kr.co.byby.dto.HospitalMemberVO;


@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public HospitalMemberVO login(HospitalMemberVO member) {
		
		HospitalMemberVO loginVO = loginDAO.loin(member);
		return loginVO;
	
	}

}
