package egovframework.hhg.login.vo;

public class UserVO {
	private Integer user_id;
	private String u_id;
	private String u_pwd;
	private String u_ncnm;
	private Integer u_type;
	
	private String u_regist_dt;
	private String u_update_dt;
	
	private Integer l_board_id;
	private Integer l_user_id;
	private Integer log_no;
	private Integer read_date;
	private Integer login_date;

	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_ncnm() {
		return u_ncnm;
	}
	public void setU_ncnm(String u_ncnm) {
		this.u_ncnm = u_ncnm;
	}
	public String getU_regist_dt() {
		return u_regist_dt;
	}
	public void setU_regist_dt(String u_regist_dt) {
		this.u_regist_dt = u_regist_dt;
	}
	public String getU_update_dt() {
		return u_update_dt;
	}
	public void setU_update_dt(String u_update_dt) {
		this.u_update_dt = u_update_dt;
	}
	public Integer getL_board_id() {
		return l_board_id;
	}
	public void setL_board_id(Integer l_board_id) {
		this.l_board_id = l_board_id;
	}
	public Integer getL_user_id() {
		return l_user_id;
	}
	public void setL_user_id(Integer l_user_id) {
		this.l_user_id = l_user_id;
	}
	public Integer getLog_no() {
		return log_no;
	}
	public void setLog_no(Integer log_no) {
		this.log_no = log_no;
	}
	public Integer getRead_date() {
		return read_date;
	}
	public void setRead_date(Integer read_date) {
		this.read_date = read_date;
	}
	public Integer getLogin_date() {
		return login_date;
	}
	public void setLogin_date(Integer login_date) {
		this.login_date = login_date;
	}
	
	public Integer getU_type() {
		return u_type;
	}
	public void setU_type(Integer u_type) {
		this.u_type = u_type;
	}
	
	
}
