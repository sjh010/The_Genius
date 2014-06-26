<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>

	<input type="text" id="keyword">
	<button type="button" id="searchBtn">검색</button>
	<ul id="info"></ul>

</body>

<script>

	$(function(){
		
		var searchBtn = $('#searchBtn');
		
		searchBtn.click(function(){
			
            $.ajax({
            	
            	url : "/mySearch",
            	type : "post",
            	dataType : 'JSON',
            	data : {
            		keyword : $('#keyword').val()
            	},
            	success : function(data1){
            		var html = "";
            		
            		$.each(data1.productList, function(index, product){
            			
            			$.ajax({

                  		  	url : 'http://apis.skplanetx.com/11st/common/products',
                    	  	type : 'get',
                    		dateType : 'JSON',
                    		data : {
                        		appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec', 
                        		version : 1, 
                        		searchKeyword : product.product_id,
                    		},
                    		
                    		success : function(data2){
                        	
                        		console.log(data2);
                        		html = "<li>" + 
                        				"<img src=" + 
                        				data2.ProductSearchResponse.Products.Product.ProductImage300 +
                        				"></li>";
                        		
                        		$("#info").append(html);
                        	}       			
            			});
            		});
            		
            		 
            	}
            });
		});
	});
            		
            	
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			


                   
                    


</script>

</html>