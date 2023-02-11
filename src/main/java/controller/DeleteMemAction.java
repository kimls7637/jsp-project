package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;
import model.qna.QnaDAO;
import model.qna.QnaVO;
import model.review.ReviewDAO;
import model.review.ReviewVO;
// 회원 탈퇴 
public class DeleteMemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");//수정필요.
		forward.setRedirect(false);

		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		OrderProductDAO odao = new OrderProductDAO();
		OrderProductVO ovo = new OrderProductVO();
 
		String id = (String)request.getSession().getAttribute("memberId");
		mvo.setId(id);
		mvo.setPw(request.getParameter("pw"));
		//카카오 회원일때 비밀번호 kakao세팅
		if(request.getParameter("pw")==null) {
			mvo.setPw("kakao");
		}
		//에러 잡아야함
		if(mdao.delete(mvo)==false){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('비밀번호를 확인해주세요.'); history.go(-1);");
			out.println("</script>");
			out.flush();
			return null;
		}
		
		qvo.setqId(id);
		qdao.delete(qvo);

		rvo.setrId(id);
		rdao.update(rvo);

		ovo.setoId(id);
		odao.update(ovo);
		
		request.getSession().invalidate(); // 세션 비워줌 

		return forward;
	}

}