<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.sos.vo.ProductVO" %>
<%@ page import="net.sf.json.*" %>
<%@ page import="java.util.*" %>

	<%
	List<ProductVO> productList = null;

	if(request.getAttribute("productCodeList") != null){
		productList = (List<ProductVO>) request.getAttribute("productCodeList");
	}
	
	JSONArray jsonArray = JSONArray.fromObject(productList);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("productList", jsonArray);
	
	JSONObject jsonObject = JSONObject.fromObject(map);
	
	out.println(jsonObject.toString());
%>