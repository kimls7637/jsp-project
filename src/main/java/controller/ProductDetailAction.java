package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;
import model.review.ReviewDAO;
import model.review.ReviewVO;
// 상품 상세보기 
public class ProductDetailAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("single.jsp");  // 값을 가지고 상품상세페이지로 가렴 
		forward.setRedirect(false);
		
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));  
		// 요청된 pNum 값을 ProductVO setpNum에 저장해주렴 
		// Parameter은 String이니 강제형변환 Integer.parseInt하렴 
		
		ProductVO productOne = pdao.selectOne(pvo);
		// pvo에 저장된 값을 가지고 ProductDAO.selectOne를 실행시킨 다음  
		// 그 값을 productOne에 저장하셈 ! 
		request.setAttribute("product",productOne);
		
		rvo.setrPNum(Integer.parseInt(request.getParameter("pNum")));  
		ArrayList<ReviewVO> reviewAll = rdao.selectAll(rvo);
		int reviewGrade=0;
		int count = 0;
		int sum = 0;
		if(reviewAll != null) {
			System.out.println("ㄴ이ㅏ러ㅣㄴㅇㄹ");
		for(int i=0; i<reviewAll.size(); i++) {
			reviewGrade += Integer.parseInt(reviewAll.get(i).getrGrade());
			count++;
		}
		if(count != 0) {
			sum = reviewGrade/count;
		}
		}

		request.setAttribute("Grade", sum);
		request.setAttribute("review",reviewAll);
		
		// 저장한 productOne 을 product로 저장해줘~! 
		return forward;
		
	}

}
