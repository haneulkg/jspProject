package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null ? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String userInfor = request.getParameter("userInfor")==null ? "" : request.getParameter("userInfor");
		
		// 취미 전송에 대한 처리(여러개가 올 수 있기에 배열로 처리하기)
		String[] hobbys = request.getParameterValues("hobby");
		String hobby ="";
		if(hobbys.length != 0) {
			for(String h : hobbys) {
				hobby += h + "|";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("|"));
		
		// Back End체크하기 (DB에 저장된 자료들 중에서 Null값과 길이에 대한 체크하기, 중복체크(아이디, 닉네임)
		
		// 아이디/닉네임 중복체크
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("mse", "이미 사용중인 아이디입니다");
			request.setAttribute("url", "memberJoin.mem");
			return;
		}
		
		vo = dao.getMemberNickCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("mse", "이미 사용중인 닉네임입니다");
			request.setAttribute("url", "memberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화 처리(SHA256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 체크가 모두 킅난 자료들을 VO에 담아서 DB에 저장시기지
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto("noimage.jpg");
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "회원에 가입되셨습니다 \\n다시 로그인 해주세요");
			request.setAttribute("url", "memberLogin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입실패");
			request.setAttribute("url", "memberJoin.mem");
		}
	}

}
