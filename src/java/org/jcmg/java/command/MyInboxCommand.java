package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.MessageBLLImpl;
import org.jcmg.java.interfaces.MessageBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class MyInboxCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {        
        MessageBLL messageBLL = new MessageBLLImpl();
        User user = (User) request.getSession().getAttribute("user");
        
        List<Message> messages = messageBLL.findByUser(user, Boolean.TRUE);
        request.getSession().setAttribute("messages", messages);
        
        return "inbox.jsp";
    }
    
}
