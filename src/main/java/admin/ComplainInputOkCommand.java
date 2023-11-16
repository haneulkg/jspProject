package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class ComplainInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String cpMid = request.getParameter("cpMid")==null ? "" : request.getParameter("cpMid");
		String cpContent = request.getParameter("cpContent")==null ? "" : request.getParameter("cpContent");

		BoardDAO dao = new BoardDAO();
		
		int res = dao.setComplaintInputOk(part,partIdx,cpMid,cpContent);
	
		response.getWriter().write(res+"");
//		System.out.println("part : " + part);
//		System.out.println("partIdx : " + partIdx);
//		System.out.println("cpMid : " + cpMid);
//		System.out.println("cpContent : " + cpContent);
	}

}
