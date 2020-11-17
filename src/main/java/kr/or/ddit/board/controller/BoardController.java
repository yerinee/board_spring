package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.FileVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.model.ReplyVo;
import kr.or.ddit.board.service.BoardServiceI;
import kr.or.ddit.fileupload.FileUpdloadUtil;
import kr.or.ddit.member.model.MemberVO;


@RequestMapping("/board")
@Controller 
public class BoardController {
	
	
	@Resource(name = "boardService")
	private BoardServiceI boardService;

	
	// 게시판 생성화면
	@RequestMapping(path ="/lboard")
	public String getLboard(Model model) {	
		
		List<LboardVo> lbolist = boardService.getlboard();
		model.addAttribute("lbolist", lbolist);
		
		
		return "board/createboard";
	}
	
	// 게시판 생성버튼
	@RequestMapping(path ="/createLboard")
	public String createLboard(String lbo_nm, String lbo_status ,
								HttpSession session, Model model) {

		LboardVo lbovo = new LboardVo("", lbo_nm, lbo_status);
		

		int insertCnt = boardService.insertLboard(lbovo);
		
		if(insertCnt >0) { // 1건이 입력되었을때 : 정상
			
			List<LboardVo> lbolist = boardService.getActivelboard();
			session.setAttribute("lboardlist", lbolist);
			
		}
		
		return "redirect:/board/lboard";

	}
	
	
	// 게시판 수정버튼
	@RequestMapping(path ="/updateLboard")
	public String updateLboard(String lbo_nm, String lbo_status , String lbo_id,
								HttpSession session, Model model) {
		

		LboardVo lboardvo = new LboardVo(lbo_id, lbo_nm, lbo_status);

		int updateCnt = boardService.updateLboard(lboardvo);

		
		List<LboardVo> lbolist = boardService.getActivelboard();
		session.setAttribute("lboardlist", lbolist);
		
		
		return "redirect:/board/lboard";
		
	}
	
	
	
