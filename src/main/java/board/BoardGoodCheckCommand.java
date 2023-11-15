package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Integer> goodCheck = (ArrayList<Integer>) session.getAttribute("sGoodCheck");
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요수 증가처리
		if(goodCheck != null) {
			for(int i=0; i<goodCheck.size(); i++) {
		//		if(goodCheck == idx) {
				}
			}
		}
		//else {
	 	//  int res = dao.setBoardGoodCheck(idx);

		//	if(res!=0) {
		//		goodCheck.add(idx);
			//}
		//}
		
		
		//session.setAttribute("sGoodCheck", goodCheck); 
		
		//response.getWriter().write(res);
	//}

}
