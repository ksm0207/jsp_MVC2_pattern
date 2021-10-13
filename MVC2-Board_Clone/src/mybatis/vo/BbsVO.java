package mybatis.vo;

import java.util.List;

public class BbsVO {
	private String b_idx,
				subject,
				writer,
				content,
				file_name,
				ori_name,
				write_date,
				ip,
				hit,
				status,
				pwd;
	private List<CommVO> c_list;//해당 글의 댓글들이 저장되는 곳!
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getOri_name() {
		return ori_name;
	}
	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<CommVO> getC_list() {
		return c_list;
	}
	public void setC_list(List<CommVO> c_list) {
		this.c_list = c_list;
	}
}
