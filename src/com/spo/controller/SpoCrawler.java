package com.spo.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.spo.model.SpoJDBCDAO;
import com.spo.model.SpoVO;

public class SpoCrawler {

	public static void main(String[] args) {

		StringBuffer googleUrl = null;
		String picUrl = null;
		String[] spoclass = { "景點", "food", "museum", "night_club", "飯店" };
		String[] classForDB = { "景點", "美食", "博物館", "夜生活", "飯店" };
		StringBuffer next_page_token = null;
		SpoJDBCDAO dao = new SpoJDBCDAO();
		int num = 0;
		int count = 0;

		List<String> citys = new SpoCrawler().getTaiwanCitys();

		// 第一層迴圈鄉鎮市區名稱
		for (String city : citys) {

			try {
				double[] latlng = AddrToLatLong.getLatLong(city);

				System.out.println("=====" + city + "=====");

				// 第二層迴圈景點種類
				for (int i = 0; i < spoclass.length; i++) {

					count = 0;
					next_page_token = new StringBuffer();
					String urlName = URLEncoder.encode(spoclass[i], "UTF-8");

					System.out.println("urlName:" + urlName);

					while (count != 3) {

						googleUrl = new StringBuffer();

						if (i == 0 || i == 4) {
							googleUrl.append("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=")
									.append(latlng[0]).append(",").append(latlng[1]).append("&radius=6000&name=")
									.append(urlName)
									.append("&language=zh-TW&key=AIzaSyABawQwdYJlRvccVhRttjo_3319LoFCUEo")
									.append(next_page_token.toString());
						} else {
							googleUrl.append("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=")
									.append(latlng[0]).append(",").append(latlng[1]).append("&radius=6000&types=")
									.append(urlName)
									.append("&language=zh-TW&key=AIzaSyABawQwdYJlRvccVhRttjo_3319LoFCUEo")
									.append(next_page_token.toString());
						}

						next_page_token = new StringBuffer();
						System.out.println("gooleUrl:" + googleUrl);

						URL myUrl = new URL(googleUrl.toString());
						HttpURLConnection con = (HttpURLConnection) myUrl.openConnection();
						InputStream is = con.getInputStream();
						BufferedReader br = new BufferedReader(new InputStreamReader(is));
						StringBuilder jsonstr = new StringBuilder();
						;
						String str;
						while ((str = br.readLine()) != null) {
							jsonstr.append(str);
						}
						
						//next_page_token 處理分頁
						JSONObject jobj = new JSONObject(jsonstr.toString());
						if (jobj.has("next_page_token")) {
							String tk = jobj.getString("next_page_token");
							System.out.println("next_page_token:" + tk);
							next_page_token.append("&pagetoken=" + tk);
						}

						JSONArray jarr = jobj.getJSONArray("results");
						for (int j = 0; j < jarr.length(); j++) {
							JSONObject obj = jarr.getJSONObject(j);
							double lat = obj.getJSONObject("geometry").getJSONObject("location").getDouble("lat");
							double lng = obj.getJSONObject("geometry").getJSONObject("location").getDouble("lng");
							String name = obj.getString("name");
							Double rating = null;
							if (obj.has("rating")) {
								rating = obj.getDouble("rating");

								if (rating < 4.3) {
									System.out.println("評分太低不予採納!!");
								} else {

									// 圖片API處理
									byte[] b = null;
									if (obj.has("photos")) {
										String picRf = obj.getJSONArray("photos").getJSONObject(0)
												.getString("photo_reference");
										picUrl = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="
												+ picRf + "&key=AIzaSyABawQwdYJlRvccVhRttjo_3319LoFCUEo";
										
										b = new SpoCrawler().getPicBytes(picUrl);
									}

									String addr = new SpoCrawler().getAddr(name);
									String content = new SpoCrawler().getSpoContent(name);
									
									content = rating + content;
									
									System.out.println("lat:" + lat);
									System.out.println("lng:" + lng);
									System.out.println("name:" + name);
									System.out.println("addr:" + addr);
									
									if (b != null) {
										System.out.println("pic:" + b.length);
									}
									
									//美食 夜店 飯店 不查維基只存評價
									if(i == 1 || i == 3 || i == 4) {
										System.out.println("content:" + rating);
										content = String.valueOf(rating);
									} else if(content.length() < 10) {
										content = String.valueOf(rating);
									} else {
										if(content.equals("查無資料")) {
											System.out.println("content:" + rating);
											content = String.valueOf(rating);
										} else {
											System.out.println("content:" + content);
										}
									}
									
									
									SpoVO spoVO = new SpoVO();
									spoVO.setSponame(name);
									spoVO.setSpoclass(classForDB[i]);
									spoVO.setSpocon("台灣");
									spoVO.setSpocity(city.substring(0, 3));
									spoVO.setSpolat(lat);
									spoVO.setSpolong(lng);
									spoVO.setSpoaddr(addr);
									spoVO.setSpocontent(content);
									spoVO.setSpopic(b);
									spoVO.setSpoattribute(0);
									
//									避免新增重複資料
									if(dao.findByName(name).getSponame() == null) {
										if(spoVO.getSpoaddr() != null) {
											dao.add(spoVO);
											System.out.println("============已新增" + (++num) + "筆==================");
										}
									}

								}
							}
						}
						br.close();
						is.close();
						con.disconnect();
						Thread.sleep(1500);
						count++;
						System.out.println("count:" + count);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("==============end==============");

		}

	}

	public String getSpoContent(String name) {

		StringBuffer content = new StringBuffer();

		try {
			String name_clean = URLEncoder.encode(name, "UTF-8");
			String url = "https://zh.wikipedia.org/wiki/" + name_clean;
			Document spot = Jsoup.connect(url).get();
			Elements elements = spot.select(".mw-parser-output>p");
			elements.select("sup").remove();
			for (Element element : elements) {
				if (element.getElementById("coordinates") != null) {
					continue;
				}
				if (!element.nextElementSibling().tagName().equals("div")) {
					content.append(element.text());
				} else {
					content.append(element.text());
					break;
				}

			}

		} catch (Exception e) {
			return "查無資料";
		}

		return content.toString();
	}
	
	public byte[] getPicBytes(String picUrl) {

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		
		try {
			
			URL myUrl = new URL(picUrl);
			HttpURLConnection con = (HttpURLConnection) myUrl.openConnection();
			BufferedInputStream br = new BufferedInputStream(con.getInputStream());

			byte[] b = new byte[8192];
			int i;
			while ((i = br.read(b)) != -1) {
				bos.write(b, 0, i);
			}
			
			br.close();
		} catch (IOException ie) {
			ie.printStackTrace();
		}

		return bos.toByteArray();
	}

	public String getAddr(String addrName) {

		String addr = null;

		try {
			String name_clean = URLEncoder.encode(addrName, "UTF-8");
			String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + name_clean
					+ "&language=zh-TW&key=AIzaSyAYmC8oUYc9DGAZn8hqZKakFeclhAbTRSI";

			URL myUrl = new URL(url);
			HttpURLConnection con = (HttpURLConnection) myUrl.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

			StringBuffer jsonStr = new StringBuffer();
			String j;
			while ((j = br.readLine()) != null) {
				jsonStr.append(j);
			}

			JSONObject jobj = new JSONObject(jsonStr.toString());
			JSONArray jarr = jobj.getJSONArray("results");
			for (int i = 0; i < jarr.length(); i++) {
				JSONObject obj = jarr.getJSONObject(i);
				addr = obj.getString("formatted_address");
			}

		} catch (IOException ie) {
			ie.printStackTrace();
		}

		return addr;
	}

	public List<String> getTaiwanCitys() {

		List<String> content = new ArrayList<String>();
		try {
			String url = "https://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E6%B0%91%E5%9C%8B%E8%87%BA%E7%81%A3%E5%9C%B0%E5%8D%80%E9%84%89%E9%8E%AE%E5%B8%82%E5%8D%80%E5%88%97%E8%A1%A8";
			Document doc = Jsoup.connect(url).get();
			Elements elements = doc.select(".sortable td:eq(0)");

			for (Element element : elements) {

				content.add(element.text());

			}
			System.out.println(content.size());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return content;
	}

}
