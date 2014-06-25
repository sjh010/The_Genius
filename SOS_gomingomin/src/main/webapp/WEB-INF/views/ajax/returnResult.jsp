<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%
	JSONObject json = new JSONObject();
	json.put("result",request.getAttribute("result"));
	out.print(json);
%>