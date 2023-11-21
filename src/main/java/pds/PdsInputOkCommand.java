package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 파일의 최대용량을 30MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// DefaultFileRenamePolicy : 파일명이 중복되는 경우 자동으로 숫자를 붙여 서버에 저장되는 파일명의 중복을 배제함
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration  fileNames = multipartRequest.getFileNames(); // 여러개 파일을 가져올 경우 : getFileNames()사용함

		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		//System.out.println("서버의 저장경로 : " + realPath);
		
		while(fileNames.hasMoreElements()) { // 자료가 있으면 true -> 값을 읽을 수 있음
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) { 					  // getFilesystemName() 서버에 저장된 파일명
				originalFileName += multipartRequest.getOriginalFileName(file)+"/";   // 원본 파일명
				filesystemName += multipartRequest.getFilesystemName(file)+"/";       // 서버에 저장된 파일명
			}
			
		}
		originalFileName = originalFileName.substring(0, originalFileName.length()-1);
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
//		System.out.println("원본 파일명 : " + originalFileName);
//		System.out.println("서버에 저장된 파일명 : " + filesystemName);
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		// 업로드시킨 파일을 DB에 저장시키기 위해서 전송된 폼의 내용들을 모두 변수에 받아준다
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String part = multipartRequest.getParameter("part")==null ? "" : multipartRequest.getParameter("part");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String openSw = multipartRequest.getParameter("openSw")==null ? "" : multipartRequest.getParameter("openSw");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp")==null ? "" : multipartRequest.getParameter("hostIp");
		
		// 비밃번호 암호화(SHA256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 가공처리된 모든 자료들을 VO에 담아서 DB로 넘겨준다
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "자료실에 자료가 업로드 되었습니다");
			request.setAttribute("url", "pdsList.pds");
		}
		else {
			request.setAttribute("msg", "자료실 업로드 실패");
			request.setAttribute("url", "pdsInput.pds");
		}
	}

}
