package org.sos.vo;

public class AdminVO {
	
	private String admin_id;
	private String admin_password;
	private String admin_name;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_password="
				+ admin_password + ", admin_name=" + admin_name + "]";
	}

}
