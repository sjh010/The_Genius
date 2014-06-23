package org.sos.vo;


public class CategoryVO {

	private int category_id;
	private int category_parent_id;
	private String category_name;
	private String category_depth;
	
	private double type_adventure;
	private double type_practice;
	private double type_rule;
	private double type_tradition;
	private double type_enjoyment;
	private double type_pleasure;
	private double type_harmony;
	
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getCategory_parent_id() {
		return category_parent_id;
	}
	public void setCategory_parent_id(int category_parent_id) {
		this.category_parent_id = category_parent_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_depth() {
		return category_depth;
	}
	public void setCategory_depth(String category_depth) {
		this.category_depth = category_depth;
	}
	public double getType_adventure() {
		return type_adventure;
	}
	public void setType_adventure(double type_adventure) {
		this.type_adventure = type_adventure;
	}
	public double getType_practice() {
		return type_practice;
	}
	public void setType_practice(double type_practice) {
		this.type_practice = type_practice;
	}
	public double getType_rule() {
		return type_rule;
	}
	public void setType_rule(double type_rule) {
		this.type_rule = type_rule;
	}
	public double getType_tradition() {
		return type_tradition;
	}
	public void setType_tradition(double type_tradition) {
		this.type_tradition = type_tradition;
	}
	public double getType_enjoyment() {
		return type_enjoyment;
	}
	public void setType_enjoyment(double type_enjoyment) {
		this.type_enjoyment = type_enjoyment;
	}
	public double getType_pleasure() {
		return type_pleasure;
	}
	public void setType_pleasure(double type_pleasure) {
		this.type_pleasure = type_pleasure;
	}
	public double getType_harmony() {
		return type_harmony;
	}
	public void setType_harmony(double type_harmony) {
		this.type_harmony = type_harmony;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [category_id=" + category_id
				+ ", category_parent_id=" + category_parent_id
				+ ", category_name=" + category_name + ", category_depth="
				+ category_depth + ", type_adventure=" + type_adventure
				+ ", type_practice=" + type_practice + ", type_rule="
				+ type_rule + ", type_tradition=" + type_tradition
				+ ", type_enjoyment=" + type_enjoyment + ", type_pleasure="
				+ type_pleasure + ", type_harmony=" + type_harmony + "]";
	}
	
	
	
}
