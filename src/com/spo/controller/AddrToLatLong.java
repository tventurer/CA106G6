package com.spo.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

public class AddrToLatLong {

	public static double[] getLatLong(String addr) throws Exception {
		
		String encodeAddr = URLEncoder.encode(addr, "UTF-8");//AIzaSyCJDWHf2nJvG1HGWjhDSz95Gv8E0h_ZFp0
		String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + encodeAddr + "&key=AIzaSyAis10MVvjqPN4k00QTn4y_eScYdWxGF1k";//key
		URL myURL = new URL(url);
		HttpURLConnection conn = (HttpURLConnection)myURL.openConnection();
		InputStream is = conn.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		StringBuilder jsonstr = new StringBuilder();;
		String i;
		while((i = br.readLine()) != null) {
			jsonstr.append(i);
		}
		
		double[] latlong = new double[2];
		JSONObject jobj = new JSONObject(jsonstr.toString());
		JSONArray jarr = jobj.getJSONArray("results");
		for(int j = 0; j < jarr.length(); j++) {
			JSONObject obj = jarr.getJSONObject(j);
			double lat = obj.getJSONObject("geometry").getJSONObject("location").getDouble("lat");
			double lng = obj.getJSONObject("geometry").getJSONObject("location").getDouble("lng");
			latlong[0] = lat;
			latlong[1] = lng;
		}
		
		return latlong;
	}

}
