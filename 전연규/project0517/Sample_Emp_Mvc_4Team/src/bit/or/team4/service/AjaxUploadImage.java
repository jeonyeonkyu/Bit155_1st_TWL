package bit.or.team4.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bit.or.team4.action.Action;
import bit.or.team4.action.ActionForward;

public class AjaxUploadImage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		response.setContentType("text/html");
		try {
			PrintWriter out = response.getWriter();
			
			Part part = request.getPart("imageData");
			
			String appPath = request.getServletContext().getRealPath("");
			String imagePath = appPath+"";
			
			File filedir = new File(imagePath);
			if(!filedir.exists()) {
				filedir.mkdir();
			}
			
			String imageName = part.getSubmittedFileName();
			
	        if(validateImage(imageName)){
	            try{
	                part.write(imagePath + File.separator + imageName);
	                out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	            out.print("<h1>Invalid Image Format</h1>");
	        }
		} catch (Exception e) {

		}
		System.out.println("oh");
		return forward;
	}

    private boolean validateImage(String imageName){
        String fileExt = imageName.substring(imageName.length()-3);
        if("jpg".equals(fileExt) || "png".equals(fileExt) || "gif".equals(fileExt))
            return true;
         
        return false;
    }

}
