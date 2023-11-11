package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class adminNewMemberCntCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = 1;
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getMemberLevelSearch(level);
		
		request.setAttribute("newMember", vos.size());
	}

}
