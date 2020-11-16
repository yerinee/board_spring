package kr.or.ddit.board.model;

import java.util.Date;

public class ReplyVo {
	private String re_id;
	private String re_con;
	private Date re_date;
	private String re_status;
	private String bo_id;
	private String mem_id;
	
	public String getRe_id() {
		return re_id;
	}
	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}
	public String getRe_con() {
		return re_con;
	}
	public void setRe_con(String re_con) {
		this.re_con = re_con;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getRe_status() {
		return re_status;
	}
	public void setRe_status(String re_status) {
		this.re_status = re_status;
	}
	public String getBo_id() {
		return bo_id;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "ReplyVo [re_id=" + re_id + ", re_con=" + re_con + ", re_date=" + re_date + ", re_status=" + re_status
				+ ", bo_id=" + bo_id + ", mem_id=" + mem_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bo_id == null) ? 0 : bo_id.hashCode());
		result = prime * result + ((mem_id == null) ? 0 : mem_id.hashCode());
		result = prime * result + ((re_con == null) ? 0 : re_con.hashCode());
		result = prime * result + ((re_date == null) ? 0 : re_date.hashCode());
		result = prime * result + ((re_id == null) ? 0 : re_id.hashCode());
		result = prime * result + ((re_status == null) ? 0 : re_status.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVo other = (ReplyVo) obj;
		if (bo_id == null) {
			if (other.bo_id != null)
				return false;
		} else if (!bo_id.equals(other.bo_id))
			return false;
		if (mem_id == null) {
			if (other.mem_id != null)
				return false;
		} else if (!mem_id.equals(other.mem_id))
			return false;
		if (re_con == null) {
			if (other.re_con != null)
				return false;
		} else if (!re_con.equals(other.re_con))
			return false;
		if (re_date == null) {
			if (other.re_date != null)
				return false;
		} else if (!re_date.equals(other.re_date))
			return false;
		if (re_id == null) {
			if (other.re_id != null)
				return false;
		} else if (!re_id.equals(other.re_id))
			return false;
		if (re_status == null) {
			if (other.re_status != null)
				return false;
		} else if (!re_status.equals(other.re_status))
			return false;
		return true;
	}
	
	
}
