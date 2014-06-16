package org.sos.vo;

public class OrderVO {

	private int productCode;
	private double value;
	
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
	
	@Override
	public String toString() {
		return "OrderVO [productCode=" + productCode + ", value=" + value + "]";
	}
	
	
	
	
}
