package kr.co.byby.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.byby.dao.HospitalBoardDAO;
import kr.co.byby.dao.SymptomBoardDAO;
import kr.co.byby.dto.BoardFileVO;
import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;
import kr.co.byby.dto.SymptomBoardVO;

@Service
public class SymptomBoardServiceImpl implements SymptomBoardService {

	@Autowired
	private SymptomBoardDAO symptomboardDAO;

	public List<SymptomBoardVO> selectAllBoard() {
		List<SymptomBoardVO> symptomboardList = symptomboardDAO.selectAll();
		return symptomboardList;
	}

	public void insertBoard(SymptomBoardVO board) {

		List<BoardFileVO> boardFileList = null;

		try {
			boardFileList = getBoardFileInfo(board);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		symptomboardDAO.insert(board);

		for (BoardFileVO boardFile : boardFileList) {
			symptomboardDAO.insertBoardFile(boardFile);
		}

	}

	/* 게시판 첨부파일 정보 조회 */
	public List<BoardFileVO> getBoardFileInfo(SymptomBoardVO board) throws IllegalStateException, IOException {

		List<MultipartFile> files = board.getFiles();

		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();

		BoardFileVO boardFile = new BoardFileVO();

		int no = board.getNo();
		String fileName = null;
		String fileExt = null;
		String fileNameKey = null;
		String fileSize = null;
		// 파일이 저장될 path 설정
		String filePath = "D:\\eclipse-workspace\\javabook\\test\\Hospital\\src\\main\\webapp\\resources\\imageUpload";

		if (files != null && files.size() > 0) {
			File file = new File(filePath);

			// 디렉토리가 없으면 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			for (MultipartFile multipartFile : files) {

				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				// 파일명 변경(uuid로 암호화) + 확장자
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());

				// 설정한 Path에 파일 저장
				file = new File(filePath + "/" + fileNameKey);

				multipartFile.transferTo(file);

				boardFile = new BoardFileVO();
				boardFile.setNo(no);
				boardFile.setFile_name(fileName);
				boardFile.setFile_name_key(fileNameKey);
				boardFile.setFile_path(filePath);
				boardFile.setFile_size(fileSize);
				boardFileList.add(boardFile);

			}
		} else {
			files = null;
		}

		return boardFileList;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public SymptomBoardVO detailBoardByNo(int no) {
		SymptomBoardVO symptom = symptomboardDAO.selectByNo(no);
		return symptom;
	}

	public void deleteBoardByNo(int no) {
		symptomboardDAO.delete(no);
	}

	   /** 게시판 수정  */
	   @Override
	   public void update(SymptomBoardVO board) {
	      
	      symptomboardDAO.update(board);
	      
	      String deleteFile = board.getDelete_file();
	      if(!"".equals(deleteFile)) {
	         
	         String file_name_key = deleteFile;
	         
	         BoardFileVO deleteBoardFile = new BoardFileVO();
	         deleteBoardFile.setFile_name_key(file_name_key);
	         
	         symptomboardDAO.deleteBoardFile(deleteBoardFile);
	         
	      }
	      
	      List<BoardFileVO> boardFileList = null;
	      try {
	         boardFileList = getBoardFileInfo(board);
	      } catch (IllegalStateException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      for (BoardFileVO boardFile : boardFileList) {
	         symptomboardDAO.insertBoardFileUpdate(boardFile);
	      }
	   }

	@Override
	public List<SymptomBoardVO> listPage(HospitalCriteria cri) throws Exception {
		List<SymptomBoardVO> listPage = symptomboardDAO.listPage(cri);
		return listPage;
	}

	@Override
	public int listCount() throws Exception {
		return symptomboardDAO.listCount();
	}


	@Override
	public int listCgCount(String ctg_name) throws Exception {
		return symptomboardDAO.listCgCount(ctg_name);
	}

	@Override
	public List<SymptomBoardVO> ctgBoard(HospitalCriteria cri) throws Exception {
		List<SymptomBoardVO> ctgBoardList = symptomboardDAO.selectCtgBoard(cri);
		return ctgBoardList;
	}

	
	@Override
	   public void increaseViewcnt(int no) {
	      symptomboardDAO.increaseViewcnt(no);
	      
	   }
}
