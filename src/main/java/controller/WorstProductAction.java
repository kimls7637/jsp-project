package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;

public class WorstProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("main.jsp"); // 값을 가지고 main.jsp로 감 
		forward.setRedirect(false); // false여서 forward 
		
		OrderProductDAO odao = new OrderProductDAO();
		OrderProductVO ovo = new OrderProductVO();
		
		
		ArrayList<OrderProductVO> orist= odao.selectAllWorst(ovo); 
		// OrderProductVO의 값을 가지고 OrderProductDAO의 selectAllWorst메서드를 실행시킨 값을 ArrayList에 저장한다.
		ArrayList<OrderProductVO> orist1 = odao.selectAllBest(ovo);
		// OrderProductVO의 값을 가지고 OrderProductDAO의 selectAllBest메서드를 실행시킨 값을 ArrayList에 저장한다.
		request.setAttribute("bestProduct", orist1); // 요청된 orist1값을 bestProduct라는 이름으로 저장해줘 
		request.setAttribute("worstProduct", orist);// 요청된 orist1값을 worstProduct라는 이름으로 저장
		
		
		return forward;
		
		
	}

}
