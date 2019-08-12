package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.HospitalMemberVO;

public interface HospitalMemberDAO {
	
	//회원가입
	public void insert(HospitalMemberVO member);
	
	//개인정보 상세조회
	public HospitalMemberVO selectById(String memberid);
	
	//마이페이지 개인정보 수정
	public void updateMem(HospitalMemberVO member);
	


}
