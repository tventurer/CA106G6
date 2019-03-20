package android.com.pho.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.phd.model.PhdService;
import com.phd.model.PhdVO;
import com.pho.model.PhoListVO;
import com.pho.model.PhoPahVO;
import com.pho.model.PhoService;
import com.pho.model.PhoVO;

import android.com.pah.model.PahAnService;
import android.com.pah.model.PahAnVO;

public class PhoAnServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		BufferedReader br = req.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = br.readLine()) != null ) {
			sb.append(line);
		}
		String jsonIn = sb.toString();
		
		JsonObject jsonObject = gson.fromJson(jsonIn, JsonObject.class);
		
		String action = jsonObject.get("action").getAsString();
		String memno = jsonObject.get("memno").getAsString();
System.out.println("jsonIn = " + jsonIn);
		
		if("add".equals(action) && memno != null) {
			//取出訂單
			String phoListStr = jsonObject.get("phoListStr").getAsString();
			PhoListVO phoListVO = gson.fromJson(phoListStr, PhoListVO.class);
			//取出訂單中商品list
			List<PhoPahVO> phoPahVOList = phoListVO.getPhoPahVOList();
			List<PhdVO> phdVOList = new ArrayList<>();
			//提取訂單明細所需資料
			for(PhoPahVO temp : phoPahVOList) {
				PhdVO phdVO = new PhdVO();
				phdVO.setPahno(temp.getPahno());
				phdVO.setPhdnum(temp.getPhopahquan());
				phdVOList.add(phdVO);
			}
			//新增訂單
			PhoService phoSvc = new PhoService();
         	String nextPhoNo = phoSvc.addOrder(phoListVO, phdVOList);
System.out.println("產生自增主鍵值nextPhoNo = " + nextPhoNo);
         	//訂單生成後收集資料準備傳回
			PhoListVO phoListVO_out = new PhoListVO();
         	if(nextPhoNo != null && nextPhoNo.trim().length() > 0) {
         		PhoVO phoVO = phoSvc.getOnePho(nextPhoNo);
         		phoListVO_out.setPhono(phoVO.getPhono());
         		phoListVO_out.setPhoowner(phoVO.getPhoowner());
         		phoListVO_out.setPhophone(phoVO.getPhophone());
         		phoListVO_out.setPhomail(phoVO.getPhomail());
         		phoListVO_out.setPhostdate(phoVO.getPhostdate());
         		phoListVO_out.setPhostatus(phoVO.getPhostatus());
         		phoListVO_out.setPhovisa(phoVO.getPhovisa());
         		phoListVO_out.setPhomark(phoVO.getPhomark());
         		phoListVO_out.setPhototal(phoVO.getPhototal());
         		phoListVO_out.setMemno(phoVO.getMemno());
         		phoListVO_out.setPhoPahVOList(phoPahVOList);
         	}
         	writeText(res, gson.toJson(phoListVO_out));
		}
		
		else if ("getAll".equals(action) && memno != null) {
			String start = jsonObject.get("start").getAsString();
			String end = jsonObject.get("end").getAsString();
			PhoService phoSvc = new PhoService();
			List<PhoListVO> phoList = phoSvc.getall(memno, start, end);
			if (phoList != null && !phoList.isEmpty()) {
				// JOIN Book data from PhpPahVO
				PhdService phdSvc = new PhdService();
				PahAnService pahAnSvc = new PahAnService();
				List<PhoPahVO> phoPahVOList = null;
				for (PhoListVO phoListVO : phoList) { //取出每個訂單物件
					String phono = phoListVO.getPhono();
					phoPahVOList = new ArrayList<>();
					List<PhdVO> phdVOList = phdSvc.getbyphono(phono); //從訂單明細表格取得每張訂單的商品資訊
					for (PhdVO item : phdVOList) {
						PahAnVO pahAnVO = pahAnSvc.findByPk(item.getPahno());
						PhoPahVO phoPahVO = new PhoPahVO(pahAnVO, item.getPhdnum());
						phoPahVOList.add(phoPahVO);
					}
					phoListVO.setPhoPahVOList(phoPahVOList);
				}
				writeText(res, gson.toJson(phoList));
			}
		}
		else if("changeStatus".equals(action) && memno != null){
			String phono = jsonObject.get("phono").getAsString();
			Integer phostatus = jsonObject.get("phostatus").getAsInt();
			if(phono != null && phono.trim().length() > 0 && phostatus != null) {
				PhoService phoSvc = new PhoService();
				phoSvc.changeStatus(phostatus, phono);
				JsonObject jsonObjectStatus = new JsonObject();
				jsonObjectStatus.addProperty("statusResult", "訂單審核申請中");
				writeText(res, jsonObjectStatus.toString());
			}else {
				writeText(res, "");
			}
		}
	}
	
	private void writeText(HttpServletResponse res, String output) throws IOException{
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write(output);
		out.close();
     	System.out.println("output = " + output);
	}

}
