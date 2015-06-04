package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class ChangePasswordCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        
        String newPassword = request.getParameter("newPassword");
        user.setPassword(newPassword);
        
        UserBLL userBLL = new UserBLLImpl();
        userBLL.update(user);
        
        return "profile.jsp";
    }

}
