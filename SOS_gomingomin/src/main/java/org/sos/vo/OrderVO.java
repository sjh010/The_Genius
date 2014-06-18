package org.sos.vo;

public class OrderVO {

	private int productCode;
	private double value;
	private int orderValue;
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public int getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(int orderValue) {
		this.orderValue = orderValue;
	}
	
	@Override
	public String toString() {
		return "OrderVO [productCode=" + productCode + ", value=" + value
				+ ", orderValue=" + orderValue + "]";
	}

}
