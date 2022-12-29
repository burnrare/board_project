package egovframework.hhg.survey.vo;

import java.util.Arrays;
import java.util.List;

public class SurveyQuestionVO {
	
	private Integer que_id; // 질문 seq pk
	private Integer sur_id; // 해당 설문지 fk
	private Integer cate_id; // 해당 카테고리 fk
	private String que_content; // 질문 내용
	private String que_type; // 객관식 m 주관식 w
	private Integer que_par_id; // 질문 안의 질문
	private String que_dt; // 질문 등록일
	private String que_up_dt; // 질문 수정일
	private String que_del_yn; // 질문 삭제 여부
	private Integer que_page_num; // 페이지 넘버
	private Integer sur_num;
	private String cate_nm;
	private String que_max_num;
	private String que_ess_type;
	private String que_ess_visible;
	private Integer que_max_type;
	private Integer que_min_type;
	private Integer que_num;
	private Integer que_row;
	private Integer q_rnk;
	
	private Integer user_id;
	private Integer last_page_num;
	
	
	private List<SurveyUtileVO> surveyOptionList;
	private List<SurveyAnswerVO> surveyAnswerList;
	
	
	public Integer getLast_page_num() {
		return last_page_num;
	}
	public void setLast_page_num(Integer last_page_num) {
		this.last_page_num = last_page_num;
	}
	public Integer getQ_rnk() {
		return q_rnk;
	}
	public void setQ_rnk(Integer q_rnk) {
		this.q_rnk = q_rnk;
	}
	public void setQue_row(Integer que_row) {
		this.que_row = que_row;
	}
	public Integer getQue_row() {
		return que_row;
	}
	public void setQue_rowl(Integer que_row) {
		this.que_row = que_row;
	}
	public Integer getQue_num() {
		return que_num;
	}
	public void setQue_num(Integer que_num) {
		this.que_num = que_num;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public List<SurveyAnswerVO> getSurveyAnswerList() {
		return surveyAnswerList;
	}
	public void setSurveyAnswerList(List<SurveyAnswerVO> surveyAnswerList) {
		this.surveyAnswerList = surveyAnswerList;
	}
	
	public Integer getQue_max_type() {
		return que_max_type;
	}
	public void setQue_max_type(Integer que_max_type) {
		this.que_max_type = que_max_type;
	}
	public Integer getQue_min_type() {
		return que_min_type;
	}
	public void setQue_min_type(Integer que_min_type) {
		this.que_min_type = que_min_type;
	}
	public String getQue_ess_visible() {
		return que_ess_visible;
	}
	public void setQue_ess_visible(String que_ess_visible) {
		this.que_ess_visible = que_ess_visible;
	}
	public String getQue_ess_type() {
		return que_ess_type;
	}
	public void setQue_ess_type(String que_ess_type) {
		this.que_ess_type = que_ess_type;
	}
	public String getQue_max_num() {
		return que_max_num;
	}
	public void setQue_max_num(String que_max_num) {
		this.que_max_num = que_max_num;
	}
	public List<SurveyUtileVO> getSurveyOptionList() {
		return surveyOptionList;
	}
	public void setSurveyOptionList(List<SurveyUtileVO> surveyOptionList) {
		this.surveyOptionList = surveyOptionList;
	}
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	public Integer getSur_num() {
		return sur_num;
	}
	public void setSur_num(Integer sur_num) {
		this.sur_num = sur_num;
	}
	public Integer getQue_id() {
		return que_id;
	}
	public void setQue_id(Integer que_id) {
		this.que_id = que_id;
	}
	public Integer getSur_id() {
		return sur_id;
	}
	public void setSur_id(Integer sur_id) {
		this.sur_id = sur_id;
	}
	public Integer getCate_id() {
		return cate_id;
	}
	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}
	public String getQue_content() {
		return que_content;
	}
	public void setQue_content(String que_content) {
		this.que_content = que_content;
	}
	public String getQue_type() {
		return que_type;
	}
	public void setQue_type(String que_type) {
		this.que_type = que_type;
	}
	public Integer getQue_par_id() {
		return que_par_id;
	}
	public void setQue_par_id(Integer que_par_id) {
		this.que_par_id = que_par_id;
	}
	public String getQue_dt() {
		return que_dt;
	}
	public void setQue_dt(String que_dt) {
		this.que_dt = que_dt;
	}
	public String getQue_up_dt() {
		return que_up_dt;
	}
	public void setQue_up_dt(String que_up_dt) {
		this.que_up_dt = que_up_dt;
	}
	public String getQue_del_yn() {
		return que_del_yn;
	}
	public void setQue_del_yn(String que_del_yn) {
		this.que_del_yn = que_del_yn;
	}
	public Integer getQue_page_num() {
		return que_page_num;
	}
	public void setQue_page_num(Integer que_page_num) {
		this.que_page_num = que_page_num;
	}
	@Override
	public String toString() {
		return "SurveyQuestionVO [que_id=" + que_id + ", sur_id=" + sur_id + ", cate_id=" + cate_id + ", que_content="
				+ que_content + ", que_type=" + que_type + ", que_par_id=" + que_par_id + ", que_dt=" + que_dt
				+ ", que_up_dt=" + que_up_dt + ", que_del_yn=" + que_del_yn + ", que_page_num=" + que_page_num
				+ ", sur_num=" + sur_num + ", cate_nm=" + cate_nm + ", surveyOptionList=" + surveyOptionList + "]";
	}
	
}
