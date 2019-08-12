package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.HospitalMemberVO;

public interface HospitalMemberDAO {
	
	//회원가입
	public void insert(HospitalMemberVO member);
	
<<<<<<< HEAD
	//개인정보 상세조회
	public HospitalMemberVO selectById(String memberid);
	
	//마이페이지 개인정보 수정
	public void updateMem(HospitalMemberVO member);
=======
	/**
	 * 회원가입 아이디 중복체크
	 */
	int checkId(String memberid);
>>>>>>> origin/yejin
	
}
