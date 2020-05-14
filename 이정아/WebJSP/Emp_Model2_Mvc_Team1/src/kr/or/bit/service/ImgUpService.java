package kr.or.bit.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javafx.application.Application;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class ImgUpService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		
		System.out.println(uploadpath);
	    
		//cos.jar 파일에서 제공하는 MultipartRequest 객체 사용
		
		//업로드 파일에 대한 기본 정보 세팅
		int size = 1024*1024*10; //10M 네이버 계산기
		String name="";
		String title="";
		String filename1="";
		String filename2="";
		String orifilename1="";
		String orifilename2="";
		
		MultipartRequest multi = new MultipartRequest(
				request, //기존에 있는  request 객체의 주소값 
				uploadpath, //실 저장 경로 (배포경로) 위에서 받아온 경로
				size, //10M
				"UTF-8",
				new DefaultFileRenamePolicy() //파일 중복일 때(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경) )
				); //파일 업로드 완료
				
				//여기까지 수행하면 upload 폴더에 파일이 저장
				
				
				//자료실 (게시판])
				//DB insert 실제 원하는 작업
				//작성자 , 제목 , 내용 , 조회수 , [파일명] , 추가 적으로 [파일 사이즈]
				
				name = multi.getParameter("name"); 
				title = multi.getParameter("title");
				String hid = multi.getParameter("hid");
				
				Enumeration filenames = multi.getFileNames();
				//input type="file" name="filename1"  >> filename1
				//input type="file" name="filename2"  >> filename2	
				
				//while(filenames.hasMoreElements()){
				//	System.out.println(filenames.nextElement());  //filename1  ,  filename2
				//}
				
				String file2 = (String)filenames.nextElement();
				filename1 = multi.getFilesystemName(file1); //filename2 //시스템이름
				orifilename1 = multi.getOriginalFileName(file1); //오리지날명
				//out.print("file2  :" + file2);
				//out.print("filename2 :" + filename2);       //a1.jpg
				//out.print("orifilename2 :" + orifilename2); //a.jpg

				
				
				//DB에 저장했다고 가정하고
				//DB 연결
				//insert .... values(?,?,?,?,?,?) ->파일명을 DB에 저장
				//목록보기 이동		
				
				request.setAttribute("name", name);
				request.setAttribute("title", title);
				request.setAttribute("hid", hid);
				
				ActionForward forward = new ActionForward();
				forward.setPath("/WEB-INF/views/img.jsp");
				
				return forward;
				
	}

}
