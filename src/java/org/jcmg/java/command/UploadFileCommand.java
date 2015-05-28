package org.jcmg.java.command;

import java.io.File;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class UploadFileCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");

        try {
            URL uploadFolder = request.getServletContext()
                    .getResource("/profileimg");

            FileItemFactory tmp = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(tmp);
            upload.setSizeMax(3070000);

            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = String.valueOf(user.getUserId()) + ".jpg";
                    String filePath = (uploadFolder.getPath() + fileName).substring(0);
                    File uploadedFile = new File(filePath);
                    
                    if (uploadedFile.exists()) {
                        uploadedFile.delete();
                    }
                    
                    // saves the file to upload directory                    
                    item.write(uploadedFile);
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            out.close();
        }

        return "profile.jsp";
    }

}
