<!-- 
  Created by Saemi Lim on 2014-06-24.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="./navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="container-header">
			<div class="page-header">
				<h1>검색결과</h1>
			</div>
		</div>
		<div class="container-body">
			<ul class="search-result">
				<li><span class="search-result-element"> <span
						class="thum"> <a href="#"><img name="상품1"
								src="제목 없음.png" /></a>
					</span> <span class="desc"> <span class="title"><a href="#">11번가
									단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span class="price">499,000원</span>
					</span>
				</span></li>
				<li><span class="search-result-element"> <span
						class="thum"> <a href="#"><img name="상품1"
								src="제목 없음.png" /></a>
					</span> <span class="desc"> <span class="title"><a href="#">11번가
									단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span class="price">499,000원</span>
					</span>
				</span></li>
				<li><span class="search-result-element"> <span
						class="thum"> <a href="#"><img name="상품1"
								src="제목 없음.png" /></a>
					</span> <span class="desc"> <span class="title"><a href="#">11번가
									단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span class="price">499,000원</span>
					</span>
				</span></li>
			</ul>
		</div>
	</div>
	<script>
		var lastPostFunc = function() {
			var str = "<li>"
					+ " <span class='search-result-element'>"
					+ "  <span class='thum'>"
					+ "  <a href='#'><img name='상품1' src='제목 없음.png'/></a>"
					+ "  </span>"
					+ " <span class='desc'>"
					+ "  <span class='title'><a href='#'>11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span>"
					+ " <span class='price'>499,000원</span>" + " </span>"
					+ " </span>" + "</li>";
			$(".search-result li:last").after(str + str + str);

		};
		$(window).scroll(
				function() {
					if ($(window).scrollTop() == $(document).height()
							- $(window).height()) {
						lastPostFunc();
					}

				});
	</script>
</body>
</html>