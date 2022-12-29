package egovframework.hhg.survey.vo;

public class SurveyVO {
	
	private Integer sur_num;
	private Integer sur_id; // 설문지 pk_번호
	private Integer user_id; // 유저 계정
	private String sur_title; // 설문지 제목
	private String sur_first_dt; // 고객에게 보여지기 전 설문지 완성 날짜
	private String sur_start_dt;
	private String startday;
	private String start_dt;
	private String end_dt;
	private String sur_mod_dt; // 제작자가 설문지 수정한 날짜
	private String endday;
	private String endday_result;
	private String sur_end_dt; // 마감 날짜
	private String sur_del_yn; // 설문지 삭제 여부
	private char sur_login_yn; // 회원이 로그인을 하지 않아도 설문을 할 수 있는가에 대한 지정
	private Integer sur_submit_cnt;
	private Integer dt;
	private Integer m_seq;
	private Integer survey_num;
	private Integer sur_cnt;
	
	
	
	public Integer getSurvey_num() {
		return survey_num;
	}
	public void setSurvey_num(Integer survey_num) {
		this.survey_num = survey_num;
	}
	public Integer getM_seq() {
		return m_seq;
	}
	public void setM_seq(Integer m_seq) {
		this.m_seq = m_seq;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public Integer getDt() {
		return dt;
	}
	public void setDt(Integer dt) {
		this.dt = dt;
	}
	public Integer getSur_submit_cnt() {
		return sur_submit_cnt;
	}
	public void setSur_submit_cnt(Integer sur_submit_cnt) {
		this.sur_submit_cnt = sur_submit_cnt;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getEndday_result() {
		return endday_result;
	}
	public void setEndday_result(String endday_result) {
		this.endday_result = endday_result;
	}
	public Integer getSur_cnt() {
		return sur_cnt;
	}
	public void setSur_cnt(Integer sur_cnt) {
		this.sur_cnt = sur_cnt;
	}
	public String getSur_start_dt() {
		return sur_start_dt;
	}
	public void setSur_start_dt(String sur_start_dt) {
		this.sur_start_dt = sur_start_dt;
	}
	public Integer getSur_num() {
		return sur_num;
	}
	public void setSur_num(Integer sur_num) {
		this.sur_num = sur_num;
	}
	public Integer getSur_id() {
		return sur_id;
	}
	public void setSur_id(Integer sur_id) {
		this.sur_id = sur_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getSur_title() {
		return sur_title;
	}
	public void setSur_title(String sur_title) {
		this.sur_title = sur_title;
	}
	public String getSur_first_dt() {
		return sur_first_dt;
	}
	public void setSur_first_dt(String sur_first_dt) {
		this.sur_first_dt = sur_first_dt;
	}
	public String getSur_mod_dt() {
		return sur_mod_dt;
	}
	public void setSur_mod_dt(String sur_mod_dt) {
		this.sur_mod_dt = sur_mod_dt;
	}
	public String getSur_end_dt() {
		return sur_end_dt;
	}
	public void setSur_end_dt(String sur_end_dt) {
		this.sur_end_dt = sur_end_dt;
	}
	public String getSur_del_yn() {
		return sur_del_yn;
	}
	public void setSur_del_yn(String sur_del_yn) {
		this.sur_del_yn = sur_del_yn;
	}
	public char getSur_login_yn() {
		return sur_login_yn;
	}
	public void setSur_login_yn(char sur_login_yn) {
		this.sur_login_yn = sur_login_yn;
	}
	
	
}
