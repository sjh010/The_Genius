<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	String user_name = request.getParameter("user_name");
	List<CategoryVO> categoryList = (List<CategoryVO>)request.getAttribute("categoryList");
%>


 <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<!-- navbar -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">NoGomin</a>
        </div>

		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav navbar-right">
	        	<li class="dropdown">
	                <a href="" class="dropdown-toggle" data-toggle="dropdown"><%=user_name%>님<b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                    <li><a href="/myPage">마이페이지</a></li>
	                    <li><a href="/logout">로그아웃</a></li>
	                </ul>
	            </li>
	            <li><a href="/shoppingInfo">나의쇼핑정보</a></li>
	        </ul>
		</div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->

<nav class="navbar navbar-default categorybar" role="navigation">
    <div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar">
	        <ul class="nav navbar-nav navbar-right">
			<%for(CategoryVO category : categoryList) {
				if(category.getCategory_depth().equals("1")){
					int category_id = category.getCategory_id();
			%>
	        	<li class="dropdown">
	        		<a id="<%=category.getCategory_id() %>" role="button" data-toggle="dropdown" href="#">
	        		<%=category.getCategory_name() %></a>
	        		<ul class="dropdown-menu" role="menu" aria-labelledby="<%=category.getCategory_id() %>">
	        			<%for(CategoryVO category_depth2 : categoryList) {
					if(category_depth2.getCategory_parent_id()==category_id){
				%>
		        	<li class=""><a href=""><%=category_depth2.getCategory_name()%></a></li>
		        <% }}%>
	        		</ul>
	        	</li>
	        	
	        <%} }%>
	        </ul>
	        
	    
		</div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->

</nav>


