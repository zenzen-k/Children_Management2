package info;

public class EmpBean {
	private int e_no;
	private String e_name;
	
	public EmpBean() {
		super();
	}
	public EmpBean(int e_no, String e_name) {
		super();
		this.e_no = e_no;
		this.e_name = e_name;
	}
	
	
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	
}
