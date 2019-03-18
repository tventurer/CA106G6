package com.pah.controller;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import com.pah.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		PahService phs = new PahService();
		List<PahVO> buyList = (Vector<PahVO>)session.getAttribute("shoppingcart");
		String action = req.getParameter("action");
		
		if(!"checkOut".equals(action)) {//如果是非結帳動作
			
			if("delete".equals(action)){//刪除商品
				
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				buyList.remove(d);
				if(buyList==null || buyList.isEmpty()) {
					String shoppingMsgs = "還在等什麼，快快繼續選購哦";
					req.setAttribute("shoppingMsgs", shoppingMsgs);
				}
				//算出購物車總金額
				int totalbuy=0;
				for(PahVO buy:buyList){
					totalbuy += buy.getPahprice();
				}
				req.setAttribute("totalbuy", totalbuy);
				//顯示購物車
				boolean openModal=true;
				req.setAttribute("openModal",openModal);
				//導回來源網頁
				String pahno = req.getParameter("pahno");
				PahVO pahvo = phs.findByPk(pahno);
				req.setAttribute("pahvo", pahvo);
				String url = req.getParameter("url");
				RequestDispatcher rd = req.getRequestDispatcher(url);
				rd.forward(req, res);
				return;
				
			}else if("add".equals(action)) {//增加商品數量
				
				String pahno = req.getParameter("pahno");
				Integer quantity = Integer.parseInt(req.getParameter("quantity"));
				Integer price = Integer.parseInt(req.getParameter("price"));
				//包裝購買物件編號、要購買的數量、總金額
				PahVO buyItem = new PahVO();
				buyItem.setPahno(pahno);
				buyItem.setPahnum(quantity);
				buyItem.setPahprice(quantity * price);
				//傳送物件回原頁面顯示
				PahVO listOne = phs.findByPk(pahno);
				if(buyList == null) {
					buyList = new Vector<PahVO>();
					buyList.add(buyItem);
				}else {
					if(buyList.contains(buyItem)) {
						
						//找出相同品項位置
						int same = buyList.indexOf(buyItem);
						//拿出來修改數量及金額
						PahVO alrbuy = buyList.get(same);
						Integer qui = alrbuy.getPahnum() + buyItem.getPahnum();
						Integer pri = alrbuy.getPahprice() + buyItem.getPahprice();
						alrbuy.setPahnum(qui);
						alrbuy.setPahprice(pri);
						//修改完成放回購物車
						buyList.set(same, alrbuy);
						
					}else {
						buyList.add(buyItem);
					}
				}
				//sweetalert
				req.setAttribute("sweetalert6", "sweetalert6");
				//將原顯示物件及購物車放入，回傳
				session.setAttribute("shoppingcart", buyList);
				req.setAttribute("pahvo", listOne);
				RequestDispatcher rd = req.getRequestDispatcher("/frontend/pah/listonepah.jsp");
				rd.forward(req, res);
				return;
			}
			
		}else if("checkOut".equals(action)) {//結帳	
			//顯示購物車
			boolean openModal=true;
			req.setAttribute("openModal",openModal);
			//購物車是空的
			if(buyList==null || buyList.isEmpty()) {
				String shoppingMsgs = "還在等什麼，快快繼續選購哦";
				req.setAttribute("shoppingMsgs", shoppingMsgs);
			}else {
				//算出購物車總金額
				int totalbuy=0;
				for(PahVO buy:buyList){
					totalbuy += buy.getPahprice();
				}
				req.setAttribute("totalbuy", totalbuy);
			}
			//導回來源網頁
			String pahno = req.getParameter("pahno");
			PahVO pahvo = phs.findByPk(pahno);
			req.setAttribute("pahvo", pahvo);
			String url = req.getParameter("url");
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
			return;
		}
	}

}
