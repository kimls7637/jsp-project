package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.qna.QnaDAO;
import model.qna.QnaVO;

public class UpdateReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("qnaList.do");	//수정필요.
		forward.setRedirect(false);
		
		 
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		qvo.setqNum(Integer.parseInt(request.getParameter("qNum")));
		qvo.setqReply(request.getParameter("qReply"));
		System.out.println(qvo);
		
		qdao.update(qvo);
			
		return forward;
	}

}
