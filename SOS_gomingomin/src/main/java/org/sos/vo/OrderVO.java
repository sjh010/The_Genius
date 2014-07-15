package org.sos.vo;

public class OrderVO {

	private int product_id;
	private String product_name;
	private double value;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "OrderVO [product_id=" + product_id + ", product_name="
				+ product_name + ", value=" + value + "]";
	}
	
}
