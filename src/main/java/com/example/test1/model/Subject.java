package com.example.test1.model;

/*import lombok.Data;

@Data*/
public class Subject {
	private String subno;
	private String subname;
	private String subprof;
	private String subgrade;
	private String subdept;
	public String getSubno() {
		return subno;
	}
	public void setSubno(String subno) {
		this.subno = subno;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubprof() {
		return subprof;
	}
	public void setSubprof(String subprof) {
		this.subprof = subprof;
	}
	public String getSubgrade() {
		return subgrade;
	}
	public void setSubgrade(String subgrade) {
		this.subgrade = subgrade;
	}
	public String getSubdept() {
		return subdept;
	}
	public void setSubdept(String subdept) {
		this.subdept = subdept;
	}
	
}
