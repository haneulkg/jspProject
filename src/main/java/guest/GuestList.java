package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/GuestList")
public class GuestList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 현재 Page번호 구하기
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = request.getParameter("pageSize")==null ? 2 : Integer.parseInt(request.getParameter("pageSize")); 
		
		// 2. 한 페이지의 분량 결정하기
		//int pageSize = 5;
		 
		// 3. 총 레코드 건수 구하기 (sql명령어 - count함수 사용)
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 페이지 건수 구하기
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1 ;
		
		// 5. 현재 페이지에 출력할 시작 인덱스번호 구하기
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시될 시작번호 구하기
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 7. 블록페이지 처리하기 (시작블록의 번호를 0번으로 처리)
		// 1. 블록의 크기지정(여기선 3으로 지정함)
		int blockSize = 3;
		
		// 2. 현재페이지가 속한 블록 번호 구하기(예:총레코드갯수 38개일경우, 1/2/3페이지는 0블록, 4/5/6페이지는 1블록)
		int curBlock = (pag -1) / blockSize;
		
		// 3. 마지막 블록 구하기
		int lastBlock = (totPage-1) / blockSize;
		
		// 지정된 페이지의 자료를 요청한 한페이지의 분량만큼 가져온다
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("pag", pag);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		
		String viewPage = "/guest/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