	// 각 게시판 클릭
	@RequestMapping(path ="/boardlist")
	public String geteachBoard(String lbo_id , String page, Model model) {


		int curpage = page == null? 1 :Integer.parseInt(page); //처음 페이지는 무조건 1페이지가 나올수있게 만들었다.
		int pageSize = 10;	
		
		Map<String, String> maparam = new HashMap<String, String>();
		maparam.put("lbo_id", lbo_id);
		maparam.put("page", String.valueOf(curpage));
		maparam.put("pageSize", String.valueOf(pageSize));
		
		
		Map<String, Object> maps = boardService.getboard(maparam);
		
		List<BoardVo> bolist =(List<BoardVo>) maps.get("bolist");
		LboardVo lboard = (LboardVo)maps.get("lboard");

		
		model.addAttribute("bolist", bolist);
		model.addAttribute("lboard", lboard);
		model.addAttribute("page", curpage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pages", maps.get("pages"));

		return "board/boardlist";
	}
	
	// 해당 게시글 상세보기
	@RequestMapping(path ="/boardDetail")
	public String getBoardDetail(String bo_id, Model model) {
		
		BoardVo boardvo = boardService.getboard(bo_id);		
		List<FileVo> filelist = boardService.getfiles(bo_id);
		List<ReplyVo> replylist = boardService.getreply(bo_id);
	
		
		model.addAttribute("boardvo", boardvo);
		model.addAttribute("filelist", filelist);
		model.addAttribute("replylist", replylist);
	
		return "board/board";
	}
	
	
	// 해당 게시글 파일 다운로드
	@RequestMapping(path ="/fileDown")
	public String getfileDown(String file_id, HttpSession session, Model model) throws IOException {

		FileVo filevo = boardService.getfile(file_id);
		
		model.addAttribute("file_nm" ,filevo.getFile_nm());
		model.addAttribute("file_path" ,filevo.getFile_path());


		return "fileDownloadView";
	}
	
	
	
	// 게시글 작성버튼
	@RequestMapping(path ="/insertboardview")
	public String insertBoardView(String lbo_id, BoardVo boardVo, Model model) {
		
		model.addAttribute("lbo_id", lbo_id);
		
		return "board/writeboard";
	}
	
	// 게시글 작성확인
	@RequestMapping(path ="/insertboard")
	public String insertBoard(BoardVo boardVo, Model model, MultipartHttpServletRequest multirequest, 
							HttpSession session, HttpServletRequest request)  {
		
		MemberVO membervo = (MemberVO)session.getAttribute("S_MEMBER");
		String mem_id = membervo.getMem_id();
		boardVo.setMem_id(mem_id);
		
		System.out.println("boardvo : " + boardVo + "mem_id : " + mem_id);
		
		String insertbo_id = boardService.insertBoard(boardVo);
		System.out.println("insertbo_id : " + insertbo_id);
		
		List<MultipartFile> files = multirequest.getFiles("file");
		for(int i=0 ; i < files.size() ; i++) {
		
		System.out.println("files : " + files);
		
			if(files.get(i).getSize()>0) {
				String filename = UUID.randomUUID().toString();
				String extension = FileUpdloadUtil.getExtenstion(files.get(i).getOriginalFilename());
				String filepath = "E:\\profile\\" + filename +"."+ extension;
				File uploadFile = new File(filepath);
				try {
					files.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
				}

				FileVo filevo = new FileVo(insertbo_id, files.get(i).getOriginalFilename(), filepath);
				boardService.insertFile(filevo);	
				
			}
		
		}		
		
		return "redirect:/board/boardlist?lbo_id="+boardVo.getLbo_id();
	}
	
	//게시글 수정 버튼
	@RequestMapping(path ="updateBoardview")
	public String updateBoardview(String bo_id, Model model) {
		
		BoardVo boardvo = boardService.getboard(bo_id);
		
		List<FileVo> filelist = boardService.getfiles(bo_id);
		System.out.println("filelist.size() : " + filelist.size());
		
		
		model.addAttribute("boardvo", boardvo);
		model.addAttribute("filelist", filelist);
		
		return "board/boardupdate";
	}
	
	
	// 게시글 수정
	@RequestMapping(path ="/updateBoard")
	public String updateBoard(BoardVo boardVo, String delfile, Model model, MultipartHttpServletRequest multirequest, 
							HttpSession session)  {
		
		MemberVO membervo = (MemberVO)session.getAttribute("S_MEMBER");
		String mem_id = membervo.getMem_id();
		boardVo.setMem_id(mem_id);
		
		System.out.println("boardvo : " + boardVo + "mem_id : " + mem_id);
		
		if(!delfile.equals("null") || delfile !=null || !delfile.equals("")) {
			String[] file_id = delfile.split(",");
			for(int i=0; i<file_id.length;i++) {
				
				boardService.delfiles(file_id[i]);
			}		
		}
		
		boardService.updateboard(boardVo);
		
		
		// 서버의 상태가 바뀔경우 새로고침시 오류가 발생하므로 redirect를 써주어야한다.-> 사용자페이지 조회요청
		List<MultipartFile> files = multirequest.getFiles("file");
		for(int i=0 ; i < files.size() ; i++) {

		
		System.out.println("files : " + files);
		
			if(files.get(i).getSize()>0) {
				String filename = UUID.randomUUID().toString();
				String extension = FileUpdloadUtil.getExtenstion(files.get(i).getOriginalFilename());
				String filepath = "E:\\profile\\" + filename +"."+ extension;
				File uploadFile = new File(filepath);
				try {
					files.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
				}

				FileVo filevo = new FileVo(boardVo.getBo_id(), files.get(i).getOriginalFilename(), filepath);
				boardService.insertFile(filevo);	
				
			}
		
		}		
		
		return "redirect:/board/boardDetail?bo_id="+ boardVo.getBo_id();
	}
	
	
	
	// 게시글 삭제
	@RequestMapping(path ="/delboard")
	public String deleteBoard(String bo_id, String lbo_id, Model model) {
		
		model.addAttribute("bo_id", bo_id);
		
		boardService.delboard(bo_id);

		return "redirect:/board/boardlist?lbo_id="+lbo_id;
	}
	
	
	// 답글 작성버튼
	@RequestMapping(path ="/answerview")
	public String getAnswerview(String bo_id, String lbo_id, String gn, Model model) {

		model.addAttribute("p_seq", bo_id);
		model.addAttribute("lbo_id", lbo_id);
		model.addAttribute("gn", gn);
		
		return "board/writeAnswer";
	}
	
	
	
	// 답글 작성
	@RequestMapping(path ="/answer")
	public String getAnswer(BoardVo boardVo, Model model, HttpSession session,  MultipartHttpServletRequest multirequest) {
		
		MemberVO membervo = (MemberVO)session.getAttribute("S_MEMBER");
		String mem_id = membervo.getMem_id();
		
		boardVo.setMem_id(mem_id);
	
		String insertbo_id = boardService.insertAnswer(boardVo);
		System.out.println("boardVo : " + boardVo);
		
		
		List<MultipartFile> files = multirequest.getFiles("file");
		for(int i=0 ; i < files.size() ; i++) {

		
//		System.out.println("files : " + files);
		
			if(files.get(i).getSize()>0) {
				String filename = UUID.randomUUID().toString();
				String extension = FileUpdloadUtil.getExtenstion(files.get(i).getOriginalFilename());
				String filepath = "E:\\profile\\" + filename +"."+ extension;
				File uploadFile = new File(filepath);
				try {
					files.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
				}

				FileVo filevo = new FileVo(insertbo_id, files.get(i).getOriginalFilename(), filepath);
				boardService.insertAnswerFile(filevo);	
				
			}
		
		}		

		return "redirect:/board/boardlist?lbo_id="+boardVo.getLbo_id();
	}
	
	
	// 댓글 작성
	@RequestMapping(path ="/insertreply")
	public String insertapply(String bo_id, String re_con , Model model, HttpSession session) {
		
		
		MemberVO membervo = (MemberVO) session.getAttribute("S_MEMBER");
//		String mem_id = membervo.getMem_id();
		
		ReplyVo replyvo = new ReplyVo();		
		replyvo.setBo_id(bo_id);
		replyvo.setRe_con(re_con);
		replyvo.setMem_id(membervo.getMem_id());
		
		
		System.out.println("replyvo : " + replyvo );
		
		boardService.insertReply(replyvo);
		
		model.addAttribute("reply", re_con);
		System.out.println("re_con : "  + re_con);
		
		return "redirect:/board/boardDetail?bo_id="+bo_id;
	}
	
	
	// 댓글 삭제
	@RequestMapping(path ="/delreply")
	public String deleteapply(ReplyVo replyVo, Model model, HttpSession session) {
		
		boardService.delReply(replyVo.getRe_id());
		
		return "redirect:/board/boardDetail?bo_id="+replyVo.getBo_id();
	}

}
