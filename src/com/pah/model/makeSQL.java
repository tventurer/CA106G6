package com.pah.model;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;


public class makeSQL {

	public static String get_aCondition_For_Oracle(String columnName, String value[]) {
		
		
		String aCondition = null;

		if ("pahcountry".equals(columnName))
			aCondition = columnName + "='" + value[0] + "'";
		else if ("pahprice".equals(columnName)) 
			aCondition = columnName + " BETWEEN " + value[0] + " AND " + value[1];
		else if ("pahstdate".equals(columnName))                        
			aCondition = columnName + " BETWEEN to_date('" +value[0]+ "','yyyy-mm-dd') AND to_date('" +value[1]+ "','yyyy-mm-dd')";

		return aCondition;
	
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value[] = map.get(key);
			if(key.equals("pahcountry") && value[0]!=""){
					count++;
					String aCondition = get_aCondition_For_Oracle(key, value);
						whereCondition.append(" and " + aCondition);
			}else if(key.equals("pahprice") || key.equals("pahstdate")){
				if(value[0].length()!=0 && value[1].length()!=0) {
					count++;
					String aCondition = get_aCondition_For_Oracle(key, value);
						whereCondition.append(" and " + aCondition);
				}
			}
			
			
			
			
			
		}
		
		return whereCondition.toString();
	}

}

