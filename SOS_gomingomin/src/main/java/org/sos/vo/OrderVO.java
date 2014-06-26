package org.sos.vo;

public class OrderVO {

	private int product_id;
	private double value;

	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public double getValue() {
		return value;
	}


	public void setValue(double value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "OrderVO [productCode=" + product_id + ", value=" + value + "]";
	}

}
