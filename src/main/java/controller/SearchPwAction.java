package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;


public class SearchPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("forgot3.jsp"); 
		forward.setRedirect(false);
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setId(request.getParameter("id"));
		mvo.setPhone(request.getParameter("phone"));
		MemberVO seachPwId = mdao.selectOnePw(mvo);
		request.setAttribute("searchId", seachPwId.getId());
		request.setAttribute("searchPw", seachPwId.getPw());
		return forward;
		
		
	}

}
