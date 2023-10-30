package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test8Ok")
public class Test8Ok extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		/*
		String name = request.getParameter("name");
		if(name == null) name = "";
		
		String ageStr =request.getParameter("age");
		int age = 0;
		if(ageStr == null || ageStr.equals("")) age = 0;
		*/
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt( request.getParameter("age"));
		
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		
		//String hobby = request.getParameter("hobby")==null ? "": request.getParameter("hobby");
		String[] hobbys = request.getParameterValues("hobby");
		
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		/*
		 * if(age < 20) { PrintWriter out = response.getWriter();
		 * out.println("<script>"); 
		 * out.println("alert('미성년자는 가입할 수 없습니다.')");
		 * out.println("history.back();"); 
		 * out.println("</script>"); 
		 * }
		 */		
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			out.println("<script>");
			out.println("alert('입력자료가 잘못되었습니다, 확인 후 다시 가입해주세요.')");
			out.println("history.back();");
			out.println("</script>");
			// return;
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
			out.println("<script>");
			out.println("alert('😀 회원 가입 성공 😀');");
			out.println("location.href='"+request.getContextPath()+"/study/1026/test8.jsp';");
			out.println("</script>");
		}
		
	}
	
}
