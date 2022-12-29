package egovframework.hhg.board.vo;

import java.io.File;
import java.util.List;

import org.springframework.web.util.UriComponentsBuilder;

public class BoardVO {
	
	
	private Integer board_num;
	private Integer board_id;
	private Integer b_writer_id;
	private Integer user_id;
	private String b_title;
	private String b_content;
	private Integer b_writer;
	private Integer b_board_cnt;
	private String b_del_yn;
	private String b_regist_dt;
	private String b_update_dt;
	private Integer b_grp_no;
	private String level;
	private Integer b_rcount;
	private Integer m_seq;
	private Integer b_m_seq;
	private Integer b_notice;
	
	private String code_id; 
	private String code_mid_id;
	private String code_sub_id;
	private String code_main_nm;
	private String code_mid_nm;
	private String code_sub_nm;
	
	private Integer r_cnt;
	
	
	
	public Integer getR_cnt() {
		return r_cnt;
	}
	public void setR_cnt(Integer r_cnt) {
		this.r_cnt = r_cnt;
	}

	private Integer first_num;
	private Integer last_num;
	
	public Integer getFirst_num() {
		return first_num;
	}
	public void setFirst_num(Integer first_num) {
		this.first_num = first_num;
	}
	public Integer getLast_num() {
		return last_num;
	}
	public void setLast_num(Integer last_num) {
		this.last_num = last_num;
	}
	public String getCode_main_nm() {
		return code_main_nm;
	}
	public void setCode_main_nm(String code_main_nm) {
		this.code_main_nm = code_main_nm;
	}
	public String getCode_mid_nm() {
		return code_mid_nm;
	}
	public void setCode_mid_nm(String code_mid_nm) {
		this.code_mid_nm = code_mid_nm;
	}
	public String getCode_sub_nm() {
		return code_sub_nm;
	}
	public void setCode_sub_nm(String code_sub_nm) {
		this.code_sub_nm = code_sub_nm;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_mid_id() {
		return code_mid_id;
	}
	public void setCode_mid_id(String code_mid_id) {
		this.code_mid_id = code_mid_id;
	}
	public String getCode_sub_id() {
		return code_sub_id;
	}
	public void setCode_sub_id(String code_sub_id) {
		this.code_sub_id = code_sub_id;
	}

	// type
	private Integer ty_id;
	private String tynm;
	private Integer b_type;
	private Integer b_like;

	// paging
	private Integer pageSize; // 페이지 사이즈
	private Integer pageIndex = 1; // 현재 페이지
	private Integer firstIndex; // 첫 번째 페이지
	private Integer lastIndex; // 마지막 페이지
	private String searchKey; // 서치 키
	private String searchVal; // 서치 밸류
	private Integer cntPerPage = 5; // 게시물 몇 개
	
	private Integer heart;
	private Integer h_cnt;
	private String h_del_yn;
	
	private Integer currentPage;
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public String getH_del_yn() {
		return h_del_yn;
	}
	public void setH_del_yn(String h_del_yn) {
		this.h_del_yn = h_del_yn;
	}
	public Integer getH_cnt() {
		return h_cnt;
	}
	public void setH_cnt(Integer h_cnt) {
		this.h_cnt = h_cnt;
	}

	// file
	private Integer f_num;
	private long f_size;
	private String f_uuid; // 변경된 이름
	private String f_name; // 오리지널 이름
	private String f_reg_dt;
	private String f_path;
	private String f_cnt;
	private String f_del_yn;
	
	// tag
	private Integer tag_id;
	private List<Integer> tag_id2;
	private String tag_name;
	
	// viewLog
	private Integer v_log_id;
	private String v_dt;
	private Integer v_cnt;
	
	
	

	public Integer getV_cnt() {
		return v_cnt;
	}
	public void setV_cnt(Integer v_cnt) {
		this.v_cnt = v_cnt;
	}

	public Integer getV_log_id() {
		return v_log_id;
	}

	public void setV_log_id(Integer v_log_id) {
		this.v_log_id = v_log_id;
	}
	public String getV_dt() {
		return v_dt;
	}

	public void setV_dt(String v_dt) {
		this.v_dt = v_dt;
	}

	public Integer getB_notice() {
		return b_notice;
	}

	public void setB_notice(Integer b_notice) {
		this.b_notice = b_notice;
	}

	public Integer getB_m_seq() {
		return b_m_seq;
	}

	public void setB_m_seq(Integer b_m_seq) {
		this.b_m_seq = b_m_seq;
	}

	public Integer getM_seq() {
		return m_seq;
	}

	public void setM_seq(Integer m_seq) {
		this.m_seq = m_seq;
	}

	public List<Integer> getTag_id2() {
		return tag_id2;
	}

	public void setTag_id2(List<Integer> tag_id2) {
		this.tag_id2 = tag_id2;
	}

	public Integer getTag_id() {
		return tag_id;
	}

	public void setTag_id(Integer tag_id) {
		this.tag_id = tag_id;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public Integer getF_num() {
		return f_num;
	}

	public void setF_num(Integer f_num) {
		this.f_num = f_num;
	}

	public long getF_size() {
		return f_size;
	}

	public void setF_size(long f_size) {
		this.f_size = f_size;
	}

	public String getF_reg_dt() {
		return f_reg_dt;
	}

	public void setF_reg_dt(String f_reg_dt) {
		this.f_reg_dt = f_reg_dt;
	}

	public String getF_path() {
		return f_path;
	}

	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	public String getF_cnt() {
		return f_cnt;
	}

	public void setF_cnt(String f_cnt) {
		this.f_cnt = f_cnt;
	}

	public String getF_del_yn() {
		return f_del_yn;
	}

	public void setF_del_yn(String f_del_yn) {
		this.f_del_yn = f_del_yn;
	}

	public Integer getHeart() {
		return heart;
	}

	public void setHeart(Integer heart) {
		this.heart = heart;
	}
	public Integer getB_like() {
		return b_like;
	}

	public void setB_like(Integer b_like) {
		this.b_like = b_like;
	}
	
	public String getListLink() {
		UriComponentsBuilder uri = UriComponentsBuilder.fromPath("")
		.queryParam("m_seq", this.getM_seq())
		.queryParam("pageIndex", this.getPageIndex())
		.queryParam("cntPerPage", this.getCntPerPage())
		.queryParam("searchKey", this.getSearchKey())
		.queryParam("searchVal", this.getSearchVal());
		
		return uri.toUriString();
	}
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(Integer cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public Integer getB_writer_id() {
		return b_writer_id;
	}
	public void setB_writer_id(Integer b_writer_id) {
		this.b_writer_id = b_writer_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Integer getB_writer() {
		return b_writer;
	}
	public void setB_writer(Integer b_writer) {
		this.b_writer = b_writer;
	}
	public Integer getB_board_cnt() {
		return b_board_cnt;
	}
	public void setB_board_cnt(Integer b_board_cnt) {
		this.b_board_cnt = b_board_cnt;
	}
	public String getB_del_yn() {
		return b_del_yn;
	}
	public void setB_del_yn(String b_del_yn) {
		this.b_del_yn = b_del_yn;
	}
	public String getB_regist_dt() {
		return b_regist_dt;
	}
	public void setB_regist_dt(String b_regist_dt) {
		this.b_regist_dt = b_regist_dt;
	}
	public String getB_update_dt() {
		return b_update_dt;
	}
	public void setB_update_dt(String b_update_dt) {
		this.b_update_dt = b_update_dt;
	}
	public Integer getB_grp_no() {
		return b_grp_no;
	}
	public void setB_grp_no(Integer b_grp_no) {
		this.b_grp_no = b_grp_no;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(Integer firstIndex) {
		this.firstIndex = firstIndex + 1;
	}
	public Integer getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(Integer lastIndex) {
		this.lastIndex = lastIndex;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	
	public Integer getTy_id() {
		return ty_id;
	}
	public void setTy_id(Integer ty_id) {
		this.ty_id = ty_id;
	}
	public String getTynm() {
		return tynm;
	}
	public void setTynm(String tynm) {
		this.tynm = tynm;
	}
	public Integer getB_type() {
		return b_type;
	}

	public void setB_type(Integer b_type) {
		this.b_type = b_type;
	}

	public Integer getB_rcount() {
		return b_rcount;
	}

	public void setB_rcount(Integer b_rcount) {
		this.b_rcount = b_rcount;
	}
	
	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_uuid() {
		return f_uuid;
	}

	public void setF_uuid(String f_uuid) {
		this.f_uuid = f_uuid;
	}
	@Override
	public String toString() {
		return "BoardVO [m_seq=" + m_seq + ", first_num=" + first_num + ", last_num=" + last_num + "]";
	}
	
	

}
