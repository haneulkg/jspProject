package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import study2.ajax3.LoginDAO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		// idSave체크박스 받지 않음
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(!vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디가 틀립니다, 확인 후 다시 입력해주세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호가 틀립니다, 확인 후 다시 입력해주세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		
		// 로그인 성공시 처리할 내용 (1.세션저장|2.쿠키저장|3.방문횟수증가(총,오늘)|4.포인트저장(증가)
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		
		// 처리 완료 후 메세지 출력후 회원 메인창으로 전송하기
		request.setAttribute("msg","환영합니다 : "+mid+"님 로그인 되었습니다-😀");
		request.setAttribute("url", "memberMain.mem");
	}

}
