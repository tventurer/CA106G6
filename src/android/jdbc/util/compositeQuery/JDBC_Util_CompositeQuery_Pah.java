
package android.jdbc.util.compositeQuery;

import java.util.*;

public class JDBC_Util_CompositeQuery_Pah {
	
	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;

		if ("pahcountry".equals(columnName))
			aCondition = columnName + "=" + "'" + value.toUpperCase() + "'";
		
		return aCondition + " ";
	}
	//這裡設計是只有有價格或日期有一個為空白欄位就是不做價格或日期的篩選，即aCondition是空白
	public static String get_aCondition_For_Oracle(String columnName, String value1, String value2) { //把map取出的資料動態生成SQL指令!

		String aCondition = null;

		if ("pahprice".equals(columnName))
			aCondition = "(" + columnName + " between " + Double.parseDouble(value1) + " and " + Double.parseDouble(value2) + ") ";
		else if ("pahstdate".equals(columnName))
			aCondition = "(" + columnName + " between to_date('" + value1 + "', 'yyyy-mm-dd') and to_date('" + value2 + "', 'yyyy-mm-dd'))";
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			if(map.get(key).length == 1) {
				String value = map.get(key)[0];
				if(value != null && value.trim().length() != 0 && !"action".equals(key)) {
					count++;
					String aCondition = get_aCondition_For_Oracle(key, value);
					if (count == 1)
						whereCondition.append(" where " + aCondition);
					else
						whereCondition.append(" and " + aCondition);
					System.out.println("有送出查詢資料的欄位數count = " + count);
				}
			}else if(map.get(key).length>1){
				String value1 = map.get(key)[0];
				String value2 = map.get(key)[1];
				if(value1 != null && value1.trim().length() != 0 && value2 != null && value2.trim().length() != 0 && !"action".equals(key)) {
					count++;
					String aCondition = get_aCondition_For_Oracle(key, value1, value2);
					if(count == 1)
						whereCondition.append(" where " + aCondition);
					else
						whereCondition.append(" and " + aCondition);
					System.out.println("有送出查詢資料的欄位數count = " + count);
				}
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) { //這是測試

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();

		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		map.put("pahcountry", new String[]{"Japan"});
		map.put("pahprice", new String[]{"0.0", "10000"});
		map.put("pahstdate", new String[]{"2018-01-01", "2019-05-01"});
		
		String finalSQL = "select * from planehotel "
				          + JDBC_Util_CompositeQuery_Pah.get_WhereCondition(map)
				          + "order by pahno";
		System.out.println("FinalSQL = " + finalSQL);

	}
}

