package org.sos.util;

import java.util.ArrayList;
import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;

public class CosineSimilarity extends AbstractRecommendCalc {

	@Override
	public List<OrderVO> calculateOrder(List<ResultVO> characterList, List<ProductVO> productList) {
		
		List<double[]> resultArrList = new ArrayList<double[]>();
		
        // 데이터 받아옴
        for(ResultVO character : characterList){
           double[] resultArr = new double[7];
           resultArr[0] = character.getType_adventure();
           resultArr[1] = character.getType_practice();
           resultArr[2] = character.getType_rule();
           resultArr[3] = character.getType_tradition();
           resultArr[4] = character.getType_enjoyment();
           resultArr[5] = character.getType_pleasure();
           resultArr[6] = character.getType_harmony();
           resultArrList.add(resultArr);
        }
        
        // 각 항목 정규화
        List<double[]> nomalizedResultArrList = new ArrayList<double[]>();
        
        for(double[] resultArr : resultArrList){
           double tempResult = 0;
           for (int i = 0; i < 7; i++) {
              tempResult += Math.pow(resultArr[i], 2);
           }

           tempResult = Math.sqrt(tempResult);
           
           double[] nomalizedResultArr = new double[7];
           for (int i = 0; i < 7; i++) {
              nomalizedResultArr[i] = resultArr[i] / tempResult;
              System.out.println(nomalizedResultArr[i]);
           }
           
           nomalizedResultArrList.add(nomalizedResultArr);
        }
        
        // 정규화 평균내기
        double[] avgNomalizedResultArr = new double[7];
        
        for(double[] nomalizedResultArr : nomalizedResultArrList){
           avgNomalizedResultArr[0] += nomalizedResultArr[0];
           avgNomalizedResultArr[1] += nomalizedResultArr[1];
           avgNomalizedResultArr[2] += nomalizedResultArr[2];
           avgNomalizedResultArr[3] += nomalizedResultArr[3];
           avgNomalizedResultArr[4] += nomalizedResultArr[4];
           avgNomalizedResultArr[5] += nomalizedResultArr[5];
           avgNomalizedResultArr[6] += nomalizedResultArr[6];
        }
        
        for(int i=0 ; i<7 ; i++){
           avgNomalizedResultArr[i] = avgNomalizedResultArr[i]/3.0;
           
           System.out.println("avgNomalizedResultArr : " + avgNomalizedResultArr[i]);
        }
       

        for (ProductVO product : productList) {
           double[] productArr = new double[7];

           productArr[0] = product.getType_adventure();
           productArr[1] = product.getType_practice();
           productArr[2] = product.getType_rule();
           productArr[3] = product.getType_tradition();
           productArr[4] = product.getType_enjoyment();
           productArr[5] = product.getType_pleasure();
           productArr[6] = product.getType_harmony();

           double[] nomalizedproductArr = productArr.clone();
           double tempProduct = 0;
           for (int i = 0; i < 7; i++) {
              tempProduct += Math.pow(productArr[i], 2);
           }

           tempProduct = Math.sqrt(tempProduct);
           double cosineResult = 0;
           for (int i = 0; i < 7; i++) {
              nomalizedproductArr[i] = productArr[i] / tempProduct;
              cosineResult += nomalizedproductArr[i] * avgNomalizedResultArr[i];
           }

           OrderVO orderVO = new OrderVO();
           
           orderVO.setProductCode(product.getProduct_id());
           orderVO.setValue(cosineResult);
           
           orderedProductList.add(orderVO);
        }
        	
        System.out.println("Cosine Before : " + orderedProductList.toString());
        
        orderedProductList = orderProducts(orderedProductList);
        
        System.out.println("Cosine After : " + orderedProductList.toString());

        return orderedProductList;
	}

}
