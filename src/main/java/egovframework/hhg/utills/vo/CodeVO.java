package egovframework.hhg.utills.vo;

public class CodeVO {
	private String code_id;
	
	private String code_main_id;
	private String code_mid_id;
	private String code_sub_id;
	
	private String par_code_id;
	private String code_nm;
	private String code_regist_dt;
	private String code_del_dt;
	private String code_del_yn;
	
	private String code_new_id;
	
	private String code_content;
	private Integer code_num;
	
	
	private Integer level;
	
	private String searchKey;
	private String searchVal;
	private String viewType;	// TB : table, TR : tree
	
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
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getCode_num() {
		return code_num;
	}
	public void setCode_num(Integer code_num) {
		this.code_num = code_num;
	}
	public String getCode_new_id() {
		return code_new_id;
	}
	public void setCode_new_id(String code_new_id) {
		this.code_new_id = code_new_id;
	}
	public String getCode_content() {
		return code_content;
	}
	public void setCode_content(String code_content) {
		this.code_content = code_content;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_main_id() {
		return code_main_id;
	}
	public void setCode_main_id(String code_main_id) {
		this.code_main_id = code_main_id;
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
	public String getPar_code_id() {
		return par_code_id;
	}
	public void setPar_code_id(String par_code_id) {
		this.par_code_id = par_code_id;
	}
	public String getCode_nm() {
		return code_nm;
	}
	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}
	public String getCode_regist_dt() {
		return code_regist_dt;
	}
	public void setCode_regist_dt(String code_regist_dt) {
		this.code_regist_dt = code_regist_dt;
	}
	public String getCode_del_dt() {
		return code_del_dt;
	}
	public void setCode_del_dt(String code_del_dt) {
		this.code_del_dt = code_del_dt;
	}
	public String getCode_del_yn() {
		return code_del_yn;
	}
	public void setCode_del_yn(String code_del_yn) {
		this.code_del_yn = code_del_yn;
	}
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	@Override
	public String toString() {
		return "CodeVO [code_id=" + code_id + ", code_main_id=" + code_main_id + ", code_mid_id=" + code_mid_id
				+ ", code_sub_id=" + code_sub_id + ", par_code_id=" + par_code_id + ", code_nm=" + code_nm
				+ ", code_regist_dt=" + code_regist_dt + ", code_del_dt=" + code_del_dt + ", code_del_yn=" + code_del_yn
				+ ", code_new_id=" + code_new_id + ", code_content=" + code_content + "]";
	}

	
	
}
