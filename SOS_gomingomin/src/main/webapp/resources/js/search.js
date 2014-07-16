$(function() {
		$(".product").each(function(index, product) {
			var element = $(this).children(".search-result-element");
			var image = element.children(".thum").children("a").children(".product-image")[0];
			var price = element.children(".desc").children(".price")[0];
			
			$.ajax({
				url : 'http://apis.skplanetx.com/11st/common/products',
				type : 'get',
				dateType : 'JSON',
				data : {
					appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
					version : 1,
					searchKeyword : $(this)[0].id,
				},

				success : function(data) {
					var productInfo = data.ProductSearchResponse.Products.Product;
					image.src = productInfo.ProductImage250;
					price.innerText = formatnumber(productInfo.ProductPrice,3) + "원";
				}
		});
		});

	});
		var lastPostFunc = function() {

			var str = "<li>"
					+ " <span class='search-result-element'>"
					+ "  <span class='thum'>"
					+ "  <a href='#'><img name='상품1' src=''/></a>"
					+ "  </span>"
					+ " <span class='desc'>"
					+ "  <span class='title'><a href='#'>상품제목</a></span>"
					+ " <span class='price'>상품가격</span>" + " </span>"
					+ " </span>" + "</li>";
			$(".search-result-list li:last").after(str);

		};
		
		var formatnumber = function(v1,v2){
				var str = new Array(); 
				v1 = String(v1); 
				for(var i=1;i<=v1.length;i++){ 
					if(i % v2) str[v1.length-i] = v1.charAt(v1.length-i); 
					else str[v1.length-i] = ','+v1.charAt(v1.length-i); 
				}
				return str.join('').replace(/^,/,''); 
		};
		
		
		
