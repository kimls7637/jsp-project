package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;


public class DayPriceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("adminMain.jsp"); // 값 가지고 관리자메인페이지로 가렴 
		forward.setRedirect(false);

		OrderProductDAO odao = new OrderProductDAO();
		OrderProductVO ovo = new OrderProductVO();
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();

		MemberVO adminAllMember = mdao.selectOneAll(mvo);
		// MemberVO에 저장된 값을 가지고 MemberDAOselectAll을 실행시킨다음
		// 그 값을 ArrayList adminAllMember에 저장해줘
		request.setAttribute("allMember", adminAllMember); //총회원.
		// 저장한 adminAllMember 값을 adminAllMember로 저장해줘


		OrderProductVO orist = odao.selectOneAll(ovo);
		// OrderVO에 저장된 값을 가지고 OrderDAO.selectAllDay를 실행시킨다음
		// 실행시킨 값을 ArrayList orist에 저장해주셈
		request.setAttribute("allPrice", orist); //총매출.
		// 저장한 orist 값을 orist으로 저장해줘
		
		ovo.setoId("admin");
		ArrayList<OrderProductVO> orist2 = odao.selectAllBest(ovo); //탑5상품.
		
		//베스트상품.
		request.setAttribute("topProduct", orist2); 

		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<String> days = new ArrayList<String>();
		Calendar c1 = Calendar.getInstance(); 

		ArrayList<Integer> totalDay = new ArrayList<Integer>();
		ArrayList<String> oDate = new ArrayList<String>();
		c1.add(Calendar.DATE,0); // 오늘날짜로부터 -1 
		String yesterday2= sDate.format(c1.getTime()); // String으로 저장
		days.add(yesterday2);

		while(true) {
			c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1 
			String yesterday = sDate.format(c1.getTime()); // String으로 저장
			days.add(yesterday);
			if(days.size()>=7) {
				break;
			}
		}
		for(int i=0; i<days.size(); i++) {
			OrderProductVO ovo2 = new OrderProductVO();
			Collections.sort(days);
			ovo2.setoDate(days.get(i));
			OrderProductVO orist3=odao.selectOneDay(ovo2); //일별매출.
			System.out.println(orist3);
			orist3.getoDate();
			oDate.add(orist3.getoDate().substring(2));
			totalDay.add(orist3.getTotalDay());
		}
		
		request.setAttribute("day", oDate);
		request.setAttribute("dayPrice", totalDay);

		ArrayList<String> cate = new ArrayList<>(Arrays.asList("테이블", "체어", "백팩", "텐트"));
		ArrayList<Integer> totalCate=new ArrayList<Integer>();  // 각 카테고리 총개수


		for(int i = 0; i < 4; i++) {
			OrderProductVO ovo5 = new OrderProductVO();
			ovo5.setoCate(cate.get(i));
			OrderProductVO nvo=odao.selectOneCategory(ovo5);
			if(nvo != null) {
				totalCate.add(nvo.getoCnt());
			}
			else {
				totalCate.add(0);
			}
		}

		request.setAttribute("cate", cate); //카테고리배열
		request.setAttribute("totalCate",totalCate); //카테고리별매출

		ArrayList<OrderProductVO> orist5=odao.selectAllTop5(ovo); //탑5유저 
		request.setAttribute("topMember",orist5);

		ArrayList<OrderProductVO> orist6 = odao.selectAllBest(ovo); // 탑5상품 
		ArrayList<OrderProductVO> noList6 = new ArrayList<>();
		
		for(int i=0; i<orist6.size()-1; i++) {
			noList6.add(orist6.get(i));
		}
		request.setAttribute("topProduct", noList6);  






		return forward;
	}

}