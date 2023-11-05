package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/GuestInput")
public class GuestInput extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIpString = request.getRemoteAddr();
		

		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIpString);
		
		int res = dao.setGuestInput(vo);
		
		PrintWriter outPrintWriter = response.getWriter();
		
		if(res !=0) {
			outPrintWriter.print("<script>");
			outPrintWriter.print("alert('방명록 작성이 완료 되었습니다-😊');");
			outPrintWriter.print("location.href='"+request.getContextPath()+"/GuestList';");
			outPrintWriter.print("</script>");
		}
		else {
			outPrintWriter.print("<script>");
			outPrintWriter.print("alert('방명록 작성이 실패 되었습니다-😭');");
			outPrintWriter.print("location.href='"+request.getContextPath()+"/guest/guestInput.jsp';");
			outPrintWriter.print("</script>");
		}
		
	}
}
