package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;

public class UpdateMemAction implements Action{
	// 회원정보 수정 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("myOrder.do"); 
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		String name=request.getParameter("name");
				mvo.setId((String)request.getSession().getAttribute("memberId"));
		if(name!=null) {
			mvo.setPw(request.getParameter("pw"));
			mvo.setName(request.getParameter("name"));
			mvo.setPhone(request.getParameter("phone"));
			mdao.update(mvo);
			request.getSession().setAttribute("memberName", request.getParameter("name"));
			// userLoginInfo에 저장된 getName값을 memberName로 저장해서 Session에저장부탁
			request.getSession().setAttribute("memberPhone", request.getParameter("phone")); 
			return forward;
		}else {
			mvo.setId(request.getParameter("id"));
			mvo.setPw(request.getParameter("pw"));
			mdao.update(mvo);
			forward.setPath("main.do"); 
			return forward;
		}
	}

}