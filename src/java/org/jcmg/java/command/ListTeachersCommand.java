package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class ListTeachersCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        UserBLL userBLL = new UserBLLImpl();
        
        List<User> teachers = userBLL.findByType('P');
        request.setAttribute("teachers", teachers);
        
        return "teachers.jsp";
    }
}