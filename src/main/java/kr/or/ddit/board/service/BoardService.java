package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.BoardDaoI;
import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;

@Service("boardService")
public class BoardService implements BoardServiceI{
	
	@Resource(name="boardRepository")
	private BoardDaoI boardDao;
	
	
	public BoardService() {
//		boardDao = new BoardDao();
	}
	
	
	
	
	// 게시판 목록 전체 가져오기
	@Override
	public List<LboardVo> getlboard() {
		return boardDao.getlboard();
	}

	// 활성화된 게시판 목록 가져오기
	@Override
	public List<LboardVo> getActivelboard() {
		return boardDao.getActivelboard();
	}



	// 게시판에 따른 게시물 목록 가져오
	@Override
	public Map<String, Object> getboard(Map<String, String> map) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("bolist", boardDao.getboard(map));
		map2.put("lboard", boardDao.getBoardnm(map));
		
		int totalCnt = boardDao.getboardCount(map);
		int pages = (int)Math.ceil((double)totalCnt/ Integer.parseInt(map.get("pageSize")));
		System.out.println("pages : " +pages);
		System.out.println("totalCnt : " +totalCnt);
		map2.put("pages", pages);
		
//		sqlSession.close();
		return map2; 
	}



	// 게시판 업데이트
	@Override
	public int updateLboard(LboardVo lboardvo) {
		
		return boardDao.updateLboard(lboardvo);
	}



	// 게시판 등록
	@Override
	public int insertLboard(LboardVo lboardVo) {
				
		return boardDao.insertLboard(lboardVo);
	}



	// 해당 게시글 가져오기
	@Override
	public BoardVo getboard(String bo_id) {
		
		return boardDao.getboard(bo_id);
	}



	// 게시글 작성하기
	@Override
	public String insertBoard(BoardVo boardvo) {
		
		return boardDao.insertBoard(boardvo);
	}



	// 파일 등록하기
	@Override
	public int insertFile(FileVo filevo) {
		
		return boardDao.insertFile(filevo);
	}



	// 파일 목록 가져오기
	@Override
	public List<FileVo> getfiles(String bo_id) {
		
		return boardDao.getfiles(bo_id);
	}


	// 게시글 삭제
	@Override
	public int delboard(String bo_id) {
		
		return boardDao.delboard(bo_id);
	}

	
	// 답글 작성
	@Override
	public String insertAnswer(BoardVo boardvo) {
		
		return boardDao.insertAnswer(boardvo);
	}



	// 답글 파일 등록
	@Override
	public int insertAnswerFile(FileVo filevo) {
		
		return boardDao.insertAnswerFile(filevo);
	}



	// 댓글 작성
	@Override
	public int insertReply(ReplyVo replyvo) {
		return boardDao.insertReply(replyvo);
	}



	// 댓글 목록 가져오기
	@Override
	public List<ReplyVo> getreply(String bo_id) {
		return boardDao.getreply(bo_id);
	}



	// 댓글 삭제
	@Override
	public int delReply(String re_id) {		
		return boardDao.delReply(re_id);
		
	}



	// 해당 파일 가져오기
	@Override
	public FileVo getfile(String file_id) {
		
		return boardDao.getfile(file_id);
	}



	// 게시글 수정
	@Override
	public int updateboard(BoardVo boardvo) {
		
		return boardDao.updateboard(boardvo);
	}



	// 파일 삭제
	@Override
	public int delfiles(String file_id) {
		return boardDao.delfiles(file_id);
	}

	
}
