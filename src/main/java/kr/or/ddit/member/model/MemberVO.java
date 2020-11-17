package kr.or.ddit.member.model;

import java.util.Date;

public class MemberVO {
	private String mem_id;
	private String mem_pass;
	private String mem_nm;
	private Date reg_dt;

	
	// 생성자가 존재시에는 기본생성자가 따로 생성되지 않기때문에 기본생성자를 만들어줘야한다.
	public MemberVO() {
		
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pass() {
		return mem_pass;
	}


	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}


	public String getMem_nm() {
		return mem_nm;
	}


	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}


	public Date getReg_dt() {
		return reg_dt;
	}


	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}





//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + ((mem_id == null) ? 0 : mem_id.hashCode());
//		result = prime * result + ((mem_nm == null) ? 0 : mem_nm.hashCode());
//		result = prime * result + ((mem_pass == null) ? 0 : mem_pass.hashCode());
//		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
//		return result;
//	}
//
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		MemberVO other = (MemberVO) obj;
//		if (mem_id == null) {
//			if (other.mem_id != null)
//				return false;
//		} else if (!mem_id.equals(other.mem_id))
//			return false;
//		if (mem_nm == null) {
//			if (other.mem_nm != null)
//				return false;
//		} else if (!mem_nm.equals(other.mem_nm))
//			return false;
//		if (mem_pass == null) {
//			if (other.mem_pass != null)
//				return false;
//		} else if (!mem_pass.equals(other.mem_pass))
//			return false;
//		if (reg_dt == null) {
//			if (other.reg_dt != null)
//				return false;
//		} else if (!reg_dt.equals(other.reg_dt))
//			return false;
//		return true;
//	}


	public MemberVO(String mem_id, String mem_pass, String mem_nm) {
		super();
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_nm = mem_nm;
	}
	

	
	
}
