package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;
// 상품목록 
public class AdminProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("product.jsp"); 
		forward.setRedirect(false);

		ProductDAO pdao = new ProductDAO();

		ArrayList<String> cate = new ArrayList<>(Arrays.asList("텐트", "테이블", "체어", "백팩"));


		for(int i = 0; i < 4; i++) {
			ProductVO pvo = new ProductVO();
			pvo.setpCate(cate.get(i));	
			ArrayList<ProductVO> productAll = pdao.selectAll(pvo);
			System.out.println(i+"번쨰");
			System.out.println(productAll);
			request.setAttribute("cate"+i, productAll);
		}

		return forward;
	}

}
