package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);
		
		String command = uri.split("/")[uri.split("/").length-1];
		System.out.println("command: " + command);

		ActionForward forward = null; // forward 초기화

		if(command.equals("start.do")) {
			try {
				forward =new StartAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("adminDetail.do")) { // view에서 main.do 부름 
			try {
				forward =new AdminDetailAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if (command.equals("adminProduct.do")) { // view에서 main.do 부름 
			try {
				forward =new AdminProductAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if (command.equals("main.do")) { // view에서 main.do 부름 
			try {
				forward =new WorstProductAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("login.do")) {
			try {
				forward = new LoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("logout.do")) {
			try {
				forward = new LogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("join.do")) {
			try {
				forward = new JoinAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("searchId.do")) { ////////////
			try {
				forward = new SearchIdAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("searchPw.do")) { ///
			try {
				forward = new SearchPwAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("myCart.do")) { ////
			try {
				forward = new ShoppingCartAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("buyOrder.do")) { 
			try {
				forward = new BuyOrderAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("order.do")) { 
			try {
				forward = new OrderAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("myOrder.do")) { 
			try {
				forward = new MyAllListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("qnaList.do")) {
			try {
				forward = new QnaListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("qna.do")) {
			try {
				forward = new QnaDatilAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("myQnA.do")) {
			try {
				forward = new MyQnaAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("insertQnA.do")) {
			try {
				forward = new InsertQnAAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if (command.equals("deleteQnA.do")) {
			try {
				forward = new DeleteQnAAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("insertReview.do")) {
			try {
				forward = new InsertReviewAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("updateReview.do")) {
			try {
				forward = new UpdateReviewAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("updateMem.do")) {
			try {
				forward = new UpdateMemAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("deleteMem.do")) {
			try {
				forward = new DeleteMemAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("search.do")) {
			try {
				forward = new SearchAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("productList.do")) {
			try {
				forward = new ProductListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("productDetail.do")) {
			try {
				forward = new ProductDetailAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("insertProduct.do")) {
			try {
				forward = new InsertProductAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("updateProduct.do")) {
			try {
				forward = new UpdateProductAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("deleteProduct.do")) {
			try {
				forward = new DeleteProductAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("insertPopup.do")) {
			try {
				forward = new InsertPopupAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("adminMain.do")) {
			try {
			forward = new DayPriceAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("deletePopup.do")) {
			try {
			forward = new DeletePopupAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward == null) {
			forward = new ActionForward();
			forward.setPath("/error/error.jsp");
			forward.setRedirect(false);
		}
		if (forward.isRedirect()) { // 리다이렉트
			response.sendRedirect(forward.getPath());
		} else { // 포워드
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
