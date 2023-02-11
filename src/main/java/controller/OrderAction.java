package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;
import model.product.ProductDAO;
import model.product.ProductVO;

public class OrderAction implements Action{
   // 주문하기 
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ActionForward forward = new ActionForward();
      forward.setPath("main.do"); //교체 예정.
      forward.setRedirect(false);
      System.out.println("에러가왜날까용");
      OrderProductDAO odao = new OrderProductDAO();
      ProductDAO pdao = new ProductDAO();
      String address = request.getParameter("ad1") + request.getParameter("ad2");


      int oNumber = odao.selectOneMaxoNum(null).getoNum();

      String[] value = request.getParameterValues("buyPk");
      String[] value2 = request.getParameterValues("buyCnt");
      
      for(int i = 0; i < value.length; i++) {
         ProductVO pvo = new ProductVO();
         pvo.setpNum(Integer.parseInt(value[i]));
         pvo.setpCnt(Integer.parseInt(value2[i]));
         int n = pdao.selectOne(pvo).getpCnt();
         int n2 = Integer.parseInt(value2[i]);
         pvo.setpCnt(n - n2);
         pdao.updateCnt(pvo);
      }
      

      for(int i = 0; i < value.length; i++) {
         OrderProductVO ovo = new OrderProductVO();
         ovo.setoNum(oNumber);
         ovo.setoId((String)request.getSession().getAttribute("memberId"));
         ovo.setoName(request.getParameter("oName")); // 이게 널이래
         ovo.setoPhone(request.getParameter("oPhone"));
         ovo.setoAddress(address);
         ovo.setoMsg(request.getParameter("oMsg"));
         ovo.setoPNum(Integer.parseInt(value[i]));
         ovo.setoCnt(Integer.parseInt(value2[i]));
         odao.insert(ovo);
      }

      return forward;


   }

}