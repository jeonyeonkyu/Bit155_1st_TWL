package kr.or.bit.service;

import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class ImgDownService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
	    
	    //다운로드할 파일명 얻기
	    String filename = request.getParameter("file_name");
	    
	    //물리적 경로 얻기
	    String savepath = "upload";
	    String downloadpath = request.getSession().getServletContext().getRealPath("upload");
	    String FilePath = downloadpath + "\\" + filename;
	    
	    //out.print(downloadpath +"<br>");
	    //out.print(FilePath); //실경로 + 파일명
	    
	    
	    //IO작업 하기
	    
	    //파일을 읽어서 출력
	    byte[] b = new byte[4096]; //4kb  //요기는 필요에 따라 조정 가능
	    FileInputStream in = new FileInputStream(FilePath); //실 저장 경로에서
	    
	    //실제 인지할수 있는 타입의 파일들이면 자신의 => contentType
	    //application이 인지할 수 없는 확장자 파일은 null 경우에 형식을 잡아준다
	    String sMimeType = request.getSession().getServletContext().getMimeType(FilePath); //파일의 타입 정보에 대한 것을 지정해줘야 함
	    if(sMimeType == null){ //MimeType이 형식들을 가지고 있음. 만약 이 마임타입이 가지고 있지 않은 형식이라면
	     //알수 없는 형식의 파일은 
	     //application/octet-stream 기본값으로 (알수 없는 파일 형식)
	     sMimeType = "application/octet-stream";
	    }
	    
	    //2. client 전달되는 형식을 지정(Type)
	    //response.setContentType("text/html;charset=UTF-8");  html 파일인 경우
	    response.setContentType(sMimeType);
	    
	    //3. 인코딩 처리(한글 : 파일이 가지고 있는 한글에 대한 처리)
	     //String SEncoding = new String(filename.getBytes("utf-8"),"utf-8");
	     //out.println("SEncoding : " + SEncoding);
	    
	    //4. 다운로드(기본 설정) 구현
	    //response.setCharacterEncoding("euc-kr");
	    //response.setHeader("Content-Disposition","attachment;filename="+SEncoding); attachment는 브라우저에게 받으라고 명령하는 것
	    //파일 다운로드를 위한 헤더 정보 수정 (파일이름 문자열 다시 인코딩)
	    response.setHeader("Content-Disposition", 
	           "attachment;filename="+new String(filename.getBytes(),"ISO8859_1"));   //filename.getBytes(),"ISO8859_1") ->한글 깨짐 방지 위해 인코딩코드 추가
	    //문서를 읽어 들여서 ISO8859_1 형식으로 변환 ......



	    //5. 파일 출력하기(클라이언트의 브라우저에 처음에 선언한 byte배열의 크기만큼)
	    ServletOutputStream out2 = response.getOutputStream();
	    int numread;
	    while((numread = in.read(b,0,b.length)) != -1){
	       out2.write(b,0,numread);
	    }
	    
	    out2.flush();
	    out2.close();
	    in.close(); 
	    return null;
	}
	
}
