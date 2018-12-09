package model;

import java.util.Date;

public class Statistic {
	private Integer id;
	private Integer user_id;
	private String user_name;
	private String method;
	private String course_name;
	private Date creat_date;
	public Statistic() {
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public Date getCreat_date() {
		return creat_date;
	}
	public void setCreat_date(Date creat_date) {
		this.creat_date = creat_date;
	}
	@Override
	public String toString() {
		return "Statistic [id=" + id + ", user_id=" + user_id + ", user_name=" + user_name + ", method=" + method
				+ ", course_name=" + course_name + ", creat_date=" + creat_date + "]";
	}
}