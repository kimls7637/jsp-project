package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.qna.QnaDAO;
import model.qna.QnaVO;


public class DeleteQnAAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("qnaList.do"); 
		forward.setRedirect(false);
		
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		
		qvo.setqNum(Integer.parseInt(request.getParameter("qNum")));
		qdao.delete(qvo);
		
		return forward;
	}
}
