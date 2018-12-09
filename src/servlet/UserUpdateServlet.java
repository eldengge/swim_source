package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Service.userService;

public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private userService usersv=new userService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		String savepath = request.getServletContext().getRealPath("/photo");
		if (!ServletFileUpload.isMultipartContent(request)) {
			return;
		}
		String id = "";
		String oldImg= "";
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("utf-8");
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem fileItem : list) {
				if (fileItem.isFormField()) {
					String name = fileItem.getFieldName();
					String value = fileItem.getString("utf-8");
					if (name.equals("id")) {
						id = value;
					}
					if (name.equals("img")) {
						oldImg = value;
					}
					parameterMap.put(name, value);
				} else {
					if(fileItem.getSize()>0) {
						String filename = UUID.randomUUID().toString()+ id + ".jpg";
						parameterMap.put("img", filename);
						String img = savepath + "\\" + filename;
						InputStream in = fileItem.getInputStream();
						FileOutputStream out = new FileOutputStream(img);
						byte buffer[] = new byte[1024];
						int len = 0;
						while ((len = in.read(buffer)) > 0) {
							out.write(buffer, 0, len);
						}
						//删除旧图
						File f=new File(savepath + "\\" + oldImg);
						f.delete();
						//
						in.close();
						out.close();
						fileItem.delete();
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		usersv.updateUser(parameterMap);
		response.sendRedirect(request.getContextPath()+
				"/UserServlet?method=queryUserMessageById&id="+id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
