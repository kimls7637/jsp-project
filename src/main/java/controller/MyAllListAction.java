package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.orderProduct.OrderProductDAO;
import model.orderProduct.OrderProductVO;
import model.qna.QnaDAO;
import model.qna.QnaVO;
import model.review.ReviewDAO;
import model.review.ReviewVO;

public class MyAllListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp"); 
		forward.setRedirect(false);

		OrderProductDAO odao = new OrderProductDAO();
		OrderProductVO ovo = new OrderProductVO();
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		QnaDAO qdao = new QnaDAO();
		QnaVO qvo = new QnaVO();

		String id = (String)request.getSession().getAttribute("memberId");

		rvo.setrId(id);
		ArrayList<ReviewVO> rList = rdao.selectAllMy(rvo); //null값 세팅을 위해 일단 내 리뷰목록 뽑고.

		ovo.setoId(id);
		
		ArrayList<OrderProductVO> oList = odao.selectAll(ovo);
		ArrayList<HashMap<Integer, Integer>> mapList = new ArrayList<>();
		HashMap<Integer, Integer> hashMap;
		int num =0;
		int cnt =0;
		for(int i = 0; i < oList.size(); i++) { //배열만큼 사이즈 돌아서.
			if(num!=oList.get(i).getoNum()) { //num이 배열리스트의 oNum하고 같이 않으면 true
				if(num!=0) { //num이 0이 아니면 true
					hashMap = new HashMap<>(); //임시 맵 일회용
					hashMap.put(num,cnt); //map에 put을 num,cnt를 해주교.					
					mapList.add(hashMap); //배열리스트에 map을 추가해준다.\
				}
				num = oList.get(i).getoNum(); //num에다가 배열의 oNum을 할당시켜주고.
				cnt = 0; //47째 줄의 조건문이 false가 나면 cnt를 0으로 초기화.
			}
			cnt++; //재고 ++
		}
		hashMap = new HashMap<>();
		hashMap.put(num, cnt);
		mapList.add(hashMap);
		
		request.setAttribute("mapList", mapList);
		qvo.setqId(id);
		ArrayList<QnaVO> qList = qdao.selectAll(qvo);

		request.setAttribute("review", rList);
		request.setAttribute("myOrder", oList);
		request.setAttribute("qnaList",qList);

		return forward;
	}

}