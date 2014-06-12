package org.sos.vo;

public class UserCharacterVO {
	
	private String user_id;
	private int user_character1;
	private int user_character2;
	private int user_character3;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_character1() {
		return user_character1;
	}
	public void setUser_character1(int user_character1) {
		this.user_character1 = user_character1;
	}
	public int getUser_character2() {
		return user_character2;
	}
	public void setUser_character2(int user_character2) {
		this.user_character2 = user_character2;
	}
	public int getUser_character3() {
		return user_character3;
	}
	public void setUser_character3(int user_character3) {
		this.user_character3 = user_character3;
	}
	
	@Override
	public String toString() {
		return "UserCharacterVO [user_id=" + user_id + ", user_character1="
				+ user_character1 + ", user_character2=" + user_character2
				+ ", user_character3=" + user_character3 + "]";
	}
	
	
	

}
