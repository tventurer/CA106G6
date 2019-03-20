<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.por.model.*"%>

<%  String type=request.getParameter("type");

  PurService purSvc = new PurService();
  PurVO purVO =(PurVO) purSvc.findByPrimaryKey(type);
  Integer purstock = purVO.getPurstock();
  
//   PorService porSvc = new PorService(); 
//   Integer purporsum = porSvc.getPurporsum(type);
  
//   Integer over = purstock - purporsum;
//   if(over<=0){
// 	  over=0;
// 	  out.println("purname-此商品已無存貨");
// 		out.println("purcontent-此商品已無存貨");
// 		out.println("purpricing-0");
// 		out.println("porsum-"+over);
//   }else{
// 	  if (type!=null)
// 	  {
// 		out.println("purname-"+purVO.getPurname());
// 		out.println("purcontent-"+purVO.getPurcontent());
// 		out.println("purpricing-"+purVO.getPurpricing());
// 		out.println("porsum-"+over);
// 	  }
//   }
 %>