package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
// 회원가입
public class JoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("main.do"); // 값가지고 메인으로 ㄱ 
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();

		boolean longinChk = false;

		// 일반 회원가입 요청한 id를 MemberVO id에 저장해주렴 
		if(request.getParameter("phone")!=null) {
			mvo.setId(request.getParameter("id"));
			mvo.setPw(request.getParameter("pw"));
			mvo.setName(request.getParameter("name"));
			mvo.setPhone(request.getParameter("phone"));
			longinChk=true;
		}
		else {// 카카오 회원가입
			mvo.setId(request.getParameter("id")+"@k");
			mvo.setPw("kakao");
			mvo.setName(request.getParameter("name"));
		}

		//일반회원가입
		if(longinChk) {
			mdao.insert(mvo);
		}else {//카카오회원가입
			if(mdao.selectOne(mvo)==null) {
				mdao.insert(mvo);
			}
			forward.setPath("login.do");
		}

		// 그저장한 값을 memberDAO insert에 보냄 
		return forward;
	}
}


