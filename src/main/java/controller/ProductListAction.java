package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;
 // 상품목록 
public class ProductListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("first.jsp"); 
		forward.setRedirect(false);
		
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();
		
		pvo.setpCate(request.getParameter("pCate"));
		
		ArrayList<ProductVO> productAll = pdao.selectAll(pvo);
		
		request.setAttribute("productAll", productAll);
		return forward;
	}

}
