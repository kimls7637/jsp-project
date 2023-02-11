package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 로그아웃 
public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward  = new ActionForward();
		forward.setPath("main.do");  // 로그아웃되면 main으로 가렴 
		forward.setRedirect(true); // Redirect임 

		Cookie[] cookies = request.getCookies();

		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName();
			if(name.equals("id") || name.equals("name")){
				// 유효시간을 0초 설정 삭제하는 효과
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}

		request.getSession().invalidate(); // 세션 비워줌 
		
		return forward;
	}

}
