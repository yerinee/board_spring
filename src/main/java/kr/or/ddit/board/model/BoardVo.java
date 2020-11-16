package kr.or.ddit.board.model;

import java.util.Date;

public class BoardVo {
	private String bo_id;
	private String bo_title;
	private Date bo_date;
	private String bo_con;
	private int gn;
	private String bo_status;
	private String lbo_id;
	private String mem_id;
	private String p_seq;
	private String level;
	
	public BoardVo(){
		
	}
	
	public BoardVo(String bo_id, String bo_title, String bo_con, int gn, String bo_status, String lbo_id, String mem_id,
			String p_seq) {
		super();
		this.bo_id = bo_id;
		this.bo_title = bo_title;
		this.bo_con = bo_con;
		this.gn = gn;
		this.bo_status = bo_status;
		this.lbo_id = lbo_id;
		this.mem_id = mem_id;
		this.p_seq = p_seq;
	}
	
	public String getBo_id() {
		return bo_id;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public Date getBo_date() {
		return bo_date;
	}
	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}
	public String getBo_con() {
		return bo_con;
	}
	public void setBo_con(String bo_con) {
		this.bo_con = bo_con;
	}
	public int getGn() {
		return gn;
	}
	public void setGn(int gn) {
		this.gn = gn;
	}
	public String getBo_status() {
		return bo_status;
	}
	public void setBo_status(String bo_status) {
		this.bo_status = bo_status;
	}
	public String getLbo_id() {
		return lbo_id;
	}
	public void setLbo_id(String lbo_id) {
		this.lbo_id = lbo_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getP_seq() {
		return p_seq;
	}
	public void setP_seq(String p_seq) {
		this.p_seq = p_seq;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "BoardVo [bo_id=" + bo_id + ", bo_title=" + bo_title + ", bo_date=" + bo_date + ", bo_con=" + bo_con
				+ ", gn=" + gn + ", bo_status=" + bo_status + ", lbo_id=" + lbo_id + ", mem_id=" + mem_id + ", p_seq="
				+ p_seq + ", level=" + level + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bo_con == null) ? 0 : bo_con.hashCode());
		result = prime * result + ((bo_date == null) ? 0 : bo_date.hashCode());
		result = prime * result + ((bo_id == null) ? 0 : bo_id.hashCode());
		result = prime * result + ((bo_status == null) ? 0 : bo_status.hashCode());
		result = prime * result + ((bo_title == null) ? 0 : bo_title.hashCode());
		result = prime * result + gn;
		result = prime * result + ((lbo_id == null) ? 0 : lbo_id.hashCode());
		result = prime * result + ((level == null) ? 0 : level.hashCode());
		result = prime * result + ((mem_id == null) ? 0 : mem_id.hashCode());
		result = prime * result + ((p_seq == null) ? 0 : p_seq.hashCode());
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
		BoardVo other = (BoardVo) obj;
		if (bo_con == null) {
			if (other.bo_con != null)
				return false;
		} else if (!bo_con.equals(other.bo_con))
			return false;
		if (bo_date == null) {
			if (other.bo_date != null)
				return false;
		} else if (!bo_date.equals(other.bo_date))
			return false;
		if (bo_id == null) {
			if (other.bo_id != null)
				return false;
		} else if (!bo_id.equals(other.bo_id))
			return false;
		if (bo_status == null) {
			if (other.bo_status != null)
				return false;
		} else if (!bo_status.equals(other.bo_status))
			return false;
		if (bo_title == null) {
			if (other.bo_title != null)
				return false;
		} else if (!bo_title.equals(other.bo_title))
			return false;
		if (gn != other.gn)
			return false;
		if (lbo_id == null) {
			if (other.lbo_id != null)
				return false;
		} else if (!lbo_id.equals(other.lbo_id))
			return false;
		if (level == null) {
			if (other.level != null)
				return false;
		} else if (!level.equals(other.level))
			return false;
		if (mem_id == null) {
			if (other.mem_id != null)
				return false;
		} else if (!mem_id.equals(other.mem_id))
			return false;
		if (p_seq == null) {
			if (other.p_seq != null)
				return false;
		} else if (!p_seq.equals(other.p_seq))
			return false;
		return true;
	}
	
	
	
}
