package kr.or.ddit.board.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;

import kr.or.ddit.board.WebTestConfig;

public class LoginControllerTest extends WebTestConfig {

	@Test
	public void loginviewtest() throws Exception {		
		mockMvc.perform(get("/login/view"))				
		   .andExpect(status().is(200));
	}
	
	@Test
	public void loginsucesstest() throws Exception {		
		mockMvc.perform(get("/login/process")
				.param("mem_id", "brown")
				.param("mem_pass", "brownPass"))
		.andExpect(status().is(200))
		.andExpect(model().attributeExists("to_day"));
	}
	
	@Test
	public void loginfailtest() throws Exception {		
		mockMvc.perform(get("/login/process")
				.param("mem_id", "brown")
				.param("mem_pass", "brownPass1"))
		.andExpect(status().is(200))
		.andExpect(model().attributeExists("msg"));
	}

}
