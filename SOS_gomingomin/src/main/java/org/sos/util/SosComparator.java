package org.sos.util;

import java.util.Comparator;

import org.sos.vo.OrderVO;

public class SosComparator implements Comparator<OrderVO> {

	@Override
	public int compare(OrderVO o1, OrderVO o2) {
		
		return (int) o1.getValue() > o2.getValue() ? -1 : (o1.getValue() == o2.getValue() ? 0 : 1);
	}
}
