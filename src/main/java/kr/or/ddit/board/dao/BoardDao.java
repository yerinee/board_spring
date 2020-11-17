package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;
import kr.or.ddit.member.model.MemberVO;

@Repository("boardRepository")
public class BoardDao implements BoardDaoI {

	

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	
	
	// 모든 게시판목록 가져옴
	@Override
	public List<LboardVo> getlboard() {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<LboardVo> lboardvo = sqlSession.selectList("board.getLboard");
		
//		sqlSession.close();
		return lboardvo;
	}

	// 활성화된 게시판 목록 가져옴
	@Override
	public List<LboardVo> getActivelboard() {		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<LboardVo> lboardvo = sqlSession.selectList("board.getActiveLboard");
		
//		sqlSession.close();
		return lboardvo;
	}
	
	// 해당 게시글 내역 가져옴
	@Override
	public List<BoardVo> getboard(Map<String, String> map) {
		
		return  sqlSession.selectList("board.getboard",map);
	}
	
	// 게시판을 가져오기 위함
	@Override
	public LboardVo getBoardnm(Map<String, String> map) {		
		
		return sqlSession.selectOne("board.getlboardNm",map);
	}
	
	// 게시물 목록개수 
	@Override
	public int getboardCount( Map<String, String> map) {
		
		return sqlSession.selectOne("board.getboardCount", map);
	}
	
	// 게시판 수정
	@Override
	public int updateLboard(LboardVo lboardvo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("board.updatelboard", lboardvo);
		
//		System.out.println("updateCnt :: " + updateCnt);
//		if(updateCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return updateCnt;
	}
	
	// 게시판 등록
	@Override
	public int insertLboard(LboardVo lboardVo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
//		try {
			insertCnt = sqlSession.insert("board.insertlboard", lboardVo);			
//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
//		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
//		}
		
//		sqlSession.close();
		
		return insertCnt;
	}
	
	// 해당 게시글 가져오기
	@Override
	public BoardVo getboard(String bo_id) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		BoardVo boardvo = sqlSession.selectOne("board.getboarddetail", bo_id);
//		sqlSession.close();
		
		return boardvo;
	}
	
	// 게시글 작성
	@Override
	public String insertBoard(BoardVo boardvo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
		String bo_id ="";
//		try {
			insertCnt = sqlSession.insert("board.insertboard", boardvo);	

//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
			bo_id = boardvo.getBo_id();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
		}
		
//		sqlSession.close();
		
		return bo_id;
	}
	
	// 파일 업로드
	@Override
	public int insertFile(FileVo filevo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
//		try {
			insertCnt = sqlSession.insert("board.insertfile", filevo);	
		
//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
//		if(insertCnt > 0) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
//		}
		
//		sqlSession.close();
		
		return insertCnt;
	}
	
	// 해당 게시글 파일목록 가져오기
	@Override
	public List<FileVo> getfiles(String bo_id) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<FileVo> filevo = sqlSession.selectList("board.getfiles", bo_id);
		
//		sqlSession.close();
		return filevo;
	}

	// 해당 게시글 삭제
	@Override
	public int delboard(String bo_id) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("board.delboard", bo_id);
		
//		System.out.println("updateCnt :: " + updateCnt);
//		if(updateCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return updateCnt;
	}
	
	// 게시글 답글 작성
	@Override
	public String insertAnswer(BoardVo boardvo) {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
		String bo_id ="";
//		try {
			insertCnt = sqlSession.insert("board.insertAnswer", boardvo);	

//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
			bo_id = boardvo.getBo_id();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
		}
		
//		sqlSession.close();
		
		return bo_id;
	}
	
	// 답글 파일 업로드
	@Override
	public int insertAnswerFile(FileVo filevo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
//		try {
			insertCnt = sqlSession.insert("board.insertAnswerfile", filevo);	
		
//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
//		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
//		}
		
//		sqlSession.close();
		
		return insertCnt;
	}

	// 댓글 작성
	@Override
	public int insertReply(ReplyVo replyvo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
		
//		try {
			insertCnt = sqlSession.insert("board.insertReply", replyvo);	

//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
//		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();

//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
//		}
		
//		sqlSession.close();
		
		return insertCnt;
	}
	
	// 댓글 목록 출력
	@Override 
	public List<ReplyVo> getreply(String bo_id) {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<ReplyVo> replyvo = sqlSession.selectList("board.getreply", bo_id);
		
//		sqlSession.close();
		return replyvo;
	}
	
	// 댓글 삭제
	@Override
	public int delReply(String re_id) {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("board.delreply", re_id);
		
//		System.out.println("updateCnt :: " + updateCnt);
//		if(updateCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		
		return updateCnt;
	}
	
	
	// 해당 파일 가져오기_다운로드위해
	@Override
	public FileVo getfile(String file_id) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		FileVo filevo = sqlSession.selectOne("board.getfile", file_id);
//		sqlSession.close();
		
		return filevo;
	}
	
	// 게시글 수정
	@Override
	public int updateboard(BoardVo boardvo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("board.updateboard", boardvo);
//		System.out.println("updateCnt :: " + updateCnt);
//		if(updateCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return updateCnt;
	}
	
	// 등록된 파일 삭제
	@Override
	public int delfiles(String file_id) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int deleteCnt = sqlSession.delete("board.deletefiles", file_id);
//		if(deleteCnt > 0) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return deleteCnt;
	}
	
	

	
	
}
