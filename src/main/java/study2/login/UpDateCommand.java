package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginVO;

public class UpDateCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = new LoginVO();
		
		if(vo.getMid() == null) {
			request.setAttribute("msg", "비밀번호 오류 : 비밀번호를 확인해주세요");
			request.setAttribute("url", request.getContextPath()+"/update.lo");
		}
		
		vo = new LoginVO();
		vo.setMid(mid);
		vo.setName(name);
		
		int res = dao.setUpdateOk(vo);

		if(res != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("sName", name);
			request.setAttribute("msg", mid+"님 정보가 수정되었습니다");
			request.setAttribute("url", request.getContextPath()+"/memberMain.lo");
		} else {
			request.setAttribute("msg", "회원 정보 수정 실패");
			request.setAttribute("url", request.getContextPath()+"/update.lo");
		}			
	}

}
