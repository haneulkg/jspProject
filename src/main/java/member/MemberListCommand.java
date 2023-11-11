package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		//ArrayList<MemberVO> vos = dao.getMemberList();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = request.getParameter("pageSize")==null ? 2 : Integer.parseInt(request.getParameter("pageSize"));
		
		int totRecCnt = dao.getTotRecCntAd();
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1 ;
		
		int startIndexNo = (pag - 1) * pageSize;
		
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		
		int curBlock = (pag -1) / blockSize;
		
		int lastBlock = (totPage-1) / blockSize;
		
		ArrayList<MemberVO> vos = dao.getGuestList2(startIndexNo, pageSize);
		
		//request.setAttribute("vos", vos);
		
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
