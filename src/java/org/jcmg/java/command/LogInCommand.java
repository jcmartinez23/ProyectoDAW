package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class LogInCommand extends Command {

    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {
        UserBLL userBLL = new UserBLLImpl();
        User user = (User) request.getSession().getAttribute("user");        
        
        // we get all unread messages        
        List<Message> unreadMessages = new ArrayList<>();
        unreadMessages = userBLL.getMessagesForUser(user, false);
        
        request.getSession().setAttribute("countMessages", unreadMessages.size());
        request.getSession().setAttribute("unreadMessages", unreadMessages);  
        
    }
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {       
        return "profile.jsp";
    }

}
