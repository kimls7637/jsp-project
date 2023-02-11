package controller;
//이슬임시ㅇㅅㅇ
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.orderProduct.OrderProductDAO;

// type: 'POST',
// url: 'check',
//  => check라는 URL을 향해 POST방식으로 요청
@WebServlet("/untree.co-medio/Ocheck")
public class OrderCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderCheckController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	// type: 'POST',
	// url: 'check',
	//  => check라는 URL을 향해 POST방식으로 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderProductDAO odao = new OrderProductDAO();
		response.getWriter().print(odao.selectOneMaxoPk(null).getoPk()); // ㅇㅅㅇ
	}

}