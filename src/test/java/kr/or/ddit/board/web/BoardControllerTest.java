package kr.or.ddit.board.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.InputStream;

import org.junit.Test;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import kr.or.ddit.board.WebTestConfig;
import kr.or.ddit.member.model.MemberVO;

public class BoardControllerTest extends WebTestConfig{

	@Test
	public void getboardtest() throws Exception {
		mockMvc.perform(get("/board/lboard")).andExpect(status().is(200));
					
	}
	
	@Test
	public void getMemberTest() throws Exception {
		mockMvc.perform(get("/board/createLboard")
				.param("lbo_nm", "자유게시판2g")
				.param("lbo_status", "1"))
		  .andExpect(status().is(302));
					
	}

	@Test
	public void updateLboardTest() throws Exception {
		mockMvc.perform(get("/board/updateLboard")
					.param("lbo_nm", "자유게시판25")
					.param("lbo_status", "1")
					.param("lbo_id", "4"))
		  .andExpect(status().is(302));
					
	}
	
	@Test
	public void getboardlistTest() throws Exception {
		mockMvc.perform(get("/board/boardlist")
				.param("lbo_id", "1")
				.param("page", "1"))
		  .andExpect(status().is(200))
		  .andExpect(model().attributeExists("bolist"))
		  .andExpect(model().attributeExists("lboard"));
				
	}
	
	@Test
	public void getboardDtailTest() throws Exception {
		mockMvc.perform(get("/board/boardDetail")
				.param("bo_id", "13"))
		  .andExpect(status().is(200))
		  .andExpect(model().attributeExists("boardvo"))
		  .andExpect(model().attributeExists("filelist"));
				
	}
	
	@Test
	public void fileDownTest() throws Exception {
		mockMvc.perform(get("/board/fileDown")
				.param("file_id", "6"))
		  .andExpect(model().attributeExists("file_nm"))
		  .andExpect(model().attributeExists("file_path"));
				
	}
	
	@Test
	public void insertboardviewTest() throws Exception {
		mockMvc.perform(get("/board/insertboardview")
				.param("lbo_id", "2"))
		   .andExpect(status().is(200));
				
	}
	
	@Test
	public void insertboard() throws Exception {
//		 MockHttpSession session = new MockHttpSession();
//		 MemberVO membervo = new MemberVO("brown", "brownPass", "브라운");
//		 session.setAttribute("S_MEMBER", membervo);
		 
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/config/upload/ryan.jpg");
			
		MockMultipartFile realFilename = new MockMultipartFile("file", "ryan.jpg", "image/jpg", is);
				 
		mockMvc.perform(MockMvcRequestBuilders.fileUpload("/board/insertboard")
				.file(realFilename)
				.param("bo_id", "")
				.param("bo_title", "안녕")
				.param("bo_con", "하세용")
				.param("lbo_id", "1")
				.session(session))
		   .andExpect(status().is(302));
				
	}
	
	@Test
	public void updateBoardview() throws Exception {
		mockMvc.perform(get("/board/updateBoardview")
				.param("bo_id", "2"))
		   .andExpect(status().is(200));
				
	}
	
	@Test
	public void updateboard() throws Exception {
//		MockHttpSession session = new MockHttpSession();
//		MemberVO membervo = new MemberVO("brown", "brownPass", "브라운");
//		session.setAttribute("S_MEMBER", membervo);
		 
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/config/upload/ryan.jpg");
			
		MockMultipartFile realFilename = new MockMultipartFile("file", "ryan.jpg", "image/jpg", is);
				 
		mockMvc.perform(MockMvcRequestBuilders.fileUpload("/board/updateBoard")
				.file(realFilename)
				.param("delfile", "null")
				.param("bo_id", "10")
				.param("bo_title", "안녕")
				.param("bo_con", "하세용")
				.param("lbo_id", "1")
				.session(session))
		   .andExpect(status().is(302));
				
	}
	
	@Test
	public void answer() throws Exception {
//		MockHttpSession session = new MockHttpSession();
//		MemberVO membervo = new MemberVO("brown", "brownPass", "브라운");
//		session.setAttribute("S_MEMBER", membervo);
		
		 
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/config/upload/ryan.jpg");
			
		MockMultipartFile realFilename = new MockMultipartFile("file", "ryan.jpg", "image/jpg", is);
		
		mockMvc.perform(MockMvcRequestBuilders.fileUpload("/board/answer")
				.file(realFilename)

				.param("bo_id", "6")
				.param("bo_title", "안녕22")
				.param("bo_con", "하세용22")
				.param("lbo_id", "2")
				.param("p_seq", "6")
				
				.session(session))
		   .andExpect(status().is(302));
				
	}
	
	
	@Test
	public void delboard() throws Exception {
		mockMvc.perform(get("/board/delboard")
				.param("bo_id", "5"))
		   .andExpect(status().is(302))
		   .andExpect(model().attributeExists("bo_id"));
				
	}
	
	@Test
	public void answerview() throws Exception {
		mockMvc.perform(get("/board/answerview")
				.param("bo_id", "6"))
		   .andExpect(status().is(200))
		   .andExpect(model().attributeExists("p_seq"));
				
	}
	@Test
	public void insertreply() throws Exception {
		 
		 MockHttpSession session = new MockHttpSession();
		 MemberVO membervo = new MemberVO("brown", "brownPass", "브라운");
		 session.setAttribute("S_MEMBER", membervo);
		
		mockMvc.perform(post("/board/insertreply")
				.param("bo_id", "7")
				.param("re_con", "안녕하세용")
				.session(session))
				
//		   .andExpect(status().is(302))
		   .andExpect(model().attributeExists("reply"));
				
	}
	
	
	
	@Test
	public void delreply() throws Exception {
		mockMvc.perform(get("/board/delreply")
				.param("bo_id", "3")
				.param("re_id", "4"))
		   .andExpect(status().is(302));
				
	}
	
	
}
