package egovframework.hhg.survey.vo;

import java.util.List;

public class SurveyUtileVO {
	
	// tb_option
	
	private Integer sur_id;
	private Integer option_id; // 옵션 pk
	private Integer que_id; // question 질문 fk
	private String option_nm; // 옵션명
	private Integer option_num;
	private Integer option_type;
	
	public Integer getOption_type() {
		return option_type;
	}
	public void setOption_type(Integer option_type) {
		this.option_type = option_type;
	}
	public Integer getSur_id() {
		return sur_id;
	}
	public void setSur_id(Integer sur_id) {
		this.sur_id = sur_id;
	}
	public Integer getOption_num() {
		return option_num;
	}
	public void setOption_num(Integer option_num) {
		this.option_num = option_num;
	}
	public Integer getOption_id() {
		return option_id;
	}
	public void setOption_id(Integer option_id) {
		this.option_id = option_id;
	}
	public Integer getQue_id() {
		return que_id;
	}
	public void setQue_id(Integer que_id) {
		this.que_id = que_id;
	}
	public String getOption_nm() {
		return option_nm;
	}
	public void setOption_nm(String option_nm) {
		this.option_nm = option_nm;
	}
	
	// tb_category
	
	private Integer cate_id; // 카테고리 pk
	private String cate_nm; // 카테고리 nm

	public Integer getCate_id() {
		return cate_id;
	}
	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	@Override
	public String toString() {
		return "SurveyUtileVO [sur_id=" + sur_id + ", option_id=" + option_id + ", que_id=" + que_id + ", option_nm="
				+ option_nm + ", option_num=" + option_num + ", option_type=" + option_type + ", cate_id=" + cate_id
				+ ", cate_nm=" + cate_nm + ", ans_seq=" + ans_seq + ", user_id=" + user_id + ", ans_con=" + ans_con
				+ ", ans_dt=" + ans_dt + ", ans_up_dt=" + ans_up_dt + ", ans_up_user_id=" + ans_up_user_id
				+ ", ans_etc_con=" + ans_etc_con + ", sel_option_id=" + sel_option_id + "]";
	}
	
	
	// tb_anwser
	
	private Integer ans_seq;
	private Integer user_id;
	private String ans_con;
	private String ans_dt;
	private String ans_up_dt;
	private String ans_up_user_id;
	private String ans_etc_con;
	private Integer sel_option_id;


	public Integer getAns_seq() {
		return ans_seq;
	}
	public void setAns_seq(Integer ans_seq) {
		this.ans_seq = ans_seq;
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
	public String getAns_etc_con() {
		return ans_etc_con;
	}
	public void setAns_etc_con(String ans_etc_con) {
		this.ans_etc_con = ans_etc_con;
	}
	public Integer getSel_option_id() {
		return sel_option_id;
	}
	public void setSel_option_id(Integer sel_option_id) {
		this.sel_option_id = sel_option_id;
	}
	
	
	
}
