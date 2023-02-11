package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review.ReviewDAO;
import model.review.ReviewVO;

public class InsertReviewAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ActionForward forward = new ActionForward();
      forward.setPath("myOrder.do"); //수정필요.
      forward.setRedirect(false);
      ReviewDAO rdao = new ReviewDAO();
      ReviewVO rvo = new ReviewVO();
      
      System.out.println(request.getParameter("rating"));
      rvo.setrPNum(Integer.parseInt(request.getParameter("pNum")));
      rvo.setrGrade( request.getParameter("rating"));
      rvo.setrContent(  request.getParameter("content"));
      rvo.setrId(  (String)request.getSession().getAttribute("memberId"));
      
      rdao.insert(rvo);
      
      return forward;
   }

}