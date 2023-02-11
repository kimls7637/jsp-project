package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePopupAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		forward.setPath("adminMain.do");//수정필오ㅛ.
		forward.setRedirect(false);
		
		
		System.out.println("팝업삭제");
		ServletContext application = request.getSession().getServletContext();
		
		
		application.setAttribute("popLink",null);
		application.setAttribute("popImg", null);
		
		return forward;
	}


}
