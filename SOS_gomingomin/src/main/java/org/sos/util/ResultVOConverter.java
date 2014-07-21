package org.sos.util;

import java.util.ArrayList;
import java.util.List;

import org.sos.vo.CharacterVO;
import org.sos.vo.ResultVO;

public class ResultVOConverter {
   
   public List<ResultVO> convert(List<CharacterVO> cvoList){
      
      List<ResultVO> rvoList = new ArrayList<ResultVO>();
      
      ResultVO rvo;
      
      for(int i=0; i<3; i++){
         rvo = new ResultVO();
         rvo.setType_adventure(cvoList.get(i).getType_adventure());
         rvo.setType_enjoyment(cvoList.get(i).getType_enjoyment());
         rvo.setType_harmony(cvoList.get(i).getType_harmony());
         rvo.setType_pleasure(cvoList.get(i).getType_pleasure());
         rvo.setType_practice(cvoList.get(i).getType_practice());
         rvo.setType_rule(cvoList.get(i).getType_rule());
         rvo.setType_tradition(cvoList.get(i).getType_tradition());
         rvoList.add(rvo);
      }
      
      return rvoList;
   }
}