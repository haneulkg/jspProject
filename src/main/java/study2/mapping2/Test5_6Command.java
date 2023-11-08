package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5_6Command implements TestReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 각종 서비스(작업) 처리하기
		
		
		// 작업 완료 후 메세지 처리하기
		//String msg = "이곳은 서비스 작업 완료 후 메세지를 담아서 보냅니다 😁";
		
		request.setAttribute("msg", "이곳은 서비스 작업 완료 후 메세지를 담아서 보냅니다 😁");
		request.setAttribute("url", request.getContextPath()+"/test5.re");
	}

}
