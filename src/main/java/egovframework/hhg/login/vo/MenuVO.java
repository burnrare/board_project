package egovframework.hhg.login.vo;

import java.util.List;

import egovframework.hhg.board.vo.BoardVO;

public class MenuVO {
	// tb_menu
	private Integer m_seq;
	private Integer ty_id;
	private String ty_nm;
	private String tynm;
	private String m_url;
	private String m_nm;
	private String m_regist_dt;
	private String m_delete_dt;
	private String m_del_yn;
	private Integer user_id;
	private String searchVal;
	
	private Integer year_dt;
	private Integer month_dt;
	private Integer day_dt;
	private Integer time_dt;
	private Integer month_cnt;
	private Integer day_cnt;
	private Integer time_cnt;
	
	private Integer firstIndex;
	private Integer lastIndex;
	
	private Integer m_num;
	
	private List<BoardVO> boardList;
	
	public Integer getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(Integer firstIndex) {
		this.firstIndex = firstIndex;
	}
	public Integer getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(Integer lastIndex) {
		this.lastIndex = lastIndex;
	}
	public Integer getM_num() {
		return m_num;
	}
	public void setM_num(Integer m_num) {
		this.m_num = m_num;
	}
	public Integer getYear_dt() {
		return year_dt;
	}
	public void setYear_dt(Integer year_dt) {
		this.year_dt = year_dt;
	}
	public Integer getMonth_dt() {
		return month_dt;
	}
	public void setMonth_dt(Integer month_dt) {
		this.month_dt = month_dt;
	}
	public Integer getDay_dt() {
		return day_dt;
	}
	public void setDay_dt(Integer day_dt) {
		this.day_dt = day_dt;
	}
	public Integer getTime_dt() {
		return time_dt;
	}
	public void setTime_dt(Integer time_dt) {
		this.time_dt = time_dt;
	}
	public Integer getMonth_cnt() {
		return month_cnt;
	}
	public void setMonth_cnt(Integer month_cnt) {
		this.month_cnt = month_cnt;
	}
	public Integer getDay_cnt() {
		return day_cnt;
	}
	public void setDay_cnt(Integer day_cnt) {
		this.day_cnt = day_cnt;
	}
	public Integer getTime_cnt() {
		return time_cnt;
	}
	public void setTime_cnt(Integer time_cnt) {
		this.time_cnt = time_cnt;
	}
	public String getTynm() {
		return tynm;
	}
	public void setTynm(String tynm) {
		this.tynm = tynm;
	}
	public String getTy_nm() {
		return ty_nm;
	}
	public void setTy_nm(String ty_nm) {
		this.ty_nm = ty_nm;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public List<BoardVO> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getM_seq() {
		return m_seq;
	}
	public void setM_seq(Integer m_seq) {
		this.m_seq = m_seq;
	}
	public Integer getTy_id() {
		return ty_id;
	}
	public void setTy_id(Integer ty_id) {
		this.ty_id = ty_id;
	}
	public String getM_url() {
		return m_url;
	}
	public void setM_url(String m_url) {
		this.m_url = m_url;
	}
	public String getM_nm() {
		return m_nm;
	}
	public void setM_nm(String m_nm) {
		this.m_nm = m_nm;
	}
	public String getM_regist_dt() {
		return m_regist_dt;
	}
	public void setM_regist_dt(String m_regist_dt) {
		this.m_regist_dt = m_regist_dt;
	}
	public String getM_delete_dt() {
		return m_delete_dt;
	}
	public void setM_delete_dt(String m_delete_dt) {
		this.m_delete_dt = m_delete_dt;
	}
	public String getM_del_yn() {
		return m_del_yn;
	}
	public void setM_del_yn(String m_del_yn) {
		this.m_del_yn = m_del_yn;
	}
	
	// tb_menu_auth;
	private Integer auth_seq;
	private Integer auth_type;

	public Integer getAuth_seq() {
		return auth_seq;
	}
	public void setAuth_seq(Integer auth_seq) {
		this.auth_seq = auth_seq;
	}
	public Integer getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(Integer auth_type) {
		this.auth_type = auth_type;
	}
	@Override
	public String toString() {
		return "MenuVO [m_seq=" + m_seq + ", ty_id=" + ty_id + ", m_url=" + m_url + ", m_nm=" + m_nm + ", m_regist_dt="
				+ m_regist_dt + ", m_delete_dt=" + m_delete_dt + ", m_del_yn=" + m_del_yn + ", user_id=" + user_id
				+ ", searchVal=" + searchVal + ", boardList=" + boardList + ", auth_seq=" + auth_seq + ", auth_type="
				+ auth_type + "]";
	}
	
	
}
