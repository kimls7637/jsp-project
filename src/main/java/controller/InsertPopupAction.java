package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertPopupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		forward.setPath("adminMain.do");//수정필오ㅛ.
		forward.setRedirect(false);
		
		
		String filename = "";
		
		int maxSize = 1024 * 1024 * 5;
		
		String encType = "UTF-8";
		
		String path = request.getSession().getServletContext().getRealPath("./untree.co-medio/upload");
		
		ServletContext application = request.getSession().getServletContext();
		
		try {
		MultipartRequest multi = new MultipartRequest(request, path, maxSize,encType, new DefaultFileRenamePolicy());
		
		application.setAttribute("popLink", multi.getParameter("popLink"));
		
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();
		
		String str = (String)files.nextElement();
		filename = multi.getFilesystemName(str);
		System.out.println("./upload/"+filename);
		
		if(filename!=null) {
			application.setAttribute("popImg", filename);
		}
		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
