package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
// 로그인 
public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("main.do"); // 요청값 가지고 main으로 가렴 
		forward.setRedirect(false);  // forward니까 false임 

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		System.out.println(request.getParameter("id2"));
		System.out.println(request.getParameter("teacher"));
		System.out.println("비밀번호는"+request.getParameter("pw")+"아이디는"+request.getParameter("id"));
		if(request.getParameter("pw")!=null) {
			mvo.setId(request.getParameter("id")); // 받은값을 MemberVO id에 저장해줘 
			mvo.setPw(request.getParameter("pw"));// 받은값을 MemberVO pw에 저장해줘	
		}else {
			mvo.setId(request.getParameter("id")+"@k"); // 받은값을 MemberVO id에 저장해줘 
			mvo.setPw("kakao");// 받은값을 MemberVO pw에 저장해줘	
		}

		MemberVO userLoginInfo = mdao.selectOne(mvo); 
		// MemberVO의 값을 가지고 MemberDAO의 selectAllOne메서드를
		// 실행시킨 다음 그 값을 userLoginInfo에 저장해 

		String[] chk = request.getParameterValues("remeber");

		
		
		if(userLoginInfo != null) { // 저장된 id,pw가 있으면 
			request.getSession().setAttribute("cnt", 0);
			request.getSession().setAttribute("memberId", userLoginInfo.getId()); 
			// userLoginInfo에 저장된 getId값을 memberId로 저장해서 Session에저장부탁 
			request.getSession().setAttribute("memberName", userLoginInfo.getName());
			// userLoginInfo에 저장된 getName값을 memberName로 저장해서 Session에저장부탁
			request.getSession().setAttribute("memberPhone", userLoginInfo.getPhone()); 
			if(chk != null) {
				request.setCharacterEncoding("utf-8");
				// 쿠키 지정 name, value
				Cookie cookie = new Cookie("id", userLoginInfo.getId());
				Cookie cookie2 = new Cookie("name", userLoginInfo.getName());
				// 쿠키의 유효시간 설정
				cookie.setMaxAge(60*60*24*30);
				cookie2.setMaxAge(60*60*24*30);
				// 쿠키 추가
				response.addCookie(cookie);
				response.addCookie(cookie2);
			}
			if(userLoginInfo.getId().equals("admin") ) { // 만약로그인 아이디가 어드민으로 들어오면 
				forward.setPath("adminMain.do");// 관리자.do로 이동함 
			}
		}else  {
			request.setAttribute("userId", request.getParameter("id"));
			int cnt;
			if(request.getSession().getAttribute("cnt")==null) {
				cnt =1;
			}else {
				System.out.println(request.getSession().getAttribute("cnt"));
				cnt = (Integer)request.getSession().getAttribute("cnt");
				cnt++;
			}
			request.getSession().setAttribute("cnt", cnt);
			forward.setPath("login.jsp");			
		}

		return forward;

	}

}
