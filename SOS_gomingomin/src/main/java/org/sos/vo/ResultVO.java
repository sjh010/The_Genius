package org.sos.vo;

public class ResultVO {

	private int type_adventure;
	private int type_practice;
	private int type_rule;
	private int type_tradition;
	private int type_enjoyment;
	private int type_pleasure;
	private int type_harmony;
	
	public int getType_adventure() {
		return type_adventure;
	}
	public void setType_adventure(int type_adventure) {
		this.type_adventure = type_adventure;
	}
	public int getType_practice() {
		return type_practice;
	}
	public void setType_practice(int type_practice) {
		this.type_practice = type_practice;
	}
	public int getType_rule() {
		return type_rule;
	}
	public void setType_rule(int type_rule) {
		this.type_rule = type_rule;
	}
	public int getType_tradition() {
		return type_tradition;
	}
	public void setType_tradition(int type_tradition) {
		this.type_tradition = type_tradition;
	}
	public int getType_enjoyment() {
		return type_enjoyment;
	}
	public void setType_enjoyment(int type_enjoyment) {
		this.type_enjoyment = type_enjoyment;
	}
	public int getType_pleasure() {
		return type_pleasure;
	}
	public void setType_pleasure(int type_pleasure) {
		this.type_pleasure = type_pleasure;
	}
	public int getType_harmony() {
		return type_harmony;
	}
	public void setType_harmony(int type_harmony) {
		this.type_harmony = type_harmony;
	}
	
	@Override
	public String toString() {
		return "ResultVO [type_adventure=" + type_adventure
				+ ", type_practice=" + type_practice + ", type_rule="
				+ type_rule + ", type_tradition=" + type_tradition
				+ ", type_enjoyment=" + type_enjoyment + ", type_pleasure="
				+ type_pleasure + ", type_harmony=" + type_harmony + "]";
	}
	
}
