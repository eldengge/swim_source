package model;

import java.util.Date;

public class user {
	private int id;
	private String name;
	private int age;
	private String sex;
	private Date birthday;
	private String img;
	private String parent_name;
	private String phone;
	private Date creat_date;
	private Date update_date;
	private int all_state;
	private int swim_number;
	private int card_state;
	private Date end_date;
     public user(){}
     
	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getCard_state() {
		return card_state;
	}

	public void setCard_state(int card_state) {
		this.card_state = card_state;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getCreat_date() {
		return creat_date;
	}
	public void setCreat_date(Date creat_date) {
		this.creat_date = creat_date;
	}
	public int getAll_state() {
		return all_state;
	}
	public void setAll_state(int all_state) {
		this.all_state = all_state;
	}
	public int getSwim_number() {
		return swim_number;
	}
	public void setSwim_number(int swim_number) {
		this.swim_number = swim_number;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "user [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + ", birthday=" + birthday
				+ ", img=" + img + ", parent_name=" + parent_name + ", phone=" + phone + ", creat_date=" + creat_date
				+ ", update_date=" + update_date + ", all_state=" + all_state + ", swim_number=" + swim_number
				+ ", card_state=" + card_state + ", end_date=" + end_date + "]";
	}
	
}
