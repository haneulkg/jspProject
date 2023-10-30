package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test11Ok")
public class Test11Ok extends HttpServlet{
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
		if(name.equals("") || age < 20) {
			// 가입조건을 만족시키지 못했을 경우 다시 가입창으로 전송시켜주기
			response.sendRedirect(request.getContextPath()+"/study/1026/test11.jsp?flag=no");
		}
		else {
			// 가입조건에 만족했을 경우 DB에 저장시키고 회원 메인창(test10Res.jsp)으로 이동시키기
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
			System.out.println("직업 : "+job);
			
//			response.sendRedirect(request.getContextPath()+"/study/1026/test11Res.jsp?name="+name+"&age="+age+"&gender="+gender+"&hobby="+hobby+"&job="+job);  // Front의 location.href방식과 같은 방식임
			
			// request 저장소에 전송하려고 하는 자료들을 모두 담아주기 : request("변수명", 전송값)
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);
			request.setAttribute("hobby", hobby);
			request.setAttribute("job", job);
			
			String viewPage = "/study/1026/test11Res.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}
	
}
