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
public class UpdateUserCommand extends Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        final String NO_VALUE = "Sin especificar";
        
        User user = (User) request.getSession().getAttribute("user");
        String localization = request.getParameter("localization");
        String phoneNumber = request.getParameter("phoneNumber");
        String pastimes = request.getParameter("pastimes");
        String jobPosition = request.getParameter("jobPosition");
        String aboutMe = request.getParameter("aboutMe");
        
        user.setLocation(localization.equals(NO_VALUE) ? null : localization);
        user.setPhone(phoneNumber);
        user.setPastimes(pastimes.equals(NO_VALUE) ? null : pastimes);
        user.setJobPosition(jobPosition.equals(NO_VALUE) ? null : jobPosition);
        user.setAboutMe(aboutMe.equals(NO_VALUE) ? null : aboutMe);
        
        UserBLL userBLL = new UserBLLImpl();
        userBLL.update(user);       

        return "profile.jsp";
    }

}
