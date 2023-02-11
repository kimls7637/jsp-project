package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

public class SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("result.jsp"); 
		forward.setRedirect(false);
		
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();
		
		
		pvo.setpName(request.getParameter("pName"));
		
	ArrayList<ProductVO>searchProduct = pdao.selectAll(pvo);
		request.setAttribute("datas", searchProduct);
		
		return forward;
		
	}

}
