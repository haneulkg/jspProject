package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/guestDelete")
public class GuestDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestDelete(idx);
		
		PrintWriter outPrintWriter = response.getWriter();
		
		if(res != 0) {
			outPrintWriter.print("<script>");
			outPrintWriter.print("alert('방명록 작성글 삭제 완료');");
			outPrintWriter.print("location.href='"+request.getContextPath()+"/GuestList';");
			outPrintWriter.print("</script>");
		}
		else {
			outPrintWriter.print("<script>");
			outPrintWriter.print("alert('방명록 작성글 삭제 실패');");
			outPrintWriter.print("location.href='"+request.getContextPath()+"/guest/guestInput.jsp';");
			outPrintWriter.print("</script>");
		}
	}
}
