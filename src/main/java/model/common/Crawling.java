package model.common;

import java.io.IOException;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import model.product.ProductDAO;
import model.product.ProductVO;

public class Crawling {

	//데이터 확보 카운트
	public static void startWeb() {
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();

		//db에 데이터가 없을 경우만 크롤링 
		if(pdao.checkData(pvo)) {
			//테이블
			crawling("http://www.helinoxstore.co.kr/shop/shopbrand.html?type=M&xcode=001&mcode=007",175000,"테이블");
			//체어
			crawling("http://www.helinoxstore.co.kr/shop/shopbrand.html?type=M&xcode=001&mcode=005",220000,"체어");
			//백팩
			crawling("http://www.helinoxstore.co.kr/shop/shopbrand.html?type=M&xcode=005&mcode=002",111000,"백팩");
			//텐트
			crawling("http://www.helinoxstore.co.kr/shop/shopbrand.html?type=M&xcode=003&mcode=008",1650000,"텐트");   
		}

	}

	//파라미터:각 상품 url, soldout시 임의가격, 카테고리
	public static void crawling(String urlStr,int price,String Cate) {

		// 타겟 사이트
		final String url=urlStr;
		final String mainUrl="http://helinoxstore.co.kr";
		//db에 데이터가 없을 경우만 크롤링 
		//변수초기화
		String imgStr =null;
		String imgUrl=null;
		String strName=null;
		String strPrice=null;

		// <!DOCTYPE html>
		// 1개의 화면 == 1개의 웹 페이지 == 1개의 Document
		//사진
		Document doc=null;
		//이름
		Document doc1=null;
		//가격
		Document doc2=null;
		try {
			doc=Jsoup.connect(url).get();
			doc1=Jsoup.connect(url).get();
			doc2=Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//상품사진 화면에 있는 사진만큼 size가 늘어남
		Elements eles = doc.select("#productClass > div.page-body > div.item-wrap > div> dl> dt > a > img");
		//상품이름
		Elements eles1=doc1.select("div.item-cont > dl > dd > ul > li > a");
		Iterator<Element> itr1=eles1.iterator();
		//상품가격
		Elements eles2=doc2.select("#productClass > div.page-body > div.item-wrap > div > dl > dd > ul > li.prd-price > span");
		Iterator<Element> itr2=eles2.iterator();

		int i = 1; // 데이터 카운트용
		int pPrice;

		//화면에있는 상품사진갯수만큼 eles가있으므로 foreach로반복
		for(Element e : eles){
			imgStr=String.valueOf(e.attr("src"));
			//최종 사진url
			imgUrl= mainUrl+imgStr;
			strName=itr1.next().text();
			//상품명 앞에 헬리녹스가있을시 제거 replace
			strName=strName.replace("헬리녹스 ", "");
			//솔드아웃일경우 span 테그가 아닌 p테그에 있으므로
			//NoSuchElementException 에러를 회피하기 위한 try/catch 을 통한 임시가격 세팅
			try {
				strPrice=itr2.next().text();
				//13,000원 으로 출력 되므로
				//(,)이랑(원)제거
				strPrice= strPrice.replaceAll("[,원]", "");
				pPrice=Integer.parseInt(strPrice);
			} catch (java.util.NoSuchElementException e1) {
				//프린트 삭제
				//e1.printStackTrace();
				pPrice=price;
			}

			ProductDAO pdao = new ProductDAO();
			ProductVO pvo = new ProductVO();         
			//pvo에 set
			pvo.setpImg(imgUrl);
			pvo.setpName(strName);
			pvo.setpPrice(pPrice);
			pvo.setpCate(Cate);
			//클로링시 상품수는 5개 고정으로 세팅해준다
			pvo.setpCnt(5);         
			pdao.insert(pvo);         
			//샘플 상품이 6개일경우 종료
			if(i==6) {
				return;
			}     
			i++;
		}
	}
}