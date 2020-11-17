package kr.or.ddit.board.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.board.ModelTestConfig;
import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;


public class BoardDaoTest extends ModelTestConfig {
	
	@Resource(name="boardRepository")
	private BoardDaoI boardDao;


	// 모든 게시판목록 가져오기 테스트
	@Test
	public void getlboardTest() {
		/***Given***/
		
		/***When***/
		List<LboardVo> bolist = boardDao.getlboard();
		
		/***Then***/
		assertEquals(4, bolist.size());

	}
	
	// 활성화된 게시판목록 가져오기 테스트
	@Test
	public void getAtctivelboardTest() {
		/***Given***/
		
		/***When***/
		List<LboardVo> bolist = boardDao.getActivelboard();
		/***Then***/
		assertEquals(4, bolist.size());

	}
	
	// 해당 게시글 목록 가져오기 테스트
	@Test
	public void getboardlistTest() {
		/***Given***/
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		Map<String, String> map = new HashMap<>(); // map으로 사용한 경우
		map.put("lbo_id", "1");
		map.put("page", "1");
		map.put("pageSize", "10");
		
		
		/***When***/
		List<BoardVo> bolist = boardDao.getboard(map);
		
		/***Then***/
		assertEquals(6, bolist.size());
	}
	
	// 해당 게시판vo 가져오기 테스트
	@Test
	public void getboardnmTest() {
		/***Given***/
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		Map<String, String> map = new HashMap<>(); // map으로 사용한 경우
		map.put("lbo_id", "1");
		map.put("page", "1");
		map.put("pageSize", "10");
		
		
		/***When***/
		LboardVo lbovo = boardDao.getBoardnm( map);
		
		/***Then***/
		assertEquals("질문게시판", lbovo.getLbo_nm());
		assertEquals("1", lbovo.getLbo_status());
	}
	
	//해당 게시물 목록 개수
	@Test
	public void getboardCountTest() {
		/***Given***/
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		Map<String, String> map = new HashMap<>(); // map으로 사용한 경우
		map.put("lbo_id", "1");
		map.put("page", "1");
		map.put("pageSize", "10");
		
		
		/***When***/
		int count = boardDao.getboardCount( map);
		
		/***Then***/
		assertEquals(6, count);
	}
	//게시판 수정
	@Test
	public void updateLboardTest() {
		/***Given***/		
		LboardVo lbovo = new LboardVo("11", "질문게시판22", "1");
		
		/***When***/
		int updateCnt = boardDao.updateLboard(lbovo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	// 새로운 게시판 등록
	@Test
	public void insertLboardTest() {
		/***Given***/		
		LboardVo lbovo = new LboardVo("1", "테스트", "1");
		
		/***When***/
		int insertCnt = boardDao.insertLboard(lbovo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 활성화된 게시글 가져오기
	@Test
	public void getboardTest() {
		/***Given***/
		String bo_id = "5";
		
		/***When***/
		BoardVo bovo = boardDao.getboard(bo_id);
		/***Then***/
		assertEquals("하이룽", bovo.getBo_title());

	}
	
	// 새로운 게시글 등록
	@Test
	public void insertBoardTest() {
		/***Given***/		
		BoardVo boardvo = new BoardVo();
		boardvo.setBo_con("안녕");
		boardvo.setBo_title("안녕");
		boardvo.setLbo_id("1");
		boardvo.setMem_id("brown");
		
		/***When***/
		String insertbo_id = boardDao.insertBoard(boardvo);
		
		/***Then***/
		assertEquals("20", insertbo_id);
	}
	
	// 파일 등록
	@Test
	public void insertFileTest() {
		/***Given***/		
		FileVo filevo = new FileVo("1", "ryan2.png","e:\\profile2\\ryan2.png");
		
		/***When***/
		int insertCnt = boardDao.insertFile(filevo);	
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	//해당 게시글 파일 가져오기
	@Test
	public void getfilesTest() {
		/***Given***/
		String bo_id = "134";
		
		
		/***When***/
		List<FileVo> filelist = boardDao.getfiles(bo_id);
		
		/***Then***/
		assertEquals(3, filelist.size());
	}

	// 게시글 삭제 테스트
	@Test
	public void delboardTest() {
		/***Given***/		
		String bo_id = "19";
		
		/***When***/
		int delCnt =  boardDao.delboard(bo_id);
		/***Then***/
		assertEquals(1, delCnt);
	}
	
	// 게시글 답글작성 테스트
	@Test
	public void insertAnswerTest() {
		/***Given***/		
		BoardVo boardvo = new BoardVo();
		boardvo.setBo_con("안녕하십니까2");
		boardvo.setBo_title("반갑습니다.");
		boardvo.setLbo_id("1");
		boardvo.setMem_id("brown");
		boardvo.setP_seq("19");
		boardvo.setGn(20);
		
		/***When***/
		String insertbo_id = boardDao.insertAnswer(boardvo);
				
		/***Then***/
		assertEquals("21", insertbo_id);
	}
	
	// 게시글 답글 파일 등록 테스트
	@Test
	public void insertAnswerFileTest() {
		/***Given***/		
		FileVo filevo = new FileVo("19", "ryan.png","e:\\profile2\\ryan.png");
		
		/***When***/
		int insertCnt = boardDao.insertFile(filevo);	
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 게시글 댓글작성 테스트
	@Test
	public void insertReplyTest() {
		/***Given***/		
		ReplyVo revo = new ReplyVo();
		revo.setBo_id("6");
		revo.setMem_id("brown");
		revo.setRe_con("반갑습니다.!!");
		
		/***When***/
		int insertCnt = boardDao.insertReply(revo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 댓글 목록 출력 테스트
	@Test
	public void getreplyTest() {
		/***Given***/
		String bo_id = "3";
		
		
		/***When***/
		List<ReplyVo> replylist = boardDao.getreply(bo_id);
		
		/***Then***/
		assertEquals(3, replylist.size());
	}
	
	// 댓글 삭제 테스트
	@Test
	public void delReplyTest() {
		/***Given***/		
		String re_id = "1";
				
		/***When***/
		int delCnt = boardDao.delReply(re_id);
		
		/***Then***/
		assertEquals(1, delCnt);
	}
	
	// 파일정보 가져오기 테스트_ 다운로드위해
	@Test
	public void getfileTest() {
		/***Given***/
		String file_id = "7";
		
		
		/***When***/
		FileVo filevo = boardDao.getfile(file_id);
		
		/***Then***/
		assertEquals("ryan.gif", filevo.getFile_nm());
	}
	
	// 게시글 수정 테스트
	@Test
	public void updateboardTest() {
		/***Given***/		
		BoardVo boardvo = new BoardVo();
		boardvo.setBo_con("안녕용");
		boardvo.setBo_title("하이룽");
		boardvo.setLbo_id("1");
		boardvo.setMem_id("brown");
		boardvo.setBo_id("5");
		
		/***When***/
		int updateCnt = boardDao.updateboard(boardvo);
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	// 파일삭제 테스트
	@Test
	public void delfilesTest() {
		/***Given***/		
		String file_id = "2";
		
		/***When***/
		int delCnt = boardDao.delfiles(file_id);
		
		/***Then***/
		assertEquals(1, delCnt);
	}
}
