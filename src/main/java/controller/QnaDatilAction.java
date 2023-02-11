package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.qna.QnaDAO;
import model.qna.QnaVO;

public class QnaDatilAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("qnaDetail.jsp"); 
		forward.setRedirect(false);
		
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		qvo.setqNum(Integer.parseInt(request.getParameter("qNum"))); 
		
		QnaVO detailQnA = qdao.selectOne(qvo);
		request.setAttribute("QnA", detailQnA);
		
		return forward;
		
	}

}
