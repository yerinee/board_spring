package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;


import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;

public interface BoardDaoI {
	
	// 모든 게시판목록 가져오기위함
	List<LboardVo> getlboard();
	
	// 활성화된 게시판 목록 가져오기 위함
	List<LboardVo> getActivelboard();
	
	// 게시판vo을 가져오기 위함
	LboardVo getBoardnm(Map<String, String> map);
	
	// 해당 게시물 목록을 가져오기위함
	List<BoardVo> getboard(Map<String, String> map);
	
	// 해당 게시물 목록 개수
	int getboardCount(Map<String, String> map);
	
	// 게시판 수정
	int updateLboard(LboardVo lboardvo);
	
	// 새로운 게시판을 등록
	int insertLboard(LboardVo lboardVo);
	
	// 해당 게시글을 가져오기 위함
	BoardVo getboard(String bo_id);
	
	// 게시글 등록
	String insertBoard(BoardVo boardvo);
	
	// 파일 등록
	int insertFile(FileVo filevo);
	
	// 해당 게시글 파일 가져오기
	List<FileVo> getfiles(String bo_id);
	
	// 해당 게시글 삭제
	int delboard(String bo_id);
	
	// 게시글 답글 작성
	String insertAnswer(BoardVo boardvo);
	
	// 게시글 답글 파일 등록
	int insertAnswerFile(FileVo filevo);
	
	// 게시글 댓글 작성
	int insertReply(ReplyVo replyvo);
	
	// 댓글 목록 출력
	List<ReplyVo> getreply(String bo_id);
	
	// 댓글 삭제 
	int delReply(String re_id);
	
	// 파일 가져오기_다운로드 위해
	FileVo getfile(String file_id);
	
	// 게시글 수정
	int updateboard(BoardVo boardvo);
	
	// 파일 삭제
	int delfiles(String file_id);
	
	
}
