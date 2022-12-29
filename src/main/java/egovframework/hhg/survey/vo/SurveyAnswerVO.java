package egovframework.hhg.survey.vo;

public class SurveyAnswerVO {
	private Integer ans_seq;
	private Integer que_id;
	private Integer option_id;
	private Integer user_id;
	private String ans_con;
	private String ans_dt;
	private String ans_up_dt;
	private String ans_up_user_id;
	private String ans_etc_con;
	private Integer sel_option_id;
	private Integer sur_id;
	
	
	
	public Integer getSur_id() {
		return sur_id;
	}
	public void setSur_id(Integer sur_id) {
		this.sur_id = sur_id;
	}
	public Integer getSel_option_id() {
		return sel_option_id;
	}
	public void setSel_option_id(Integer sel_option_id) {
		this.sel_option_id = sel_option_id;
	}
	public String getAns_etc_con() {
		return ans_etc_con;
	}
	public void setAns_etc_con(String ans_etc_con) {
		this.ans_etc_con = ans_etc_con;
	}
	public Integer getAns_seq() {
		return ans_seq;
	}
	public void setAns_seq(Integer ans_seq) {
		this.ans_seq = ans_seq;
	}
	public Integer getQue_id() {
		return que_id;
	}
	public void setQue_id(Integer que_id) {
		this.que_id = que_id;
	}
	public Integer getOption_id() {
		return option_id;
	}
	public void setOption_id(Integer option_id) {
		this.option_id = option_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getAns_con() {
		return ans_con;
	}
	public void setAns_con(String ans_con) {
		this.ans_con = ans_con;
	}
	public String getAns_dt() {
		return ans_dt;
	}
	public void setAns_dt(String ans_dt) {
		this.ans_dt = ans_dt;
	}
	public String getAns_up_dt() {
		return ans_up_dt;
	}
	public void setAns_up_dt(String ans_up_dt) {
		this.ans_up_dt = ans_up_dt;
	}
	public String getAns_up_user_id() {
		return ans_up_user_id;
	}
	public void setAns_up_user_id(String ans_up_user_id) {
		this.ans_up_user_id = ans_up_user_id;
	}
	
	
}
