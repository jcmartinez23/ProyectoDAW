package org.jcmg.java.command;

import java.security.SecureRandom;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class AddUserCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User newUser = new User();
        newUser.setMail(request.getParameter("mail"));
        newUser.setFirstName(request.getParameter("firstName"));
        newUser.setLastName(request.getParameter("lastName"));
        newUser.setPhone(request.getParameter("phone"));
        newUser.setUserType(request.getParameter("userType").charAt(0));
        
        String passwordRandom = Long.toHexString(Double.doubleToLongBits(Math.random()));
        newUser.setPassword(passwordRandom);
        
        UserBLL userBLL = new UserBLLImpl();
        userBLL.save(newUser);
        
        if (request.getParameter("userType").charAt(0) == 'P') {
            // INSERTAR PROFESOR
        }
        
        return "profile.jsp";
    }

}
