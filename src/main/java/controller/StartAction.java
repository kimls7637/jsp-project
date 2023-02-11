package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 // 로그아웃 
public class StartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward  = new ActionForward();
		forward.setPath("main.do"); 
		forward.setRedirect(false);
		
		
		request.getSession().invalidate();
		
		Cookie[] cookies = request.getCookies();
		// 쿠키에 값이 있다면
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName(); // 쿠키 이름
			if(name.equals("id")){
				request.getSession().setAttribute("memberId", cookies[i].getValue());
			}
			else if(name.equals("name")) {
				request.getSession().setAttribute("memberName", cookies[i].getValue());
			}
		}
		
		
		return forward;
	}

}
