package org.sos.util;

import java.util.Comparator;

import org.sos.vo.OrderVO;

public class SosComparator implements Comparator<OrderVO> {

	@Override
	public int compare(OrderVO o1, OrderVO o2) {
		
		if(o1.getValue() > o2.getValue()) return -1;
		else if(o1.getValue() < o2.getValue()) return 1;
		else return 0;
	}
}
