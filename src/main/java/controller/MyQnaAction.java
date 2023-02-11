package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.qna.QnaDAO;
import model.qna.QnaVO;

public class MyQnaAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("myPost.jsp"); 
		forward.setRedirect(false);
		
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		qvo.setqId(request.getParameter("qId")); 
		
		ArrayList<QnaVO> myQnaList = qdao.selectAll(qvo);
		
		request.setAttribute("myQnaList", myQnaList);
		
		return forward;
	}

}
