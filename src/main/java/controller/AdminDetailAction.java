package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;
// 내 장바구니 
public class AdminDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("detail.jsp"); 
		forward.setRedirect(false);

		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();

		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		
		pvo = pdao.selectOne(pvo);
		request.setAttribute("pvo",pvo);

		return forward;
	}
}
