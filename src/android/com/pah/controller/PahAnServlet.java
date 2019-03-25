package android.com.pah.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import android.com.pah.model.*;

public class PahAnServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PahAnService pahAnSvc = new PahAnService();
		List<PahAnVO> pahAnVO = pahAnSvc.getAll();
		writeText(res, new Gson().toJson(pahAnVO));
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		//取得從Android端傳來Json字串，並提取請求參數action
		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line= null;
		while((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
System.out.println("jsonIn = " + jsonIn);
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();
System.out.println("action = " + action);
		
		//用請求參數action判斷要做的事情
		if("getAllText".equals(action)) {
			PahAnService pahAnSvc = new PahAnService();
			List<PahAnVO> pahAnVO = pahAnSvc.getAllStatusOk();
			writeText(res, gson.toJson(pahAnVO));
		}
		else if("getOneImg1".equals(action)) {
			//把pah表格的pk值與想要的照片大小取出，把pk丟到service去取單張照片
			String pahno = jsonObject.get("pahno").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt(); //照片大小見android中MainActivity.java第32行
			//用service取出照片
			PahAnService pahAnSvc = new PahAnService();
			byte[] image = pahAnSvc.getImage1ByPK(pahno);
			if(image != null) { //注意這裡空值處理，servlet是用try-catch抓exception給尚無圖片，這裡沒用是因為android有另外在PahGoodsImgTask做處理。
				image = ImageUtil.shrink(image, imageSize); //用ImageUtil的static方法縮圖，把圖的byte[]跟圖想要的大小傳入，回傳就是已轉好的圖的byte[]
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
				OutputStream os = res.getOutputStream();
				os.write(image);
				os.close();
			}
		}
		else if("getOneImg2".equals(action)) {
			//把pah表格的pk值與想要的照片大小取出，把pk丟到service去取單張照片
			String pahno = jsonObject.get("pahno").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt(); //照片大小見android中MainActivity.java第32行
			//用service取出照片
			PahAnService pahAnSvc = new PahAnService();
			byte[] image = pahAnSvc.getImage2ByPK(pahno);
			if(image != null) { //注意這裡空值處理，servlet是用try-catch抓exception給尚無圖片，這裡沒用是因為android有另外在PahGoodsImgTask做處理。
				image = ImageUtil.shrink(image, imageSize); //用ImageUtil的static方法縮圖，把圖的byte[]跟圖想要的大小傳入，回傳就是已轉好的圖的byte[]
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
				OutputStream os = res.getOutputStream();
				os.write(image);
				os.close();
			}
		}
		else if("getOneImg3".equals(action)) {
			//把pah表格的pk值與想要的照片大小取出，把pk丟到service去取單張照片
			String pahno = jsonObject.get("pahno").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt(); //照片大小見android中MainActivity.java第32行
			//用service取出照片
			PahAnService pahAnSvc = new PahAnService();
			byte[] image = pahAnSvc.getImage3ByPK(pahno);
			if(image != null) { //注意這裡空值處理，servlet是用try-catch抓exception給尚無圖片，這裡沒用是因為android有另外在PahGoodsImgTask做處理。
				image = ImageUtil.shrink(image, imageSize); //用ImageUtil的static方法縮圖，把圖的byte[]跟圖想要的大小傳入，回傳就是已轉好的圖的byte[]
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
				OutputStream os = res.getOutputStream();
				os.write(image);
				os.close();
			}
		}
		else if("getOneImg4".equals(action)) {
			//把pah表格的pk值與想要的照片大小取出，把pk丟到service去取單張照片
			String pahno = jsonObject.get("pahno").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt(); //照片大小見android中MainActivity.java第32行
			//用service取出照片
			PahAnService pahAnSvc = new PahAnService();
			byte[] image = pahAnSvc.getImage4ByPK(pahno);
			if(image != null) { //注意這裡空值處理，servlet是用try-catch抓exception給尚無圖片，這裡沒用是因為android有另外在PahGoodsImgTask做處理。
				image = ImageUtil.shrink(image, imageSize); //用ImageUtil的static方法縮圖，把圖的byte[]跟圖想要的大小傳入，回傳就是已轉好的圖的byte[]
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
				OutputStream os = res.getOutputStream();
				os.write(image);
				os.close();
			}
		}
		else if("getOneImg5".equals(action)) {
			//把pah表格的pk值與想要的照片大小取出，把pk丟到service去取單張照片
			String pahno = jsonObject.get("pahno").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt(); //照片大小見android中MainActivity.java第32行
			//用service取出照片
			PahAnService pahAnSvc = new PahAnService();
			byte[] image = pahAnSvc.getImage5ByPK(pahno);
			if(image != null) { //注意這裡空值處理，servlet是用try-catch抓exception給尚無圖片，這裡沒用是因為android有另外在PahGoodsImgTask做處理。
				image = ImageUtil.shrink(image, imageSize); //用ImageUtil的static方法縮圖，把圖的byte[]跟圖想要的大小傳入，回傳就是已轉好的圖的byte[]
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
				OutputStream os = res.getOutputStream();
				os.write(image);
				os.close();
			}
		}
		else if ("compositeQuery".equals(action)) {
			//取出JsonObject內資訊
			String pahCountry = jsonObject.get("pahCountry").getAsString().toUpperCase().trim();
			String priceLowStr = jsonObject.get("priceLowStr").getAsString().trim();
			String priceHighStr = jsonObject.get("priceHighStr").getAsString().trim();
			String dateStart = jsonObject.get("dateStart").getAsString().trim();
			String dateEnd = jsonObject.get("dateEnd").getAsString().trim();
			//轉為map集合傳到DAO做動態SQL指令生成
			Map map = new HashMap<String, String[]>();
			map.put("pahcountry", new String[]{pahCountry});
			map.put("pahprice", new String[]{priceLowStr, priceHighStr});
			map.put("pahstdate", new String[]{dateStart, dateEnd});
			
			if(map != null) {
				PahAnService pahSvc = new PahAnService();
				List<PahAnVO> list = pahSvc.getAll(map);
				writeText(res, gson.toJson(list));
			}
		}
		else {
			writeText(res, "");
		}
	}
	
	private void writeText(HttpServletResponse res, String outText) throws IOException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.print(outText);
		out.close();
		System.out.println("outText = "+ outText);
	}
	

}
