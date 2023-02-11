package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.qna.QnaDAO;
import model.qna.QnaVO;
// QnA 작성 
public class InsertQnAAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("qnaList.do"); 
		forward.setRedirect(false); 
		
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		
		qvo.setqId((String)request.getSession().getAttribute("memberId"));
		// 저장된 memberId
		qvo.setqTitle(request.getParameter("qTitle"));
		qvo.setqContent(request.getParameter("qContent"));
		
		qdao.insert(qvo);
		
		return forward;
	}

}
