package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import vo.areaVo;

public class test {

	public static void main(String[] args) {
		areaDao aDao = new areaDao();
		
		List<areaVo> areaList = aDao.getAreaList();
		
		List<areaVo> sigunguList = aDao.getSigunguList();
		
		HashMap<Integer, ArrayList<areaVo>> map = new HashMap<>();
		ArrayList<areaVo> lists = new ArrayList<>();
		int index = 0;
		int aCode = 0;
		for(int i=0; i<sigunguList.size(); i++){
			aCode = areaList.get(index).getAreaCode();
			
			if(aCode != sigunguList.get(i).getAreaCode() || i==sigunguList.size()-1){
				map.put(aCode, lists);
				index++;
				lists.clear();
			}
			lists.add(sigunguList.get(i));
			
		}
		
	}

}
