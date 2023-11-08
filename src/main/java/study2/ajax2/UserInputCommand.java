package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInputCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		UserVO vo = new UserVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		UserDAO dao = new UserDAO(); 
		
		String res = dao.getMidSearch(mid);
		
		if(res.equals("0")) {
			response.getWriter().write("이미 존재하는 아이디입니다, 다른 아이디로 가입해주세요");
		} else {
			res = dao.setUserInputOk(vo);
			if(res.equals("0")) response.getWriter().write("회원가입 실패하셨습니다, 다시 가입해주세요");
			else response.getWriter().write(res);
		}
	}

}
