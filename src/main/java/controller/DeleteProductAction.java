package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;
 // 상품 삭제 
public class DeleteProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("adminProduct.do");
		forward.setRedirect(false);
		
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();
		
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		
		pdao.delete(pvo);
		
		return forward;
	}

}
