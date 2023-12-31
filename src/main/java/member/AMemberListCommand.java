package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AMemberListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 999 : Integer.parseInt(request.getParameter("level"));
		MemberDAO dao = new MemberDAO();
		
		//ArrayList<MemberVO> vos = dao.getMemberList();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = request.getParameter("pageSize")==null ? 2 : Integer.parseInt(request.getParameter("pageSize"));
		
		// int totRecCnt = dao.getTotRecCntAd();
		int totRecCnt = dao.getTotRecCnt(level);
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1 ;
		
		int startIndexNo = (pag - 1) * pageSize;
		
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		
		int curBlock = (pag -1) / blockSize;
		
		int lastBlock = (totPage-1) / blockSize;
		
		ArrayList<MemberVO> vos = dao.getMemberList(startIndexNo, pageSize, level);
		
		
		request.setAttribute("vos", vos);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("pag", pag);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
