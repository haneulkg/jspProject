package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO1;

public class DeleteOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setDeleteOk(mid);

		if(res != 0) {
			session.invalidate();
			dao.connClose();
			request.setAttribute("msg", mid+"님 탈퇴 되셨습니다");
			request.setAttribute("url", "login.lo");
		} else {
			request.setAttribute("msg", "회원 탈퇴 실패");
			request.setAttribute("url", "memberMain.lo");
		}	

	}

}
