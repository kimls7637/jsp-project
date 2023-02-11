package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;

@WebServlet("/untree.co-medio/phonecheck")
public class PhoneCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public PhoneCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		MemberVO result;
		mvo.setPhone(request.getParameter("ph"));
		
		if(request.getParameter("id")!=null) {
			mvo.setId(request.getParameter("id"));
			result = mdao.selectOnePw(mvo);
		}
		else {
			result = mdao.selectOnePhoneChk(mvo);
		}
		//받아온 randNum값을 다시 ajax으로 보낸다 ->  success: function(randNum)  
		response.setContentType("application/x-json; charset=UTF-8");  
		if(result!=null) {
			response.getWriter().write("1");
		}
		else {
			response.getWriter().write("-1");
		}
	}

}
