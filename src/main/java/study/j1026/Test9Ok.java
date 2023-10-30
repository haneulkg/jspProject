package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test9Ok")
public class Test9Ok extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// Front에서 넘어온 값을 변수에 담아주기
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt( request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		// 기본적으로 다시 체크해야할 것들 체크하기(잘못된 자료:돌려보냄, 정상인 자료:DB에 저장시킴)
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			out.println("<script>");
			out.println("alert('입력자료가 잘못되었습니다, 확인 후 다시 가입해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			// DB에 저장시키기
			System.out.println("성명 : "+name);
			System.out.println("나이 : "+age);
			System.out.println("성별 : "+gender);
			System.out.println("직업 : "+job);
			String hobby = "";
			for(String h : hobbys) {
				System.out.println("취미 : "+h);
				hobby += h + "/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
			System.out.println("취미 : "+hobby);
			
			// DB에 저장완료 후 jsp로 이동처리하기
//			out.println("<script>");
//			out.println("alert('😀 회원 가입 성공 😀');");
//			out.println("location.href='"+request.getContextPath()+"/study/1026/test8.jsp';");
//			out.println("</script>");
			
//			response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag=ok");  // Front의 location.href방식과 같은 방식임
			
			// 한글인 경우 : 인코딩문제로 브라우저에서 에러로 체크가 됨
			name = URLEncoder.encode(name, "utf-8");
			response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag="+name);  // Front의 location.href방식과 같은 방식임
		}
		
	}
	
}
