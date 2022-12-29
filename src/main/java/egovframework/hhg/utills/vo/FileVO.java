package egovframework.hhg.utills.vo;

public class FileVO {
	private Integer f_num;
	private long f_size;
	private String f_uuid; // 변경된 이름
	private String f_name; // 오리지널 이름
	private String f_reg_dt;
	private String f_path;
	private String f_cnt;
	private String f_del_yn;
	
	private Integer board_id;
	private Integer b_writer_id;
	
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
	public String getF_uuid() {
		return f_uuid;
	}
	public void setF_uuid(String f_uuid) {
		this.f_uuid = f_uuid;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
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
	public String getF_del_yn() {
		return f_del_yn;
	}
	public void setF_del_yn(String f_del_yn) {
		this.f_del_yn = f_del_yn;
	}
	
}
