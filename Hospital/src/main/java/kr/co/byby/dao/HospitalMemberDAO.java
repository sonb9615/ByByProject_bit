package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.HospitalMemberVO;

public interface HospitalMemberDAO {
	
	/**
	 * 회원 가입
	 */
	public void insert(HospitalMemberVO member);
	
	/**
	 * 회원가입 아이디 중복체크
	 */
	int checkId(String memberid);
	
}
