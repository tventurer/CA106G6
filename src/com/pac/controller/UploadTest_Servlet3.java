package com.pac.controller;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet3.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class UploadTest_Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded"; 
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("Big5"); 
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();
		System.out.println("ContentType="+req.getContentType());

		String realPath = getServletContext().getRealPath(saveDirectory);
		System.out.println("realPath="+realPath); 
		File fsaveDirectory = new File(realPath);
		if (!fsaveDirectory.exists())
			 fsaveDirectory.mkdirs(); 

		Collection<Part> parts = req.getParts(); 
		out.write("<h2> Total parts : " + parts.size() + "</h2>");

		for (Part part : parts) {
			if (getFileNameFromPart(part) != null && part.getContentType()!=null) {
				out.println("<PRE>");
				String name = part.getName();
				String filename = getFileNameFromPart(part);
				String ContentType = part.getContentType();
				long size = part.getSize();
				File f = new File(fsaveDirectory, filename);

				out.println("name: " + name);
				out.println("filename: " + filename);
				out.println("ContentType: " + ContentType);
				out.println("size: " + size);
				out.println("File: " + f);

				
				part.write(f.toString());

				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);
				in.close();
				out.println("buffer length: " + buf.length);
				
				
				out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");

				out.println();
				out.println("</PRE>");
			}
		}
	}

	
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // ���ե�
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // ���ե�
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}