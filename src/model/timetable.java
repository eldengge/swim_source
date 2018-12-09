package model;

import java.util.Date;

public class timetable {
     private Integer id;
     private Integer course_id;
     private String course_name;
     private Integer user_id;
     private Date creat_date;
     private Date update_date;
     private Integer number;
     public timetable(){}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCourse_id() {
		return course_id;
	}
	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Date getCreat_date() {
		return creat_date;
	}
	public void setCreat_date(Date creat_date) {
		this.creat_date = creat_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "timetable [id=" + id + ", course_id=" + course_id + ", course_name=" + course_name + ", user_id="
				+ user_id + ", creat_date=" + creat_date + ", update_date=" + update_date + ", number=" + number + "]";
	}
}
