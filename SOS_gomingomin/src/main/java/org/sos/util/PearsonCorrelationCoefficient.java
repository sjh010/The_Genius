package org.sos.util;

import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;

public class PearsonCorrelationCoefficient extends AbstractRecommendCalc {

	@Override
	public List<OrderVO> calculateOrder(List<ResultVO> characterList, List<ProductVO> productList) {
		
		double meanResult = 0;
		double[] resultDeviationScores = new double[7];
		double sumResultDeviationSquared = 0;
		
		ResultVO characterAvg = getResultAvg(characterList);
		
		System.out.println("ResultVO : " + characterAvg.toString());
		
		meanResult = (characterAvg.getType_adventure() + 
					  characterAvg.getType_practice() + 
					  characterAvg.getType_rule() + 
					  characterAvg.getType_tradition() + 
					  characterAvg.getType_enjoyment() + 
					  characterAvg.getType_pleasure() + 
					  characterAvg.getType_harmony()) / 7.0;
		
		System.out.println("Character's Mean Result : " + meanResult);

		resultDeviationScores[0] = characterAvg.getType_adventure() - meanResult;
		resultDeviationScores[1] = characterAvg.getType_practice() - meanResult;
		resultDeviationScores[2] = characterAvg.getType_rule() - meanResult;
		resultDeviationScores[3] = characterAvg.getType_tradition() - meanResult;
		resultDeviationScores[4] = characterAvg.getType_enjoyment() - meanResult;
		resultDeviationScores[5] = characterAvg.getType_pleasure() - meanResult;
		resultDeviationScores[6] = characterAvg.getType_harmony() - meanResult;

		for(int i = 0; i < resultDeviationScores.length; i++) {
			sumResultDeviationSquared += Math.pow(resultDeviationScores[i], 2);
			System.out.println(sumResultDeviationSquared);
		}

		
		System.out.println("sumResultDeviationSquared :" + sumResultDeviationSquared);

		for(ProductVO product : productList) {

			double meanProduct = (product.getType_adventure() + 
								  product.getType_practice() + 
								  product.getType_rule() +
								  product.getType_tradition() + 
								  product.getType_enjoyment() +
								  product.getType_pleasure() + 
								  product.getType_harmony()) / 7.0;

			double[] productDeviationScores = new double[7];
			
			productDeviationScores[0] = product.getType_adventure() - meanProduct;
			productDeviationScores[1] = product.getType_practice() - meanProduct;
			productDeviationScores[2] = product.getType_rule() - meanProduct;
			productDeviationScores[3] = product.getType_tradition() - meanProduct;
			productDeviationScores[4] = product.getType_enjoyment() - meanProduct;
			productDeviationScores[5] = product.getType_pleasure() - meanProduct;
			productDeviationScores[6] = product.getType_harmony() - meanProduct;

			double sumProductDeviationSquared = 0;
			
			for(int i = 0; i < productDeviationScores.length; i++) {
				
				sumProductDeviationSquared += 
						Math.pow(productDeviationScores[i], 2);
			}

			double ProductOfDeviationScores = 0;
			
			for(int i = 0; i < resultDeviationScores.length; i++) {
				
				ProductOfDeviationScores += 
						resultDeviationScores[i] * productDeviationScores[i];
			}

			double pearsonCorrelation = 
					ProductOfDeviationScores / (Math.sqrt(sumProductDeviationSquared) * 
							Math.sqrt(sumResultDeviationSquared));
			
			OrderVO orderVO = new OrderVO();
			
			orderVO.setProduct_id(product.getProduct_id());
			orderVO.setValue(pearsonCorrelation);

			orderedProductList.add(orderVO);		
		}
		
		System.out.println("Pearson Before : " + orderedProductList.toString());
		
		orderedProductList = orderProducts(orderedProductList);
		
		System.out.println("Pearson After : " + orderedProductList.toString());
	
		return orderedProductList;
	}

}
