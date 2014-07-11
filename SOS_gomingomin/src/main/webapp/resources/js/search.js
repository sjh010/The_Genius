$(function() {
		$(".product").each(function(index, product) {
			var element = $(this).children(".search-result-element");
			var image = element.children(".thum").children("a").children(".product-image")[0];
			var price = element.children(".desc").children(".price")[0];
			var title = element.children(".desc").children(".title")[0];
			
			$.ajax({
					url : 'http://apis.skplanetx.com/11st/common/products',
					type : 'get',
					dateType : 'JSON',
					data : {
						appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
						version : 1,
						searchKeyword : product.id,
					},

					success : function(data) {
						console.log(data);
						var productInfo = data.ProductSearchResponse.Products.Product;
						var tmp = productInfo.ProductName;
						title.innerText = tmp.substr(0, 39)+"...";
						image.src = productInfo.ProductImage250;
						price.innerText = productInfo.ProductPrice + "원";
					}
			});
		});

	});
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
			$(".search-result-list li:last").after(str + str + str);

		};
		$('.content-body').bind('scroll', function(){
			   if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight){
				   //lastPostFunc();
			   }
		});