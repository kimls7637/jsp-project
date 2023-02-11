package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review.ReviewDAO;
import model.review.ReviewVO;
// 내가 쓴 리;뷰..ㅇ..ㅅ;..ㄴ
public class MyReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath(null); //수정필요.
		forward.setRedirect(false);
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		rvo.setrId(request.getParameter("id"));
		
		ArrayList<ReviewVO> rrist = rdao.selectAll(rvo);
		
		request.setAttribute("rrist", rrist);
		
		return forward;
	}

}
