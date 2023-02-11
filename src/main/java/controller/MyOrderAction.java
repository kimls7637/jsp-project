package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;
import model.qna.QnaDAO;
import model.qna.QnaVO;
import model.review.ReviewDAO;
import model.review.ReviewVO;

public class MyOrderAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp"); //수정 필요.
		forward.setRedirect(false);

		OrderProductDAO odao = new OrderProductDAO();
		OrderProductVO ovo = new OrderProductVO();
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();


		String id = (String)request.getSession().getAttribute("memberId");

		rvo.setrId(id);

		ArrayList<ReviewVO> rrist = rdao.selectAllMy(rvo);
		request.setAttribute("review", rrist);


		ovo.setoId(id);

		ArrayList<OrderProductVO> orist = odao.selectAll(ovo);
		qvo.setqId(id);
		ArrayList<QnaVO> qList = qdao.selectAll(qvo);
		request.setAttribute("myOrder", orist);
		request.setAttribute("qnaList",qList);
		return forward;
	}

}