package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.BoardFileVO;
import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;
import kr.co.byby.dto.SymptomBoardVO;

@Repository
public class SymptomBoardDaoImpl implements SymptomBoardDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	public List<SymptomBoardVO> selectAll() {
		List<SymptomBoardVO> symptomboardList = session.selectList("kr.co.byby.dao.SymptomBoardDAO.selectAll");
		return symptomboardList;
	}
	
	/* 게시판 첨부파일 등록 */
	public int insertBoardFile(BoardFileVO boardFile) {
		return session.insert("kr.co.byby.dao.SymptomBoardDAO.insertBoardFile", boardFile);
	}
	
	@Override
	   public int listCgCount(String ctg_name) throws Exception {
	      return session.selectOne("kr.co.byby.dao.SymptomBoardDAO.listCgCount", ctg_name);
	   }

	public List<SymptomBoardVO> selectCtgBoard( HospitalCriteria cri) {
	      List<SymptomBoardVO> ctgBoardList = session.selectList("kr.co.byby.dao.SymptomBoardDAO.selectCtgBoard", cri);
	      return ctgBoardList;
	   }


	public void insert(SymptomBoardVO board) {
		session.insert("kr.co.byby.dao.SymptomBoardDAO.insert",board);
		
	}

	public SymptomBoardVO selectByNo(int no) {
		SymptomBoardVO symptom = session.selectOne("kr.co.byby.dao.SymptomBoardDAO.selectByNo",no);
		return symptom;
	}

	public void delete(int no) {
		session.delete("kr.co.byby.dao.SymptomBoardDAO.deleteByNo", no);
		
	}

	@Override
	public void update(SymptomBoardVO board) {
		session.update("kr.co.byby.dao.SymptomBoardDAO.update", board);
		
	}

	@Override
	public List<SymptomBoardVO> listPage(HospitalCriteria cri) throws Exception {
		List<SymptomBoardVO> symptomboardListPage = session.selectList("kr.co.byby.dao.SymptomBoardDAO.listPage", cri);
		return symptomboardListPage;
	}

	@Override
	public int listCount() throws Exception {
		return session.selectOne("kr.co.byby.dao.SymptomBoardDAO.listCount");
	}

	
	 @Override
	   public void increaseViewcnt(int no) {
	       session.update("kr.co.byby.dao.SymptomBoardDAO.increaseViewcnt", no);
	      
	   }
	 
	 /* 첨부파일 삭제 */
	   public int deleteBoardFile(BoardFileVO boardFile) {
	      return session.update("kr.co.byby.dao.SymptomBoardDAO.deleteBoardFile", boardFile);
	   }

	
	 //게시판 파일 수정 
	   public int insertBoardFileUpdate(BoardFileVO boardFile) {
	      return session.insert("kr.co.byby.dao.SymptomBoardDAO.insertBoardFileUpdate", boardFile);
	   } 
	   
}
