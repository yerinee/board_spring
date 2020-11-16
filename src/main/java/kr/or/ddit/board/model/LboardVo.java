package kr.or.ddit.board.model;

public class LboardVo {
	private String lbo_id;
	private String lbo_nm;
	private String lbo_status;
	
	public LboardVo() {

	}
	
	public LboardVo(String lbo_id, String lbo_nm, String lbo_status) {
		super();
		this.lbo_id = lbo_id;
		this.lbo_nm = lbo_nm;
		this.lbo_status = lbo_status;
	}

	public String getLbo_id() {
		return lbo_id;
	}
	public void setLbo_id(String lbo_id) {
		this.lbo_id = lbo_id;
	}
	public String getLbo_nm() {
		return lbo_nm;
	}
	public void setLbo_nm(String lbo_nm) {
		this.lbo_nm = lbo_nm;
	}
	public String getLbo_status() {
		return lbo_status;
	}
	public void setLbo_status(String lbo_status) {
		this.lbo_status = lbo_status;
	}
	
	@Override
	public String toString() {
		return "LboardVo [lbo__id=" + lbo_id + ", lbo_nm=" + lbo_nm + ", lbo_status=" + lbo_status + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lbo_id == null) ? 0 : lbo_id.hashCode());
		result = prime * result + ((lbo_nm == null) ? 0 : lbo_nm.hashCode());
		result = prime * result + ((lbo_status == null) ? 0 : lbo_status.hashCode());
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
		LboardVo other = (LboardVo) obj;
		if (lbo_id == null) {
			if (other.lbo_id != null)
				return false;
		} else if (!lbo_id.equals(other.lbo_id))
			return false;
		if (lbo_nm == null) {
			if (other.lbo_nm != null)
				return false;
		} else if (!lbo_nm.equals(other.lbo_nm))
			return false;
		if (lbo_status == null) {
			if (other.lbo_status != null)
				return false;
		} else if (!lbo_status.equals(other.lbo_status))
			return false;
		return true;
	}
	
	
}
