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
public class MyCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("cart2.jsp"); 
		forward.setRedirect(false);

		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();

		String fcart = request.getParameter("cart");

		ArrayList<String> datas = new ArrayList<String>(Arrays.asList(fcart.split(",")));
		ArrayList<ProductVO> cart = new ArrayList<>();

		if(fcart!="") {
			System.out.println("if");
			for(int i = 0; i < datas.size(); i++){
				System.out.println("for");
				pvo.setpNum(Integer.parseInt(datas.get(i)));
				pvo.setCartCnt(Integer.parseInt(datas.get(i+1)));
				cart.add(pdao.selectOne(pvo));
				i++;
			}
		}
		request.setAttribute("cart",cart);


		return forward;
	}
}
