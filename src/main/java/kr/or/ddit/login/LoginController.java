package kr.or.ddit.login;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.board.model.LboardVo;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceI;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;


@RequestMapping("/login")
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name = "memberService")
	private MemberServiceI memberservice;
	
	@Resource(name = "boardService")
	private BoardServiceI boardservice;
	
	
	@RequestMapping(path = "/view", method = {RequestMethod.GET})
	public String getView() {	
		return "login/view";
	}

	
	@RequestMapping(path = "/process")
	public String process(String mem_id, String mem_pass, MemberVO memberVo, 
							HttpSession session, Model model){

		MemberVO dbmembervo = memberservice.getMember(mem_id);
		
//		logger.debug("dbmembervo.pass : {}",dbmembervo.getMem_pass());
		if(dbmembervo != null && memberVo.getMem_pass().equals(dbmembervo.getMem_pass())) {
		
			List<LboardVo> lbolist = boardservice.getActivelboard();
			session.setAttribute("lboardlist", lbolist);
	
			session.setAttribute("S_MEMBER", dbmembervo);
			model.addAttribute("to_day", new Date());
			return "main";
		}else {
			model.addAttribute("msg", "fail");
			return "login/view";
		}	
	}

	
}
