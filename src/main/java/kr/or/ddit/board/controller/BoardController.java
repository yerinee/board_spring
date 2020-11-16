package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.service.BoardServiceI;


@RequestMapping("/board")
@Controller 
public class BoardController {
	
	
	@Resource(name = "boardService")
	private BoardServiceI boardService;
	
	// 게시판 생성
	@RequestMapping(path ="/lboard")
	public String getLboard(Model model) {	
		
		List<LboardVo> lbolist = boardService.getlboard();
		model.addAttribute("lbolist", lbolist);
		
		
		return "board/createboard";
	}
	
	// 각 게시판 클릭
	@RequestMapping(path ="/eachboard")
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
		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pages", maps.get("pages"));
		
		
		
		
		return "board/boardlist";
	}
}
