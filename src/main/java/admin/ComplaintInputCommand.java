package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ComplaintInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String partStr = "";
		
		if(part.equals("board")) partStr = "게시판";
		else if (part.equals("guest")) partStr = "방명록";
		else partStr = "자료실";
			
		
		
		request.setAttribute("part", part);
		request.setAttribute("partStr", partStr);
		request.setAttribute("partIdx", partIdx);
		request.setAttribute("title", title);
	}

}
