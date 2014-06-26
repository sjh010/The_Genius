<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	List<UserVO> userList = (List<UserVO>)request.getAttribute("userList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민 관리자페이지</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="../navbar/navbar.jsp" flush="false"/>

<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>회원관리</h1>
        </div>
    </div>
    <div class="container-body">
        <form id="admin-userMange-form">
            <div class="form-group userManage-user-grade">
                <label class="control-label">해당 회원의 등급을</label>
                <select class="form-control input-short" name="user_grade">
                    <option value="user">일반회원</option>
                    <option value="admin">관리자</option>
                </select>
                <label class="control-label">로 </label>
                <button type="button" class="btn btn-default" id="update-userGrade">변경</button>
            </div>

            <div class="board">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th></th>
                        <th>아이디</th>
                        <th>등급</th>
                        <th>가입일자</th>
                    </tr>
                    </thead>
                    <tbody>
                     <% if(userList != null){
                     	for(UserVO user : userList){ %>
                    <tr>
                        <td class="id">
                            <div class=radiobox>
                                <input type="radio" name="user_id" value="<%=user.getUser_id()%>">
                            </div>
                        </td>
                        <td class="product-name"><%=user.getUser_id()%></td>
                        <td class="price"><%=user.getUser_grade()%></td>
                        <td class="menu"><%=user.getUser_joindate()%></td>
                    </tr>
                    <% }} %>
                    </tbody>
                </table>
            </div>
            <div class="paging">
                <ul class="pagination">
                   <%
					PagingVO pagingVo = (PagingVO) request.getAttribute("paging");
					int minPage = pagingVo.getMinPage();
					int maxPage = pagingVo.getMaxPage();
					int pageNo = pagingVo.getPageNo();
					 
					if(minPage - 1 >= 1){%>
						<li><a href="?page=<%=minPage %>">&laquo;</a></li>
					<%} else {	%>
							<li class="disabled"><a>&laquo;</a></li>
					<% } %>
					
					<% for (int i = minPage + 1; i <= maxPage; i++) {
							if (pageNo == i) { %>
						<li class="active"><a><%=i%></a></li>
					<% } else { %>
					<li><a href="?page=<%=i%>"><%=i%></a></li>
					<% }} %>
					
					<% if(maxPage + 1 <= pagingVo.getPageCnt()){%>
						<li><a href="?page=<%=(maxPage + 1) %>">&raquo;</a></li>
					<%} else {	%>
						<li class="disabled"><a>&raquo;</a></li>
					<% } %>
                </ul>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
$("#update-userGrade").click(function(){
	var $form = $("#admin-userMange-form");
	console.log($form.serialize());
	$.ajax({
		data : $form.serialize(),
		type : 'post',
		url : '/admin/userManage/updateUserGrade',
		dataType : 'json',
		success : function(data){
			if(data.result == 'y'){
				alert("변경되었습니다");
				location.reload();
			}
		}
	})
});
</script>
</body>
</html>