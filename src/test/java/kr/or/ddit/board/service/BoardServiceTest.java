package kr.or.ddit.board.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.board.ModelTestConfig;
import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;

public class BoardServiceTest extends ModelTestConfig{

	@Resource(name="boardService")
	private BoardServiceI service;
	
	
	@Before
	public void setup() {
//		service = new BoardService();
	}
	
	// 모든 게시판목록 가져오기 테스트
	@Test
	public void getlboardTest() {
		/***Given***/
		
		/***When***/
		List<LboardVo> bolist = service.getlboard();
		/***Then***/
		assertEquals(5, bolist.size());

	}
	
	// 활성화된 게시판목록 가져오기 테스트
	@Test
	public void getAtctivelboardTest() {
		/***Given***/
		
		/***When***/
		List<LboardVo> bolist = service.getActivelboard();
		/***Then***/
		assertEquals(5, bolist.size());

	}
	
	// 해당 게시글 목록 가져오기 테스트
	@Test
	public void getboardlistTest() {
		/***Given***/
		Map<String, String> maparam = new HashMap<String, String>();
		maparam.put("lbo_id", "1");
		maparam.put("page", "1");
		maparam.put("pageSize", "10");
		
		/***When***/
		Map<String, Object> maps = service.getboard(maparam);
		
		List<BoardVo> bolist =(List<BoardVo>) maps.get("bolist");
		LboardVo lboard = (LboardVo)maps.get("lboard");
		int pages = (int)maps.get("pages");
		
		/***Then***/
		assertEquals(10, bolist.size());
//		assertEquals("테스트", lboard.getLbo_nm());
		assertEquals(7,pages);
		
	}
	
	
	//게시판 수정
	@Test
	public void updateLboardTest() {
		/***Given***/		
		LboardVo lbovo = new LboardVo("3", "질문게시판22", "1");
		
		/***When***/
		int updateCnt = service.updateLboard(lbovo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	// 새로운 게시판 등록
	@Test
	public void insertLboardTest() {
		/***Given***/		
		LboardVo lbovo = new LboardVo("1", "테스트", "1");
		
		/***When***/
		int insertCnt = service.insertLboard(lbovo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 활성화된 게시글 가져오기
	@Test
	public void getboardTest() {
		/***Given***/
		String bo_id = "5";
		
		/***When***/
		BoardVo bovo = service.getboard(bo_id);
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
		boardvo.setLbo_id("2");
		boardvo.setMem_id("brown");
		
		/***When***/
		String insertbo_id = service.insertBoard(boardvo);
		
		/***Then***/
		assertEquals("140", insertbo_id);
	}
	
	// 파일 등록
	@Test
	public void insertFileTest() {
		/***Given***/		
		FileVo filevo = new FileVo("10", "ryan2.png","e:\\profile2\\ryan2.png");
		
		/***When***/
		int insertCnt = service.insertFile(filevo);	
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	//해당 게시글 파일 가져오기
	@Test
	public void getfilesTest() {
		/***Given***/
		String bo_id = "5";
		
		
		/***When***/
		List<FileVo> filelist = service.getfiles(bo_id);
		
		/***Then***/
		assertEquals(2, filelist.size());
	}

	// 게시글 삭제 테스트
	@Test
	public void delboardTest() {
		/***Given***/		
		String bo_id = "19";
		
		/***When***/
		int delCnt =  service.delboard(bo_id);
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
		boardvo.setP_seq("15");
		boardvo.setGn(15);
		
		/***When***/
		String insertbo_id = service.insertAnswer(boardvo);
				
		/***Then***/
		assertEquals("141", insertbo_id);
	}
	
	// 게시글 답글 파일 등록 테스트
	@Test
	public void insertAnswerFileTest() {
		/***Given***/		
		FileVo filevo = new FileVo("11", "ryan.png","e:\\profile2\\ryan.png");
		
		/***When***/
		int insertCnt = service.insertFile(filevo);	
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 게시글 댓글작성 테스트
	@Test
	public void insertReplyTest() {
		/***Given***/		
		ReplyVo revo = new ReplyVo();
		revo.setBo_id("5");
		revo.setMem_id("brown");
		revo.setRe_con("반갑습니다.!!");
		
		/***When***/
		int insertCnt = service.insertReply(revo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	// 댓글 목록 출력 테스트
	@Test
	public void getreplyTest() {
		/***Given***/
		String bo_id = "3";
		
		
		/***When***/
		List<ReplyVo> replylist = service.getreply(bo_id);
		
		/***Then***/
		assertEquals(3, replylist.size());
	}
	
	// 댓글 삭제 테스트
	@Test
	public void delReplyTest() {
		/***Given***/		
		String re_id = "17";
				
		/***When***/
		int delCnt = service.delReply(re_id);
		
		/***Then***/
		assertEquals(1, delCnt);
	}
	
	// 파일정보 가져오기 테스트_ 다운로드위해
	@Test
	public void getfileTest() {
		/***Given***/
		String file_id = "6";
		
		
		/***When***/
		FileVo filevo = service.getfile(file_id);
		
		/***Then***/
		assertEquals("ryan3.gif", filevo.getFile_nm());
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
		int updateCnt = service.updateboard(boardvo);
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	// 파일삭제 테스트
	@Test
	public void delfilesTest() {
		/***Given***/		
		String file_id = "4";
		
		/***When***/
		int delCnt = service.delfiles(file_id);
		
		/***Then***/
		assertEquals(1, delCnt);
	}

}
