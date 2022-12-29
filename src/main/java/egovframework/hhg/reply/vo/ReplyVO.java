package egovframework.hhg.reply.vo;

public class ReplyVO {
	private Integer reply_id;
	private Integer r_board_id;
	private Integer r_user_id;
	private String r_writer;
	private String r_content;
	private String r_regist_dt;
	private String r_update_dt;
	private String r_del_yn;
	private Integer r_new_cnt;
	private Integer r_par_no; // 부모 댓글 넘버
	private Integer r_level; // 들여쓰기

	
	public Integer getR_new_cnt() {
		return r_new_cnt;
	}
	public void setR_new_cnt(Integer r_new_cnt) {
		this.r_new_cnt = r_new_cnt;
	}
	public Integer getR_par_no() {
		return r_par_no;
	}
	public void setR_par_no(Integer r_par_no) {
		this.r_par_no = r_par_no;
	}
	public String getR_del_yn() {
		return r_del_yn;
	}
	public Integer getR_level() {
		return r_level;
	}
	public void setR_level(Integer r_level) {
		this.r_level = r_level;
	}

	
	public Integer getReply_id() {
		return reply_id;
	}
	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}
	public Integer getR_board_id() {
		return r_board_id;
	}
	public void setR_board_id(Integer r_board_id) {
		this.r_board_id = r_board_id;
	}
	public Integer getR_user_id() {
		return r_user_id;
	}
	public void setR_user_id(Integer r_user_id) {
		this.r_user_id = r_user_id;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_regist_dt() {
		return r_regist_dt;
	}
	public void setR_regist_dt(String r_regist_dt) {
		this.r_regist_dt = r_regist_dt;
	}
	public String getR_update_dt() {
		return r_update_dt;
	}
	public void setR_update_dt(String r_update_dt) {
		this.r_update_dt = r_update_dt;
	}
	public void setR_del_yn(String r_del_yn) {
		this.r_del_yn = r_del_yn;
	}
}
