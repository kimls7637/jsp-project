package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product.ProductDAO;
import model.product.ProductVO;

import javax.servlet.ServletContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 // 상품 추가 
public class InsertProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("adminProduct.do");	
		forward.setRedirect(false);
		
		ProductDAO pdao = new ProductDAO();
		ProductVO pvo = new ProductVO();
		
				@SuppressWarnings("unused") 
				String realFolder = ""; 
				String filename1 = "";
				
				int maxSize = 1024 * 1024 * 5;
				
				String encType = "UTF-8";
				
				String path = request.getSession().getServletContext().getRealPath("untree.co-medio/upload");
				
				ServletContext application = request.getSession().getServletContext();
				try {
				MultipartRequest multi = new MultipartRequest(request, path, maxSize,encType, new DefaultFileRenamePolicy());
				application.setAttribute("popLink", multi.getParameter("popLink"));
				@SuppressWarnings("rawtypes") 
				Enumeration files = multi.getFileNames();
				String str = (String)files.nextElement();
				filename1 = multi.getFilesystemName(str);
				
				realFolder = multi.getOriginalFileName(str);
				
				pvo.setpName(multi.getParameter("pName"));
				pvo.setpImg("./upload/"+filename1);
				pvo.setpCate(multi.getParameter("pCate"));
				pvo.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
				pvo.setpCnt(Integer.parseInt(multi.getParameter("pCnt")));
				
				
				
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
				
				

				

				
				pdao.insert(pvo);
				
				
				return forward;
			}

		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

			