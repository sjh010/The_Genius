package org.sos.util;

import java.util.ArrayList;
import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;


public class Magi {

	private MultiScoreSmilarity multi;
	private PearsonCorrelationCoefficient pearson;
	private CosineSimilarity cosine;
	private List<Integer> competitionResult;
	
	public Magi(){
		
		this.multi = new MultiScoreSmilarity();
		this.pearson = new PearsonCorrelationCoefficient();
		this.cosine = new CosineSimilarity();
		this.competitionResult = new ArrayList<Integer>();
	}
	
	public List<Integer> getCompetitionResult(List<ResultVO> characterList, 
											  List<ProductVO> productList){
		
		List<OrderVO> multiResult = multi.calculateOrder(characterList, productList);
		List<OrderVO> pearsonResult = pearson.calculateOrder(characterList, productList);
		List<OrderVO> cosineResult = cosine.calculateOrder(characterList, productList);
		
		
		
		return this.competitionResult;
	}
}
