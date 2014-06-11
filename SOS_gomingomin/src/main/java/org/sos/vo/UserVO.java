package org.sos.vo;

public class UserVO {

	private String user_id;
	private String user_password;
	private String user_name;
	private String user_birth;
	private String user_sex;
	private String user_addr;
	private String user_email;
	private String user_mobile;
	private String user_phone;
	private String user_joindate;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) { 
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password="
				+ user_password + ", user_name=" + user_name + ", user_birth="
				+ user_birth + ", user_sex=" + user_sex + ", user_addr="
				+ user_addr + ", user_email=" + user_email + ", user_mobile="
				+ user_mobile + ", user_phone=" + user_phone
				+ ", user_joindate=" + user_joindate + "]";
	}
	
}
