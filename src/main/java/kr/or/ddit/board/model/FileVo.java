package kr.or.ddit.board.model;

public class FileVo {
	private String file_id;
	private String bo_id;
	private String file_nm;
	private String file_path;
	
	public FileVo() {
		
	}
	
	public FileVo(String bo_id, String file_nm, String file_path) {
		super();
		this.bo_id = bo_id;
		this.file_nm = file_nm;
		this.file_path = file_path;
	}
	
	
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public String getBo_id() {
		return bo_id;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	@Override
	public String toString() {
		return "FileVo [file_id=" + file_id + ", bo_id=" + bo_id + ", file_nm=" + file_nm + ", file_path=" + file_path
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bo_id == null) ? 0 : bo_id.hashCode());
		result = prime * result + ((file_id == null) ? 0 : file_id.hashCode());
		result = prime * result + ((file_nm == null) ? 0 : file_nm.hashCode());
		result = prime * result + ((file_path == null) ? 0 : file_path.hashCode());
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
		FileVo other = (FileVo) obj;
		if (bo_id == null) {
			if (other.bo_id != null)
				return false;
		} else if (!bo_id.equals(other.bo_id))
			return false;
		if (file_id == null) {
			if (other.file_id != null)
				return false;
		} else if (!file_id.equals(other.file_id))
			return false;
		if (file_nm == null) {
			if (other.file_nm != null)
				return false;
		} else if (!file_nm.equals(other.file_nm))
			return false;
		if (file_path == null) {
			if (other.file_path != null)
				return false;
		} else if (!file_path.equals(other.file_path))
			return false;
		return true;
	}

	
	
}
