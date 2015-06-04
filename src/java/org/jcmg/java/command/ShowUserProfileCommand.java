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
public class ShowUserProfileCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        UserBLL userBLL = new UserBLLImpl();
        String userMail = request.getParameter("userMail");
        
        User userQuery = new User();
        userQuery.setMail(userMail);
        
        User user = userBLL.getByMail(userQuery);
        
        request.getSession().setAttribute("userProfile", user);
        
        return "user_profile.jsp";
    }

}
