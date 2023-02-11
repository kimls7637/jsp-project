package controller;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
// 상품 변경 
public class UpdateProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("adminProduct.do");	
		forward.setRedirect(false);

		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();

		//dfdfdf
		@SuppressWarnings("unused") 
		String realFolder = ""; 
		String filename1 = "";

		int maxSize = 1024 * 1024 * 5;

		String encType = "UTF-8";

		String path = request.getSession().getServletContext().getRealPath("untree.co-medio/upload");

		try {
			MultipartRequest multi = new MultipartRequest(request, path, maxSize,encType, new DefaultFileRenamePolicy());
			@SuppressWarnings("rawtypes") 
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			filename1 = multi.getFilesystemName(str);

			realFolder = multi.getOriginalFileName(str);



			pvo.setpName(multi.getParameter("pName"));
			pvo.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
			pvo.setpCnt(Integer.parseInt(multi.getParameter("pCnt")));
			pvo.setpNum(Integer.parseInt(multi.getParameter("pNum")));

			if(filename1!=null) {
				pvo.setpImg("./upload/"+filename1);
			}

		} 
		catch (Exception e) {
			e.printStackTrace();
		}

		pdao.update(pvo);

		return forward;
	}

}
